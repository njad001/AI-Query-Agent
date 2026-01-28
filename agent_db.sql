--
-- PostgreSQL database dump
--

\restrict sxePPCB6dTUhWw8NjjixmmXLVvsVYzGmomVELzZ7H7EQKz8GCD16A8UHqmyoK3E

-- Dumped from database version 16.11
-- Dumped by pg_dump version 16.11

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: orders; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.orders (
    id integer NOT NULL,
    user_id integer,
    amount numeric(10,2),
    created_at date NOT NULL
);


ALTER TABLE public.orders OWNER TO postgres;

--
-- Name: orders_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.orders_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.orders_id_seq OWNER TO postgres;

--
-- Name: orders_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.orders_id_seq OWNED BY public.orders.id;


--
-- Name: users; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.users (
    id integer NOT NULL,
    name text NOT NULL,
    email text NOT NULL,
    created_at date NOT NULL
);


ALTER TABLE public.users OWNER TO postgres;

--
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.users_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.users_id_seq OWNER TO postgres;

--
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.users_id_seq OWNED BY public.users.id;


--
-- Name: orders id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orders ALTER COLUMN id SET DEFAULT nextval('public.orders_id_seq'::regclass);


--
-- Name: users id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users ALTER COLUMN id SET DEFAULT nextval('public.users_id_seq'::regclass);


--
-- Data for Name: orders; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.orders (id, user_id, amount, created_at) FROM stdin;
1	1	150.00	2025-01-15
2	1	200.00	2025-02-01
3	2	75.50	2025-01-20
24	1	120.50	2025-01-05
25	2	75.00	2025-01-06
26	3	220.99	2025-01-07
27	4	180.00	2025-01-08
28	5	95.25	2025-01-09
29	6	310.40	2025-01-10
30	7	45.99	2025-01-11
31	8	500.00	2025-01-12
32	9	60.75	2025-01-13
33	10	140.30	2025-01-14
34	11	275.00	2025-01-15
35	12	89.99	2025-01-16
36	13	410.10	2025-01-17
37	14	135.60	2025-01-18
38	15	70.00	2025-01-19
39	16	255.45	2025-01-20
40	17	190.00	2025-01-21
41	18	330.75	2025-01-22
42	19	99.99	2025-01-23
43	20	150.00	2025-01-24
44	1	70.24	2026-01-06
45	2	402.60	2026-01-08
46	3	170.43	2026-01-18
47	4	239.92	2026-01-23
48	5	200.48	2026-01-18
49	6	59.47	2025-12-31
50	7	374.48	2026-01-22
51	8	180.91	2025-12-30
52	9	166.40	2026-01-19
53	10	260.40	2026-01-11
54	11	101.75	2026-01-12
55	12	256.57	2026-01-01
56	13	316.21	2025-12-25
57	14	299.46	2026-01-04
58	15	409.93	2026-01-12
59	16	347.58	2025-12-31
60	17	95.55	2026-01-19
61	18	151.05	2025-12-28
62	19	434.17	2026-01-13
63	20	105.21	2025-12-27
64	21	182.91	2026-01-15
65	22	92.73	2026-01-11
66	23	152.68	2026-01-04
67	1	243.51	2026-01-14
68	2	361.12	2026-01-11
69	3	164.56	2026-01-04
70	4	325.73	2026-01-16
71	5	189.91	2026-01-06
72	6	181.86	2026-01-21
73	7	132.24	2026-01-17
74	8	241.86	2026-01-06
75	9	135.74	2025-12-27
76	10	135.14	2025-12-29
77	11	151.62	2026-01-10
78	12	300.61	2026-01-18
79	13	359.79	2026-01-02
80	14	206.37	2025-12-27
81	15	424.02	2026-01-05
82	16	312.99	2026-01-06
83	17	371.79	2025-12-26
84	18	347.01	2026-01-16
85	19	254.89	2025-12-30
86	20	189.13	2026-01-17
87	21	75.45	2025-12-27
88	22	395.95	2026-01-09
89	23	218.15	2026-01-08
90	1	64.49	2025-12-27
91	2	261.27	2026-01-16
92	3	103.43	2026-01-07
93	4	177.22	2026-01-10
94	5	212.13	2026-01-13
95	6	420.58	2026-01-01
96	7	297.89	2026-01-05
97	8	445.78	2026-01-13
98	9	144.88	2026-01-17
99	10	392.51	2026-01-21
100	11	372.98	2025-12-26
101	12	295.29	2026-01-12
102	13	275.21	2026-01-13
103	14	323.82	2026-01-01
104	15	96.05	2026-01-06
105	16	333.06	2026-01-11
106	17	405.96	2026-01-14
107	18	276.29	2025-12-29
108	19	391.95	2026-01-19
109	20	277.37	2026-01-09
110	21	61.43	2026-01-12
111	22	382.97	2026-01-13
112	23	213.98	2026-01-15
\.


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.users (id, name, email, created_at) FROM stdin;
1	Alice	alice@example.com	2025-01-05
2	Bob	bob@example.com	2025-01-10
3	Charlie	charlie@example.com	2025-02-02
4	Alice Johnson	alice.johnson@example.com	2025-01-01
5	Bob Smith	bob.smith@example.com	2025-01-02
6	Charlie Brown	charlie.brown@example.com	2025-01-03
7	Diana Prince	diana.prince@example.com	2025-01-04
8	Ethan Hunt	ethan.hunt@example.com	2025-01-05
9	Fiona Adams	fiona.adams@example.com	2025-01-06
10	George Miller	george.miller@example.com	2025-01-07
11	Hannah Lee	hannah.lee@example.com	2025-01-08
12	Ian Wright	ian.wright@example.com	2025-01-09
13	Jane Doe	jane.doe@example.com	2025-01-10
14	Kevin Hart	kevin.hart@example.com	2025-01-11
15	Laura Palmer	laura.palmer@example.com	2025-01-12
16	Michael Scott	michael.scott@example.com	2025-01-13
17	Nina Lopez	nina.lopez@example.com	2025-01-14
18	Oscar Wilde	oscar.wilde@example.com	2025-01-15
19	Paula White	paula.white@example.com	2025-01-16
20	Quincy Jones	quincy.jones@example.com	2025-01-17
21	Rachel Green	rachel.green@example.com	2025-01-18
22	Steve Rogers	steve.rogers@example.com	2025-01-19
23	Tina Turner	tina.turner@example.com	2025-01-20
\.


--
-- Name: orders_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.orders_id_seq', 112, true);


--
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.users_id_seq', 23, true);


--
-- Name: orders orders_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orders
    ADD CONSTRAINT orders_pkey PRIMARY KEY (id);


--
-- Name: users users_email_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key UNIQUE (email);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- Name: orders orders_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orders
    ADD CONSTRAINT orders_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(id);


--
-- PostgreSQL database dump complete
--

\unrestrict sxePPCB6dTUhWw8NjjixmmXLVvsVYzGmomVELzZ7H7EQKz8GCD16A8UHqmyoK3E

