--
-- PostgreSQL database dump
--

-- Dumped from database version 12.9 (Ubuntu 12.9-2.pgdg20.04+1)
-- Dumped by pg_dump version 12.9 (Ubuntu 12.9-2.pgdg20.04+1)

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

DROP DATABASE universe;
--
-- Name: universe; Type: DATABASE; Schema: -; Owner: freecodecamp
--

CREATE DATABASE universe WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';


ALTER DATABASE universe OWNER TO freecodecamp;

\connect universe

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
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying NOT NULL,
    type text,
    done boolean,
    diameters integer NOT NULL
);


ALTER TABLE public.galaxy OWNER TO freecodecamp;

--
-- Name: galaxy_item_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.galaxy_item_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.galaxy_item_id_seq OWNER TO freecodecamp;

--
-- Name: galaxy_item_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.galaxy_item_id_seq OWNED BY public.galaxy.galaxy_id;


--
-- Name: has_life; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.has_life (
    has_life_id integer NOT NULL,
    name character varying,
    life boolean NOT NULL,
    years numeric,
    sn integer
);


ALTER TABLE public.has_life OWNER TO freecodecamp;

--
-- Name: has_life_has_life_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.has_life_has_life_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.has_life_has_life_id_seq OWNER TO freecodecamp;

--
-- Name: has_life_has_life_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.has_life_has_life_id_seq OWNED BY public.has_life.has_life_id;


--
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    name character varying NOT NULL,
    planet_id integer,
    sn integer NOT NULL,
    size integer NOT NULL
);


ALTER TABLE public.moon OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.moon_moon_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.moon_moon_id_seq OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.moon_moon_id_seq OWNED BY public.moon.moon_id;


--
-- Name: planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet (
    planet_id integer NOT NULL,
    name character varying,
    star_id integer,
    moons integer,
    sn integer NOT NULL
);


ALTER TABLE public.planet OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.planet_planet_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.planet_planet_id_seq OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.planet_planet_id_seq OWNED BY public.planet.planet_id;


--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    name character varying NOT NULL,
    galaxy_id integer,
    type integer NOT NULL,
    sn integer NOT NULL
);


ALTER TABLE public.star OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.star_star_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.star_star_id_seq OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.star_star_id_seq OWNED BY public.star.star_id;


--
-- Name: galaxy galaxy_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy ALTER COLUMN galaxy_id SET DEFAULT nextval('public.galaxy_item_id_seq'::regclass);


--
-- Name: has_life has_life_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.has_life ALTER COLUMN has_life_id SET DEFAULT nextval('public.has_life_has_life_id_seq'::regclass);


--
-- Name: moon moon_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon ALTER COLUMN moon_id SET DEFAULT nextval('public.moon_moon_id_seq'::regclass);


--
-- Name: planet planet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet ALTER COLUMN planet_id SET DEFAULT nextval('public.planet_planet_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'a', 'a', true, 1);
INSERT INTO public.galaxy VALUES (2, 'b', 'b', true, 2);
INSERT INTO public.galaxy VALUES (3, 'c', 'c', false, 3);
INSERT INTO public.galaxy VALUES (4, 'D', 'd', true, 2);
INSERT INTO public.galaxy VALUES (5, 'e', 'e', true, 2);
INSERT INTO public.galaxy VALUES (6, 'f', 'f', true, 2);


--
-- Data for Name: has_life; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.has_life VALUES (1, 'a', true, 1, NULL);
INSERT INTO public.has_life VALUES (2, 'a', true, 1, NULL);
INSERT INTO public.has_life VALUES (3, 'a', true, 1, NULL);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'a', 1, 1, 1);
INSERT INTO public.moon VALUES (2, 'a', 1, 2, 2);
INSERT INTO public.moon VALUES (3, 'a', 1, 3, 3);
INSERT INTO public.moon VALUES (4, 'a', 1, 4, 4);
INSERT INTO public.moon VALUES (5, 'a', 1, 5, 5);
INSERT INTO public.moon VALUES (6, 'a', 1, 6, 6);
INSERT INTO public.moon VALUES (7, 'a', 1, 7, 7);
INSERT INTO public.moon VALUES (8, 'a', 1, 8, 8);
INSERT INTO public.moon VALUES (9, 'a', 1, 9, 9);
INSERT INTO public.moon VALUES (10, 'a', 1, 10, 10);
INSERT INTO public.moon VALUES (11, 'a', 1, 11, 11);
INSERT INTO public.moon VALUES (12, 'a', 1, 12, 12);
INSERT INTO public.moon VALUES (13, 'a', 1, 13, 13);
INSERT INTO public.moon VALUES (14, 'a', 1, 14, 14);
INSERT INTO public.moon VALUES (15, 'a', 1, 15, 15);
INSERT INTO public.moon VALUES (156, 'a', 1, 16, 16);
INSERT INTO public.moon VALUES (17, 'a', 1, 17, 17);
INSERT INTO public.moon VALUES (18, 'a', 1, 18, 18);
INSERT INTO public.moon VALUES (19, 'a', 1, 19, 19);
INSERT INTO public.moon VALUES (20, 'a', 1, 20, 20);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'a', 1, 1, 1);
INSERT INTO public.planet VALUES (2, 'a', 1, 2, 2);
INSERT INTO public.planet VALUES (3, 'a', 1, 3, 3);
INSERT INTO public.planet VALUES (4, 'a', 1, 4, 4);
INSERT INTO public.planet VALUES (5, 'a', 1, 5, 5);
INSERT INTO public.planet VALUES (6, 'a', 1, 6, 6);
INSERT INTO public.planet VALUES (7, 'a', 1, 7, 7);
INSERT INTO public.planet VALUES (8, 'a', 1, 8, 8);
INSERT INTO public.planet VALUES (9, 'a', 1, 9, 9);
INSERT INTO public.planet VALUES (10, 'a', 1, 10, 10);
INSERT INTO public.planet VALUES (11, 'a', 1, 11, 11);
INSERT INTO public.planet VALUES (12, 'a', 1, 12, 12);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'a', 1, 1, 1);
INSERT INTO public.star VALUES (2, 'b', 2, 2, 2);
INSERT INTO public.star VALUES (3, 'c', 3, 3, 3);
INSERT INTO public.star VALUES (4, 'd', 3, 3, 4);
INSERT INTO public.star VALUES (5, 'e', 3, 3, 5);
INSERT INTO public.star VALUES (6, 'f', 3, 3, 6);


--
-- Name: galaxy_item_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_item_id_seq', 1, false);


--
-- Name: has_life_has_life_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.has_life_has_life_id_seq', 1, false);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 1, false);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 1, false);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 1, false);


--
-- Name: galaxy constraintname; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT constraintname UNIQUE (name);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: galaxy galaxy_type_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_type_key UNIQUE (type);


--
-- Name: has_life has_life_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.has_life
    ADD CONSTRAINT has_life_pkey PRIMARY KEY (has_life_id);


--
-- Name: has_life has_life_sn_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.has_life
    ADD CONSTRAINT has_life_sn_key UNIQUE (sn);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name: moon moon_size_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_size_key UNIQUE (size);


--
-- Name: moon moon_sn_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_sn_key UNIQUE (sn);


--
-- Name: planet planet_moons_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_moons_key UNIQUE (moons);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: planet planet_sn_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_sn_key UNIQUE (sn);


--
-- Name: star star_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_name_key UNIQUE (name);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: star star_sn_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_sn_key UNIQUE (sn);


--
-- Name: moon moon_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: planet planet_star_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_star_id_fkey FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- Name: star star_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- PostgreSQL database dump complete
--

