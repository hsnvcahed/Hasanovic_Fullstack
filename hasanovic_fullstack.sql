--
-- PostgreSQL database dump
--

-- Dumped from database version 13.0
-- Dumped by pg_dump version 13.0

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

--
-- Name: wdh_sew_1; Type: DATABASE; Schema: -; Owner: postgres
--

CREATE DATABASE wdh_sew_1 WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE = 'German_Germany.1252';


ALTER DATABASE wdh_sew_1 OWNER TO postgres;

\connect wdh_sew_1

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

--
-- Name: public; Type: SCHEMA; Schema: -; Owner: postgres
--

CREATE SCHEMA public;


ALTER SCHEMA public OWNER TO postgres;

--
-- Name: SCHEMA public; Type: COMMENT; Schema: -; Owner: postgres
--

COMMENT ON SCHEMA public IS 'standard public schema';


SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: cars; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.cars (
    id integer NOT NULL,
    title text,
    image text NOT NULL,
    status text,
    price numeric,
    miles integer,
    year_of_make smallint,
    description text NOT NULL,
    owner integer,
    CONSTRAINT cars_miles_check CHECK ((miles < 200000)),
    CONSTRAINT cars_price_check CHECK ((price > (1000)::numeric)),
    CONSTRAINT cars_status_check CHECK ((status = ANY (ARRAY['available'::text, 'sold'::text, 'reserved'::text]))),
    CONSTRAINT cars_year_of_make_check CHECK (((year_of_make)::double precision <= date_part('year'::text, now())))
);


ALTER TABLE public.cars OWNER TO postgres;

--
-- Name: cars_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.cars_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.cars_id_seq OWNER TO postgres;

--
-- Name: cars_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.cars_id_seq OWNED BY public.cars.id;


--
-- Name: owner; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.owner (
    id integer NOT NULL,
    first_name text,
    last_name text
);


ALTER TABLE public.owner OWNER TO postgres;

--
-- Name: owner_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.owner_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.owner_id_seq OWNER TO postgres;

--
-- Name: owner_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.owner_id_seq OWNED BY public.owner.id;


--
-- Name: cars id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cars ALTER COLUMN id SET DEFAULT nextval('public.cars_id_seq'::regclass);


--
-- Name: owner id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.owner ALTER COLUMN id SET DEFAULT nextval('public.owner_id_seq'::regclass);


--
-- Data for Name: cars; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.cars VALUES (1, 'Top Deal Of Week!', 'http://localhost:3000/images/car1.png', 'available', 189455, 11321, 2020, 'Perfect condition, lots of extras!', 1);
INSERT INTO public.cars VALUES (3, 'Fair Price', 'http://localhost:3000/images/car3.png', 'available', 91170, 45128, 2017, 'Stylish car. Good condition.', 3);
INSERT INTO public.cars VALUES (6, 'Great Value!', 'http://localhost:3000/images/car6.png', 'sold', 145322, 52811, 2018, 'Mint condition.', 6);
INSERT INTO public.cars VALUES (10, 'Ua Coole Karre', 'N/A', 'sold', 4000, 2500, 2002, 'A very cool Car', 8);
INSERT INTO public.cars VALUES (5, 'Best Offer!', 'http://localhost:3000/images/car5.png', 'sold', 182900, 42711, 2019, 'Fast as a shark.', 5);
INSERT INTO public.cars VALUES (7, 'Best Deal Ever!', 'http://localhost:3000/images/car7.png', 'sold', 213860, 12800, 2020, 'A racing car.', 1);


--
-- Data for Name: owner; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.owner VALUES (1, 'Robert', 'Baumgartner');
INSERT INTO public.owner VALUES (2, 'Moritz', 'Miedler');
INSERT INTO public.owner VALUES (3, 'Benjamin', 'Gruber');
INSERT INTO public.owner VALUES (4, 'Ivan', 'Orsolic');
INSERT INTO public.owner VALUES (5, 'Dominik', 'Palatin');
INSERT INTO public.owner VALUES (6, 'Haroon', 'Younas');
INSERT INTO public.owner VALUES (7, 'Victor', 'Pawlek');
INSERT INTO public.owner VALUES (8, 'Sebastian', 'Lang');
INSERT INTO public.owner VALUES (9, 'Filip', 'Wojtasik');
INSERT INTO public.owner VALUES (10, 'Max', 'Blam');


--
-- Name: cars_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.cars_id_seq', 10, true);


--
-- Name: owner_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.owner_id_seq', 10, true);


--
-- Name: cars cars_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cars
    ADD CONSTRAINT cars_pkey PRIMARY KEY (id);


--
-- Name: owner owner_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.owner
    ADD CONSTRAINT owner_pkey PRIMARY KEY (id);


--
-- Name: cars cars_owner_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cars
    ADD CONSTRAINT cars_owner_fkey FOREIGN KEY (owner) REFERENCES public.owner(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: TABLE cars; Type: ACL; Schema: public; Owner: postgres
--

GRANT SELECT,INSERT,DELETE,UPDATE ON TABLE public.cars TO wdh_sew_1;


--
-- Name: TABLE owner; Type: ACL; Schema: public; Owner: postgres
--

GRANT SELECT,INSERT,DELETE,UPDATE ON TABLE public.owner TO wdh_sew_1;


--
-- PostgreSQL database dump complete
--

