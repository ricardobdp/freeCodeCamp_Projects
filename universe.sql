--
-- PostgreSQL database dump
--

-- Dumped from database version 12.22 (Ubuntu 12.22-0ubuntu0.20.04.4)
-- Dumped by pg_dump version 12.22 (Ubuntu 12.22-0ubuntu0.20.04.4)

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
    name character varying(30) NOT NULL,
    int_1 integer,
    int_2 integer,
    constellation character varying(30),
    num_1 numeric(4,1),
    notes text,
    bool_1 boolean,
    bool_2 boolean
);


ALTER TABLE public.galaxy OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.galaxy_galaxy_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.galaxy_galaxy_id_seq OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.galaxy_galaxy_id_seq OWNED BY public.galaxy.galaxy_id;


--
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    name character varying(30) NOT NULL,
    int_1 integer,
    orb_speed numeric(6,3),
    mean_rad integer,
    text_1 text,
    bool_1 boolean,
    bool_2 boolean,
    planet_id integer NOT NULL
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
    name character varying(30) NOT NULL,
    int_1 integer,
    int_2 integer,
    orb_period_d numeric(10,3),
    orb_vel text,
    bool_1 boolean,
    bool_2 boolean,
    star_id integer NOT NULL
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
    name character varying(30) NOT NULL,
    int_1 integer,
    int_2 integer,
    num_1 numeric(4,1),
    text_1 text,
    bool_1 boolean,
    bool_2 boolean,
    galaxy_id integer NOT NULL
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
-- Name: table_5; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.table_5 (
    table_5_id integer NOT NULL,
    name character varying(30) NOT NULL,
    int_1 integer,
    int_2 integer,
    num_1 numeric(4,1),
    text_1 text,
    bool_1 boolean,
    bool_2 boolean
);


ALTER TABLE public.table_5 OWNER TO freecodecamp;

--
-- Name: table_5_table_5_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.table_5_table_5_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.table_5_table_5_id_seq OWNER TO freecodecamp;

--
-- Name: table_5_table_5_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.table_5_table_5_id_seq OWNED BY public.table_5.table_5_id;


