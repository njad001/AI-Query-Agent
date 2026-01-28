# Import necessary libraries
from langgraph.graph import StateGraph
from typing import TypedDict
from langchain_groq import ChatGroq
from dotenv import load_dotenv
import os
from db import run_query

load_dotenv()

# Define the state structure used by the agent
class AgentState(TypedDict):
    question: str
    sql: str
    result: str
    answer: str
    history: list[str]

# Initialize the LLM
llm = ChatGroq(
    model="llama-3.3-70b-versatile",
    temperature=0,
)

# Example database schema for the agent to reference
DB_SCHEMA = """
users(id, name, email)
orders(id, user_id, product, amount, created_at)
"""


# Node functions for the StateGraph
def generate_sql(state: AgentState):
    history_text = "\n".join(state.get("history", []))

    prompt = f"""
You are a PostgreSQL expert.
Use the conversation history to understand follow-up questions.

Conversation history:
{history_text}

Database schema:
{DB_SCHEMA}

Rules:
- Write ONLY valid SQL
- Use ONLY SELECT statements
- No markdown, no explanations

User question:
{state['question']}
"""

    sql = llm.invoke(prompt).content.strip()
    sql = sql.replace("```sql", "").replace("```", "").strip()

    return {"sql": sql}


def execute_sql(state: AgentState):
    result = run_query(state["sql"])
    return {"result": result}


def explain_result(state: AgentState):
    """
    Explain the SQL result in plain English.
    If the query returns no meaningful data, inform the user.
    """
    # Check if result is empty or contains only zeros/None
    if not state["result"] or all(v in (0, None, '') for row in state["result"] for v in row):
        answer = "Sorry, this information is not available in the database."
    else:
        prompt = f"""
Explain the SQL result below in clear, simple English.

Question:
{state['question']}

SQL Result:
{state['result']}
"""
        answer = llm.invoke(prompt).content.strip()

    # Update conversation history
    new_history = state.get("history", [])
    new_history.append(f"Q: {state['question']}")
    new_history.append(f"A: {answer}")

    return {
        "answer": answer,
        "history": new_history
    }


# Build the StateGraph
graph = StateGraph(AgentState)

graph.add_node("generate_sql", generate_sql)
graph.add_node("execute_sql", execute_sql)
graph.add_node("explain_result", explain_result) 

graph.set_entry_point("generate_sql")
graph.add_edge("generate_sql", "execute_sql")
graph.add_edge("execute_sql", "explain_result")

app = graph.compile()

state = {
    "history": []
}


# Interactive CLI loop
print("💬 SQL Agent is ready. Type 'exit' to quit.\n")

while True:
    question = input("Ask a question: ")

    if question.lower() in {"exit", "quit"}:
        print("👋 Goodbye!")
        break

    state["question"] = question

    response = app.invoke(state)

    print("\n💬 Answer:")
    print(response["answer"])
    print("-" * 40)
