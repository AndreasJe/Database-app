--
-- PostgreSQL database dump
--

-- Dumped from database version 14.1
-- Dumped by pg_dump version 14.1

-- Started on 2021-12-15 17:17:47

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
-- TOC entry 212 (class 1259 OID 16799)
-- Name: course; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.course (
    course_title character varying(100),
    course_brief character varying(250),
    instructor_id bigint,
    num_of_chapters integer,
    id integer NOT NULL,
    created_log date,
    updated_log date
);


ALTER TABLE public.course OWNER TO postgres;

--
-- TOC entry 214 (class 1259 OID 16811)
-- Name: course_chapter; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.course_chapter (
    course_id bigint NOT NULL,
    chapter_title character varying(100),
    content_reading boolean,
    content_video boolean,
    content_assignment boolean,
    id integer NOT NULL,
    required_time smallint
);


ALTER TABLE public.course_chapter OWNER TO postgres;

--
-- TOC entry 216 (class 1259 OID 16823)
-- Name: course_chapter_content; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.course_chapter_content (
    course_chapter_id bigint,
    mandatory boolean,
    id integer NOT NULL
);


ALTER TABLE public.course_chapter_content OWNER TO postgres;

--
-- TOC entry 215 (class 1259 OID 16822)
-- Name: course_chapter_content_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.course_chapter_content_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.course_chapter_content_id_seq OWNER TO postgres;

--
-- TOC entry 3375 (class 0 OID 0)
-- Dependencies: 215
-- Name: course_chapter_content_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.course_chapter_content_id_seq OWNED BY public.course_chapter_content.id;


--
-- TOC entry 213 (class 1259 OID 16810)
-- Name: course_chapter_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.course_chapter_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.course_chapter_id_seq OWNER TO postgres;

--
-- TOC entry 3376 (class 0 OID 0)
-- Dependencies: 213
-- Name: course_chapter_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.course_chapter_id_seq OWNED BY public.course_chapter.id;


--
-- TOC entry 211 (class 1259 OID 16798)
-- Name: course_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.course_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.course_id_seq OWNER TO postgres;

--
-- TOC entry 3377 (class 0 OID 0)
-- Dependencies: 211
-- Name: course_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.course_id_seq OWNED BY public.course.id;


--
-- TOC entry 218 (class 1259 OID 16835)
-- Name: enrollment; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.enrollment (
    course_id bigint,
    student_id bigint,
    enrollment_date date,
    id integer NOT NULL
);


ALTER TABLE public.enrollment OWNER TO postgres;

--
-- TOC entry 217 (class 1259 OID 16834)
-- Name: enrollment_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.enrollment_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.enrollment_id_seq OWNER TO postgres;

--
-- TOC entry 3378 (class 0 OID 0)
-- Dependencies: 217
-- Name: enrollment_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.enrollment_id_seq OWNED BY public.enrollment.id;


--
-- TOC entry 220 (class 1259 OID 16847)
-- Name: feedback; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.feedback (
    enrollment_id bigint,
    rating integer,
    feedback text,
    id integer NOT NULL
);


ALTER TABLE public.feedback OWNER TO postgres;

--
-- TOC entry 219 (class 1259 OID 16846)
-- Name: feedback_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.feedback_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.feedback_id_seq OWNER TO postgres;

--
-- TOC entry 3379 (class 0 OID 0)
-- Dependencies: 219
-- Name: feedback_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.feedback_id_seq OWNED BY public.feedback.id;


--
-- TOC entry 210 (class 1259 OID 16790)
-- Name: instructor; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.instructor (
    instructor_first_name character varying(50),
    instructor_last_name character varying(50),
    instructor_email character varying(100) NOT NULL,
    instructor_password character varying(255) NOT NULL,
    instructor_introduction_brief character varying(250),
    instructor_verified boolean,
    instructor_registration_date date,
    published_courses integer,
    instructor_enrolled_students integer,
    instructor_rating integer,
    instructor_num_of_rating integer,
    id integer NOT NULL
);


ALTER TABLE public.instructor OWNER TO postgres;

--
-- TOC entry 209 (class 1259 OID 16789)
-- Name: instructor_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.instructor_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.instructor_id_seq OWNER TO postgres;

--
-- TOC entry 3380 (class 0 OID 0)
-- Dependencies: 209
-- Name: instructor_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.instructor_id_seq OWNED BY public.instructor.id;


--
-- TOC entry 222 (class 1259 OID 16861)
-- Name: students; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.students (
    first_name character varying(50),
    last_name character varying(50),
    email character varying(100) NOT NULL,
    password character varying(250) NOT NULL,
    courses_enrolled integer,
    courses_complete integer,
    verified boolean,
    registration_date date,
    id integer NOT NULL
);


