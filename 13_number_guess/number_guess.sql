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

DROP DATABASE number_guess;
--
-- Name: number_guess; Type: DATABASE; Schema: -; Owner: freecodecamp
--

CREATE DATABASE number_guess WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';


ALTER DATABASE number_guess OWNER TO freecodecamp;

\connect number_guess

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
-- Name: users; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.users (
    username character varying(22),
    game_played integer,
    best_game integer
);


ALTER TABLE public.users OWNER TO freecodecamp;

--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.users VALUES ('Dristanta', 1, 5);
INSERT INTO public.users VALUES ('Dris', 3, 9);
INSERT INTO public.users VALUES ('user_1666519026825', 2, 179);
INSERT INTO public.users VALUES ('user_1666519026826', 5, 142);
INSERT INTO public.users VALUES ('user_1666519063085', 2, 580);
INSERT INTO public.users VALUES ('user_1666519063086', 5, 214);
INSERT INTO public.users VALUES ('user_1666518505165', 2, 216);
INSERT INTO public.users VALUES ('user_1666518505166', 5, 18);
INSERT INTO public.users VALUES ('user_1666518699644', 2, 34);
INSERT INTO public.users VALUES ('user_1666518699645', 5, 32);
INSERT INTO public.users VALUES ('user_1666518878704', 2, 684);
INSERT INTO public.users VALUES ('user_1666518878705', 5, 99);


--
-- PostgreSQL database dump complete
--