--
-- Name: galaxy galaxy_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy ALTER COLUMN galaxy_id SET DEFAULT nextval('public.galaxy_galaxy_id_seq'::regclass);


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
-- Name: table_5 table_5_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.table_5 ALTER COLUMN table_5_id SET DEFAULT nextval('public.table_5_table_5_id_seq'::regclass);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Alcyoneus', NULL, NULL, 'Lynx', NULL, ' A low-exitation, Fanaroff and Riley Class II radio galaxy, one of the largest discovered.', NULL, NULL);
INSERT INTO public.galaxy VALUES (2, 'Antennae', NULL, NULL, 'Corvus', NULL, 'Two colliding galaxies', NULL, NULL);
INSERT INTO public.galaxy VALUES (3, 'Cartwheel', NULL, NULL, 'Sculptor', NULL, 'The largest in the Cartwheel Galaxy group, made up of four spiral galaxies.', NULL, NULL);
INSERT INTO public.galaxy VALUES (4, 'Mayall''s Object', NULL, NULL, 'Ursa Major', NULL, 'This is named after Nicholas Mayall, of the Lick Observatory, who discovered it.', NULL, NULL);
INSERT INTO public.galaxy VALUES (5, 'Milky Way', NULL, NULL, 'Sagittarius', NULL, 'The galaxy containing the Sun and its Solar System, and therefore Earth.', NULL, NULL);
INSERT INTO public.galaxy VALUES (6, 'Wolf-Lundmark-Melotte', NULL, NULL, 'Cetus', NULL, 'Named for the three astronomers instrumental in its discovery and identification.', NULL, NULL);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Moon', NULL, 1.020, 1137, NULL, NULL, NULL, 3);
INSERT INTO public.moon VALUES (2, 'Phobos', NULL, 2.138, 11, NULL, NULL, NULL, 4);
INSERT INTO public.moon VALUES (3, 'Deimos', NULL, 1.351, 6, NULL, NULL, NULL, 4);
INSERT INTO public.moon VALUES (4, 'Cordelia', NULL, 1.722, 26, NULL, NULL, NULL, 7);
INSERT INTO public.moon VALUES (5, 'Ophelia', NULL, 50.400, 10, NULL, NULL, NULL, 7);
INSERT INTO public.moon VALUES (6, 'Bianca', NULL, 15.540, 5, NULL, NULL, NULL, 7);
INSERT INTO public.moon VALUES (7, 'Cressida', NULL, 8.900, 80, NULL, NULL, NULL, 7);
INSERT INTO public.moon VALUES (8, 'Desdemona', NULL, 9.300, 64, NULL, NULL, NULL, 7);
INSERT INTO public.moon VALUES (9, 'Juliet', NULL, 8.500, 94, NULL, NULL, NULL, 7);
INSERT INTO public.moon VALUES (10, 'Portia', NULL, 7.700, 135, NULL, NULL, NULL, 7);
INSERT INTO public.moon VALUES (11, 'Rosalind', NULL, 9.100, 72, NULL, NULL, NULL, 7);
INSERT INTO public.moon VALUES (12, 'Cupid', NULL, 12.600, 18, NULL, NULL, NULL, 7);
INSERT INTO public.moon VALUES (13, 'Mimas', NULL, 85.500, 39, NULL, NULL, NULL, 6);
INSERT INTO public.moon VALUES (14, 'Enceladus', NULL, 37.900, 50, NULL, NULL, NULL, 6);
INSERT INTO public.moon VALUES (15, 'Tethys', NULL, 94.600, 10, NULL, NULL, NULL, 6);
INSERT INTO public.moon VALUES (16, 'Dione', NULL, 77.396, 12, NULL, NULL, NULL, 6);
INSERT INTO public.moon VALUES (17, 'Rhea', NULL, 27.108, 27, NULL, NULL, NULL, 6);
INSERT INTO public.moon VALUES (18, 'Naiad', NULL, 9.600, 12, NULL, NULL, NULL, 8);
INSERT INTO public.moon VALUES (19, 'Thalassa', NULL, 8.700, 35, NULL, NULL, NULL, 8);
INSERT INTO public.moon VALUES (20, 'Despina', NULL, 7.300, 19, NULL, NULL, NULL, 8);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Mercury', NULL, NULL, 87.969, '47.9 km/s (29.8 mi/s)', NULL, NULL, 5);
INSERT INTO public.planet VALUES (2, 'Venus', NULL, NULL, 224.701, '35.0 km/s (21.7 mi/s)', NULL, NULL, 5);
INSERT INTO public.planet VALUES (3, 'Earth', NULL, NULL, 365.256, '29.8 km/s (18.5 mi/s)', NULL, NULL, 5);
INSERT INTO public.planet VALUES (4, 'Mars', NULL, NULL, 686.980, '24.1 km/s (15.0 mi/s)', NULL, NULL, 5);
INSERT INTO public.planet VALUES (5, 'Jupiter', NULL, NULL, 4332.589, '13.1 km/s (8.1 mi/s)', NULL, NULL, 5);
INSERT INTO public.planet VALUES (6, 'Saturn', NULL, NULL, 10759.220, '9.7 km/s (6.0 mi/s)', NULL, NULL, 5);
INSERT INTO public.planet VALUES (7, 'Uranus', NULL, NULL, 30688.500, '6.8 km/s (4.2 mi/s)', NULL, NULL, 5);
INSERT INTO public.planet VALUES (8, 'Neptune', NULL, NULL, 60.182, '5.4 km/s (3.4 mi/s)', NULL, NULL, 5);
INSERT INTO public.planet VALUES (9, 'XO-5b', NULL, NULL, 4.188, NULL, NULL, NULL, 1);
INSERT INTO public.planet VALUES (10, 'HD 4113 A b', NULL, NULL, 526.620, NULL, NULL, NULL, 3);
INSERT INTO public.planet VALUES (11, 'HAT-P-3b', NULL, NULL, 2.899, NULL, NULL, NULL, 4);
INSERT INTO public.planet VALUES (12, 'NUULL', NULL, NULL, NULL, NULL, NULL, NULL, 5);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Absolutno', NULL, NULL, NULL, 'NameExoWorlds 2019 Czech Republic proposal: A fictional substance in the novel Továrna na absolutno by Karel Čapek.', NULL, NULL, 1);
INSERT INTO public.star VALUES (2, 'Alchiba', NULL, NULL, NULL, 'al-hiba ('' tent'' ). In the Calendarium of Al Achsasi Al Mouakket, it is designated al-manẖar al-ġurāb, translated into Latin as Rostrum Corvi (''beak of the crow'').', NULL, NULL, 2);
INSERT INTO public.star VALUES (3, 'Cocibolca', NULL, NULL, NULL, ' NameExoWorlds 2019 Nicaraguan proposal; named after Lake Nicaragua.', NULL, NULL, 3);
INSERT INTO public.star VALUES (4, 'Dombay', NULL, NULL, NULL, 'NameExoWorlds 2019 Russian proposal; named after the Dombay resort region in the North Caucasus.', NULL, NULL, 4);
INSERT INTO public.star VALUES (5, 'Ainalrami', NULL, NULL, NULL, 'ayn ar-rāmī (''eye of the archer'').', NULL, NULL, 5);
INSERT INTO public.star VALUES (6, 'Baten Kaitos', NULL, NULL, NULL, 'batn qaytus (''belly of the sea monster'').', NULL, NULL, 6);


--
-- Data for Name: table_5; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.table_5 VALUES (1, 'one', NULL, NULL, NULL, NULL, true, NULL);
INSERT INTO public.table_5 VALUES (2, 'two', NULL, NULL, NULL, NULL, false, NULL);
INSERT INTO public.table_5 VALUES (3, 'three', NULL, NULL, NULL, NULL, true, NULL);
INSERT INTO public.table_5 VALUES (4, 'four', NULL, NULL, NULL, NULL, true, NULL);
INSERT INTO public.table_5 VALUES (5, 'five', NULL, NULL, NULL, NULL, false, NULL);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 6, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 20, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 12, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 6, true);


--
-- Name: table_5_table_5_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.table_5_table_5_id_seq', 5, true);


--
-- Name: galaxy galaxy_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_name_key UNIQUE (name);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: moon moon_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_name_key UNIQUE (name);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name: planet planet_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_name_key UNIQUE (name);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


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
-- Name: table_5 table_5_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.table_5
    ADD CONSTRAINT table_5_name_key UNIQUE (name);


--
-- Name: table_5 table_5_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.table_5
    ADD CONSTRAINT table_5_pkey PRIMARY KEY (table_5_id);


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