ALTER TABLE public.students OWNER TO postgres;

--
-- TOC entry 221 (class 1259 OID 16860)
-- Name: students_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.students_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.students_id_seq OWNER TO postgres;

--
-- TOC entry 3381 (class 0 OID 0)
-- Dependencies: 221
-- Name: students_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.students_id_seq OWNED BY public.students.id;


--
-- TOC entry 3195 (class 2604 OID 16802)
-- Name: course id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.course ALTER COLUMN id SET DEFAULT nextval('public.course_id_seq'::regclass);


--
-- TOC entry 3196 (class 2604 OID 16814)
-- Name: course_chapter id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.course_chapter ALTER COLUMN id SET DEFAULT nextval('public.course_chapter_id_seq'::regclass);


--
-- TOC entry 3197 (class 2604 OID 16826)
-- Name: course_chapter_content id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.course_chapter_content ALTER COLUMN id SET DEFAULT nextval('public.course_chapter_content_id_seq'::regclass);


--
-- TOC entry 3198 (class 2604 OID 16838)
-- Name: enrollment id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.enrollment ALTER COLUMN id SET DEFAULT nextval('public.enrollment_id_seq'::regclass);


--
-- TOC entry 3199 (class 2604 OID 16850)
-- Name: feedback id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.feedback ALTER COLUMN id SET DEFAULT nextval('public.feedback_id_seq'::regclass);


--
-- TOC entry 3194 (class 2604 OID 16793)
-- Name: instructor id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.instructor ALTER COLUMN id SET DEFAULT nextval('public.instructor_id_seq'::regclass);


--
-- TOC entry 3200 (class 2604 OID 16864)
-- Name: students id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.students ALTER COLUMN id SET DEFAULT nextval('public.students_id_seq'::regclass);


--
-- TOC entry 3359 (class 0 OID 16799)
-- Dependencies: 212
-- Data for Name: course; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.course (course_title, course_brief, instructor_id, num_of_chapters, id, created_log, updated_log) FROM stdin;
Databases 1on1\n	Here we will tell you all there is to know about databases	1	5	1	2021-12-14	2021-12-14
\.


--
-- TOC entry 3361 (class 0 OID 16811)
-- Dependencies: 214
-- Data for Name: course_chapter; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.course_chapter (course_id, chapter_title, content_reading, content_video, content_assignment, id, required_time) FROM stdin;
1	THIS IS ABOUT SOMETHING ELSE	\N	t	\N	2	20
1	THIS IS ABOUT SOMETHING ELSE	\N	\N	t	3	60
1	THIS IS ABOUT SOMETHING ELSE	t	\N	\N	4	120
1	THIS IS ABOUT SOMETHING	\N	t	f	1	15
1	THIS IS ABOUT SOMETHING ELSE ENTIRELY	t	\N	\N	5	30
\.


--
-- TOC entry 3363 (class 0 OID 16823)
-- Dependencies: 216
-- Data for Name: course_chapter_content; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.course_chapter_content (course_chapter_id, mandatory, id) FROM stdin;
\.


--
-- TOC entry 3365 (class 0 OID 16835)
-- Dependencies: 218
-- Data for Name: enrollment; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.enrollment (course_id, student_id, enrollment_date, id) FROM stdin;
\N	1	2021-12-15	1
1	1	2021-12-15	2
1	1	2021-12-15	3
1	1	2021-12-15	4
1	1	2021-12-15	5
1	1	2021-12-15	6
1	1	2021-12-15	7
1	1	2021-12-15	8
1	1	2021-12-15	9
1	1	2021-12-15	10
1	1	2021-12-15	11
1	1	2021-12-15	12
1	1	2021-12-15	13
1	1	2021-12-15	14
1	1	2021-12-15	15
1	1	2021-12-15	16
1	1	2021-12-15	17
1	1	2021-12-15	18
1	1	2021-12-15	19
1	1	2021-12-15	20
1	1	2021-12-15	21
1	1	2021-12-15	22
1	1	2021-12-15	23
1	1	2021-12-15	24
1	1	2021-12-15	25
1	1	2021-12-15	26
1	1	2021-12-15	27
1	1	2021-12-15	28
1	1	2021-12-15	29
1	1	2021-12-15	30
1	1	2021-12-15	31
1	1	2021-12-15	32
1	1	2021-12-15	33
1	1	2021-12-15	34
\.


