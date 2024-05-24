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
-- Name: constellation; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.constellation (
    constellation_id integer NOT NULL,
    galaxy_id integer NOT NULL,
    name character varying(30) NOT NULL
);


ALTER TABLE public.constellation OWNER TO freecodecamp;

--
-- Name: constellation_consellation_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.constellation_consellation_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.constellation_consellation_id_seq OWNER TO freecodecamp;

--
-- Name: constellation_consellation_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.constellation_consellation_id_seq OWNED BY public.constellation.constellation_id;


--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(30) NOT NULL,
    size_in_light_years integer NOT NULL,
    distance_from_earth integer,
    interesting_features text
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
    planet_id integer,
    name character varying(30),
    size_in_km numeric NOT NULL,
    days_to_orbit numeric NOT NULL
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
    star_id integer,
    name character varying(30) NOT NULL,
    has_life boolean,
    temperature_in_celcius integer,
    size numeric
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
    galaxy_id integer,
    constellation text NOT NULL,
    has_planets_in_orbit boolean NOT NULL,
    brightness numeric NOT NULL
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
-- Name: constellation constellation_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.constellation ALTER COLUMN constellation_id SET DEFAULT nextval('public.constellation_consellation_id_seq'::regclass);


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
-- Data for Name: constellation; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.constellation VALUES (1, 4, 'Ursa Major');
INSERT INTO public.constellation VALUES (2, 3, 'Canis Major');
INSERT INTO public.constellation VALUES (3, 3, 'Carina');
INSERT INTO public.constellation VALUES (4, 3, 'Centaurus');
INSERT INTO public.constellation VALUES (5, 3, 'Lyra');
INSERT INTO public.constellation VALUES (6, 3, 'Auriga');
INSERT INTO public.constellation VALUES (7, 3, 'Libra');
INSERT INTO public.constellation VALUES (8, 3, 'Cygnus');
INSERT INTO public.constellation VALUES (9, 3, 'Aquarius');


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Andromeda', 152000, 2500000, 'Andromeda is the closest big galaxy to the Milky Way and is expected to collide with the Milky Way around 4.5 billion years from now. The two will eventually merge into a single new galaxy called Milkdromeda.');
INSERT INTO public.galaxy VALUES (2, 'Black Eye', 53800, 17000000, 'A dark band of absorbing dust partially in front of its bright nucleus gave rise to its nicknames of the "Black Eye", "Evil Eye", or "Sleeping Beauty" galaxy');
INSERT INTO public.galaxy VALUES (3, 'Milky Way', 91000, 0, 'The galaxy containing the Sun and its Solar System, and therefore Earth.');
INSERT INTO public.galaxy VALUES (4, 'Pinwheel', 169300, 21000000, 'The Pinwheel Galaxy is a staggering 170,000 light-years across, nearly twice the diameter of our Milky Way Galaxy.');
INSERT INTO public.galaxy VALUES (5, 'Whirlpool', 76900, 23500000, 'The Whirlpool Galaxy is a textbook example of a grand design spiral galaxy.  Unlike our Milky Way''s messy spiral arms, the Whirlpool Galaxy boasts well-defined, tightly wound arms.  Scientists believe the gravitational pull of its companion is responsible for sculpting these impressive arms');
INSERT INTO public.galaxy VALUES (6, 'Cigar', 40800, 12000000, 'The Cigar Galaxy is undergoing a tremendous burst of star formation, creating new stars at a rate 10 times faster than our Milky Way!  This intense activity is fueled by the galaxy''s interaction with its neighbor, M81. Imagine a cosmic forge where stars are being churned out at an incredible pace.');


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 3, 'Moon', 3474, 27.32);
INSERT INTO public.moon VALUES (2, 5, 'Io', 3642, 1.77);
INSERT INTO public.moon VALUES (3, 5, 'Europa', 3122, 3.55);
INSERT INTO public.moon VALUES (4, 5, 'Ganymede', 5268, 7.15);
INSERT INTO public.moon VALUES (5, 5, 'Callisto', 4821, 16.69);
INSERT INTO public.moon VALUES (6, 6, 'Titan', 5150, 16);
INSERT INTO public.moon VALUES (7, 6, 'Rhea', 1528, 4.51);
INSERT INTO public.moon VALUES (8, 6, 'Iapetus', 1118, 4.31);
INSERT INTO public.moon VALUES (9, 6, 'Dione', 1492, 79.33);
INSERT INTO public.moon VALUES (10, 6, 'Tethys', 1071, 1.89);
INSERT INTO public.moon VALUES (11, 6, 'Enceladus', 504, 1.37);
INSERT INTO public.moon VALUES (12, 7, 'Miranda', 470, 1.41);
INSERT INTO public.moon VALUES (13, 7, 'Ariel', 1164, 2.52);
INSERT INTO public.moon VALUES (14, 7, 'Umbriel', 1169, 4.14);
INSERT INTO public.moon VALUES (15, 4, 'Phobos', 22.2, 0.32);
INSERT INTO public.moon VALUES (16, 4, 'Deimos', 12.6, 1.26);
INSERT INTO public.moon VALUES (17, 8, 'Triton', 2709, 5.87);
INSERT INTO public.moon VALUES (18, 8, 'Proteus', 434, 1.12);
INSERT INTO public.moon VALUES (19, 8, 'Nereid', 348, 359);
INSERT INTO public.moon VALUES (20, 8, 'Larissa', 200, 0.55);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 7, 'Mercury', false, 4000, 0.38);
INSERT INTO public.planet VALUES (2, 7, 'Venus', false, 7000, 0.95);
INSERT INTO public.planet VALUES (3, 7, 'Earth', true, 6000, 1);
INSERT INTO public.planet VALUES (4, 7, 'Mars', false, 1800, 0.68);
INSERT INTO public.planet VALUES (5, 7, 'Jupiter', false, 24000, 11.21);
INSERT INTO public.planet VALUES (6, 7, 'Saturn', false, 12000, 9.45);
INSERT INTO public.planet VALUES (7, 7, 'Uranus', false, 6800, 4.01);
INSERT INTO public.planet VALUES (8, 7, 'Neptune', false, 5400, 3.88);
INSERT INTO public.planet VALUES (9, 11, 'TRAPPIST-1e', false, 3000, 0.692);
INSERT INTO public.planet VALUES (10, 10, 'Kepler-186f', false, 2500, 1.17);
INSERT INTO public.planet VALUES (11, 9, 'Proxima Centauri b', false, 7000, 1.13);
INSERT INTO public.planet VALUES (12, 8, 'Gliese 581 g', false, 6000, 3.1);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'SN 2023ixf', 4, '1', false, 14.9);
INSERT INTO public.star VALUES (2, 'Sirius', 3, '2', false, -1.46);
INSERT INTO public.star VALUES (3, 'Canopus', 3, '3', false, -0.74);
INSERT INTO public.star VALUES (4, 'Alpha Centauri A', 3, '4', true, -0.01);
INSERT INTO public.star VALUES (5, 'Vega', 3, '5', false, 0.03);
INSERT INTO public.star VALUES (6, 'Capella', 3, '6', false, 0.08);
INSERT INTO public.star VALUES (7, 'Sun', 3, '3', true, -26.74);
INSERT INTO public.star VALUES (8, 'Gliese 581', 3, '8', true, 0.01205);
INSERT INTO public.star VALUES (9, 'Proxima Centauri', 3, '4', true, 11.13);
INSERT INTO public.star VALUES (10, 'Kepler-186', 3, '8', true, 0.05);
INSERT INTO public.star VALUES (11, 'TRAPPIST-1', 3, '9', true, 0.0005);


--
-- Name: constellation_consellation_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.constellation_consellation_id_seq', 9, true);


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

SELECT pg_catalog.setval('public.star_star_id_seq', 11, true);


--
-- Name: constellation constellation_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.constellation
    ADD CONSTRAINT constellation_name_key UNIQUE (name);


--
-- Name: constellation constellation_name_key1; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.constellation
    ADD CONSTRAINT constellation_name_key1 UNIQUE (name);


--
-- Name: constellation constellation_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.constellation
    ADD CONSTRAINT constellation_pkey PRIMARY KEY (constellation_id);


--
-- Name: galaxy galaxy_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_name_key UNIQUE (name);


--
-- Name: galaxy galaxy_name_key1; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_name_key1 UNIQUE (name);


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
-- Name: star star_name_key1; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_name_key1 UNIQUE (name);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: constellation constellation_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.constellation
    ADD CONSTRAINT constellation_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


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

