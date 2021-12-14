
    -- Table: public.instructor

-- DROP TABLE IF EXISTS public.instructor;

CREATE TABLE IF NOT EXISTS public.instructor
(
    first_name "char",
    last_name "char",
    email "char" NOT NULL,
    password "char" NOT NULL,
    introduction_brief "char",
    verified boolean,
    registration_date date,
    published_courses integer,
    enrolled_students integer,
    rating integer,
    num_of_rating integer,
    id serial,
    CONSTRAINT instructor1_pkey PRIMARY KEY (id)
)

TABLESPACE pg_default;

ALTER TABLE IF EXISTS public.instructor
    OWNER to postgres;
	
	
-- DROP TABLE IF EXISTS public.course;

CREATE TABLE IF NOT EXISTS public.course
(
    course_title "char",
    course_brief "char",
    instructor_id bigint,
    num_of_chapters integer,
    CONSTRAINT course_pkey PRIMARY KEY (id),
    CONSTRAINT instructor1 FOREIGN KEY (instructor_id)
        REFERENCES public.instructor (id) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
        NOT VALID
    id serial,
)

TABLESPACE pg_default;

ALTER TABLE IF EXISTS public.course
    OWNER to postgres;

    -- Table: public.course_chapter

-- DROP TABLE IF EXISTS public.course_chapter;

CREATE TABLE IF NOT EXISTS public.course_chapter
(
    course_id bigint NOT NULL,
    chapter_title "char",
    content_reading boolean,
    content_video boolean,
    content_assignment boolean,
    required_time date,
    CONSTRAINT course_chapter_pkey PRIMARY KEY (id),
    CONSTRAINT fk_course_id FOREIGN KEY (course_id)
        REFERENCES public.course (id) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
        NOT VALID
    id serial,
)

TABLESPACE pg_default;

ALTER TABLE IF EXISTS public.course_chapter
    OWNER to postgres;

    -- Table: public.course_chapter_content

-- DROP TABLE IF EXISTS public.course_chapter_content;

CREATE TABLE IF NOT EXISTS public.course_chapter_content
(
    course_chapter_id bigint,
    mandatory boolean,
    CONSTRAINT course_chapter_content_pkey PRIMARY KEY (id),
    CONSTRAINT pk_course_chapter_id FOREIGN KEY (course_chapter_id)
        REFERENCES public.course_chapter (id) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
    id serial,
)

TABLESPACE pg_default;

ALTER TABLE IF EXISTS public.course_chapter_content
    OWNER to postgres;

    -- Table: public.enrollment

-- DROP TABLE IF EXISTS public.enrollment;

CREATE TABLE IF NOT EXISTS public.enrollment
(
    course_id bigint,
    student_id bigint,
    enrollment_date "char",
    CONSTRAINT enrollment_pkey PRIMARY KEY (id),
    CONSTRAINT pk_course_id FOREIGN KEY (course_id)
        REFERENCES public.course (id) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
        NOT VALID
    id serial,
)

TABLESPACE pg_default;

ALTER TABLE IF EXISTS public.enrollment
    OWNER to postgres;

    -- Table: public.feedback

-- DROP TABLE IF EXISTS public.feedback;

CREATE TABLE IF NOT EXISTS public.feedback
(
    enrollment_id bigint,
    rating integer,
    feedback text COLLATE pg_catalog."default",
    CONSTRAINT feedback_pkey PRIMARY KEY (id)
    id serial,
)

TABLESPACE pg_default;

ALTER TABLE IF EXISTS public.feedback
    OWNER to postgres;

    -- Table: public.students

-- DROP TABLE IF EXISTS public.students;

CREATE TABLE public.students (
    first_name character varying(50),
    last_name character varying(50),
    email character varying(100) NOT NULL,
    password character varying(250) NOT NULL,
    courses_enrolled integer,
    courses_complete integer,
    verified boolean,
    registration_date date
    id serial,
);


ALTER TABLE IF EXISTS public.students
    OWNER to postgres;