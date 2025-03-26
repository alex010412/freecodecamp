--
-- PostgreSQL database dump
--

-- Dumped from database version 12.17 (Ubuntu 12.17-1.pgdg22.04+1)
-- Dumped by pg_dump version 12.17 (Ubuntu 12.17-1.pgdg22.04+1)

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
-- Name: players; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.players (
    username character varying(22),
    games_played integer,
    best_game integer,
    tries_number integer
);


ALTER TABLE public.players OWNER TO freecodecamp;

--
-- Data for Name: players; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.players VALUES ('user_1742986320296', 2, 1, 147);
INSERT INTO public.players VALUES ('Paul', 1, 1, 4);
INSERT INTO public.players VALUES ('Albert', 1, 1, 0);
INSERT INTO public.players VALUES ('user_1742985451174', 5, 1, 364);
INSERT INTO public.players VALUES ('user_1742985989987', 2, 1, 306);
INSERT INTO public.players VALUES ('user_1742985451173', 2, 1, 373);
INSERT INTO public.players VALUES ('user_1742985989988', 5, 1, 0);
INSERT INTO public.players VALUES ('jnvkjtgvjkqehgkh', 1, 1, 0);
INSERT INTO public.players VALUES ('user_1742986320297', 5, 1, 425);
INSERT INTO public.players VALUES ('ALEXIS', 4, 1, 1);


--
-- PostgreSQL database dump complete
--

