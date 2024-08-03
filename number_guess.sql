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
-- Name: games; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.games (
    game_id integer NOT NULL,
    user_id integer NOT NULL,
    secret integer NOT NULL,
    guess_count integer NOT NULL
);


ALTER TABLE public.games OWNER TO freecodecamp;

--
-- Name: games_game_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.games_game_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.games_game_id_seq OWNER TO freecodecamp;

--
-- Name: games_game_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.games_game_id_seq OWNED BY public.games.game_id;


--
-- Name: users; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.users (
    user_id integer NOT NULL,
    username character varying(22) NOT NULL
);


ALTER TABLE public.users OWNER TO freecodecamp;

--
-- Name: users_user_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.users_user_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.users_user_id_seq OWNER TO freecodecamp;

--
-- Name: users_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.users_user_id_seq OWNED BY public.users.user_id;


--
-- Name: games game_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games ALTER COLUMN game_id SET DEFAULT nextval('public.games_game_id_seq'::regclass);


--
-- Name: users user_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.users ALTER COLUMN user_id SET DEFAULT nextval('public.users_user_id_seq'::regclass);


--
-- Data for Name: games; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.games VALUES (1, 18, 904, 1);
INSERT INTO public.games VALUES (2, 18, 873, 1);
INSERT INTO public.games VALUES (3, 19, 560, 1);
INSERT INTO public.games VALUES (4, 19, 710, 1);
INSERT INTO public.games VALUES (5, 18, 107, 1);
INSERT INTO public.games VALUES (6, 18, 452, 1);
INSERT INTO public.games VALUES (7, 18, 458, 1);
INSERT INTO public.games VALUES (8, 1, 577, 10);
INSERT INTO public.games VALUES (9, 1, 521, 10);
INSERT INTO public.games VALUES (10, 20, 761, 762);
INSERT INTO public.games VALUES (11, 20, 595, 596);
INSERT INTO public.games VALUES (12, 21, 286, 287);
INSERT INTO public.games VALUES (13, 21, 771, 772);
INSERT INTO public.games VALUES (14, 20, 278, 281);
INSERT INTO public.games VALUES (15, 20, 920, 921);
INSERT INTO public.games VALUES (16, 20, 691, 692);
INSERT INTO public.games VALUES (17, 22, 989, 990);
INSERT INTO public.games VALUES (18, 22, 225, 226);
INSERT INTO public.games VALUES (19, 23, 883, 884);
INSERT INTO public.games VALUES (20, 23, 215, 216);
INSERT INTO public.games VALUES (21, 22, 395, 398);
INSERT INTO public.games VALUES (22, 22, 824, 825);
INSERT INTO public.games VALUES (23, 22, 507, 508);


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.users VALUES (1, 'furkan');
INSERT INTO public.users VALUES (2, 'user_1722677031359');
INSERT INTO public.users VALUES (3, 'user_1722677031358');
INSERT INTO public.users VALUES (6, 'user_1722677612986');
INSERT INTO public.users VALUES (7, 'user_1722677612985');
INSERT INTO public.users VALUES (8, 'user_1722677635714');
INSERT INTO public.users VALUES (9, 'user_1722677635713');
INSERT INTO public.users VALUES (10, 'user_1722678760492');
INSERT INTO public.users VALUES (11, 'user_1722678760491');
INSERT INTO public.users VALUES (12, 'user_1722678765154');
INSERT INTO public.users VALUES (13, 'user_1722678765153');
INSERT INTO public.users VALUES (14, 'user_1722678775489');
INSERT INTO public.users VALUES (15, 'user_1722678775488');
INSERT INTO public.users VALUES (16, 'user_1722678801944');
INSERT INTO public.users VALUES (17, 'user_1722678801943');
INSERT INTO public.users VALUES (18, 'user_1722679280841');
INSERT INTO public.users VALUES (19, 'user_1722679280840');
INSERT INTO public.users VALUES (20, 'user_1722679494592');
INSERT INTO public.users VALUES (21, 'user_1722679494591');
INSERT INTO public.users VALUES (22, 'user_1722679513871');
INSERT INTO public.users VALUES (23, 'user_1722679513870');


--
-- Name: games_game_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.games_game_id_seq', 23, true);


--
-- Name: users_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.users_user_id_seq', 23, true);


--
-- Name: games games_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games
    ADD CONSTRAINT games_pkey PRIMARY KEY (game_id);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (user_id);


--
-- Name: users users_username_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_username_key UNIQUE (username);


--
-- Name: games games_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games
    ADD CONSTRAINT games_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(user_id);


--
-- PostgreSQL database dump complete
--