--
-- TOC entry 3367 (class 0 OID 16847)
-- Dependencies: 220
-- Data for Name: feedback; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.feedback (enrollment_id, rating, feedback, id) FROM stdin;
\.


--
-- TOC entry 3357 (class 0 OID 16790)
-- Dependencies: 210
-- Data for Name: instructor; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.instructor (instructor_first_name, instructor_last_name, instructor_email, instructor_password, instructor_introduction_brief, instructor_verified, instructor_registration_date, published_courses, instructor_enrolled_students, instructor_rating, instructor_num_of_rating, id) FROM stdin;
Steven	Albury	Male24@ofir.dk	123	Steven is a nice guy	t	2021-12-14	\N	\N	\N	\N	1
\.


--
-- TOC entry 3369 (class 0 OID 16861)
-- Dependencies: 222
-- Data for Name: students; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.students (first_name, last_name, email, password, courses_enrolled, courses_complete, verified, registration_date, id) FROM stdin;
Andreas	Jensen	gud.er.gud@gmail.com	$2y$10$ZGOLtv1im2iJE9bFZSWozeEd0F61ybY9WU1zgItiRQj3s9EIq2zKG	34	0	f	2021-12-15	1
\.


--
-- TOC entry 3382 (class 0 OID 0)
-- Dependencies: 215
-- Name: course_chapter_content_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.course_chapter_content_id_seq', 1, false);


--
-- TOC entry 3383 (class 0 OID 0)
-- Dependencies: 213
-- Name: course_chapter_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.course_chapter_id_seq', 1, false);


--
-- TOC entry 3384 (class 0 OID 0)
-- Dependencies: 211
-- Name: course_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.course_id_seq', 1, false);


--
-- TOC entry 3385 (class 0 OID 0)
-- Dependencies: 217
-- Name: enrollment_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.enrollment_id_seq', 34, true);


--
-- TOC entry 3386 (class 0 OID 0)
-- Dependencies: 219
-- Name: feedback_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.feedback_id_seq', 1, false);


--
-- TOC entry 3387 (class 0 OID 0)
-- Dependencies: 209
-- Name: instructor_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.instructor_id_seq', 1, false);


--
-- TOC entry 3388 (class 0 OID 0)
-- Dependencies: 221
-- Name: students_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.students_id_seq', 1, true);


--
-- TOC entry 3208 (class 2606 OID 16828)
-- Name: course_chapter_content course_chapter_content_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.course_chapter_content
    ADD CONSTRAINT course_chapter_content_pkey PRIMARY KEY (id);


--
-- TOC entry 3206 (class 2606 OID 16816)
-- Name: course_chapter course_chapter_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.course_chapter
    ADD CONSTRAINT course_chapter_pkey PRIMARY KEY (id);


--
-- TOC entry 3204 (class 2606 OID 16804)
-- Name: course course_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.course
    ADD CONSTRAINT course_pkey PRIMARY KEY (id);


--
-- TOC entry 3210 (class 2606 OID 16840)
-- Name: enrollment enrollment_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.enrollment
    ADD CONSTRAINT enrollment_pkey PRIMARY KEY (id);


--
-- TOC entry 3212 (class 2606 OID 16854)
-- Name: feedback feedback_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.feedback
    ADD CONSTRAINT feedback_pkey PRIMARY KEY (id);


--
-- TOC entry 3202 (class 2606 OID 16797)
-- Name: instructor instructor1_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.instructor
    ADD CONSTRAINT instructor1_pkey PRIMARY KEY (id);


--
-- TOC entry 3214 (class 2606 OID 16817)
-- Name: course_chapter fk_course_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.course_chapter
    ADD CONSTRAINT fk_course_id FOREIGN KEY (course_id) REFERENCES public.course(id);


--
-- TOC entry 3213 (class 2606 OID 16805)
-- Name: course instructor1; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.course
    ADD CONSTRAINT instructor1 FOREIGN KEY (instructor_id) REFERENCES public.instructor(id);


--
-- TOC entry 3215 (class 2606 OID 16829)
-- Name: course_chapter_content pk_course_chapter_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.course_chapter_content
    ADD CONSTRAINT pk_course_chapter_id FOREIGN KEY (course_chapter_id) REFERENCES public.course_chapter(id);


--
-- TOC entry 3216 (class 2606 OID 16841)
-- Name: enrollment pk_course_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.enrollment
    ADD CONSTRAINT pk_course_id FOREIGN KEY (course_id) REFERENCES public.course(id);


-- Completed on 2021-12-15 17:17:47

--
-- PostgreSQL database dump complete
--

