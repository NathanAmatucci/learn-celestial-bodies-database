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

SET default_tablespace = '';

SET default_table_access_method = heap;


--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(20) NOT NULL,
    description text,
    has_life boolean,
    is_spherical boolean,
    age_in_millions_of_years numeric NOT NULL,
    galaxy_type integer,
    distance_from_heart integer
);


ALTER TABLE public.galaxy OWNER TO freecodecamp;

--
-- Name: galaxy_universe_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.galaxy_universe_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.galaxy_universe_id_seq OWNER TO freecodecamp;

--
-- Name: galaxy_universe_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.galaxy_universe_id_seq OWNED BY public.galaxy.galaxy_id;


--
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    name character varying(20) NOT NULL,
    description text,
    has_life boolean,
    is_spherical boolean,
    age_in_millions_of_years numeric NOT NULL,
    distance_from_heart integer,
    planet_id integer
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
    name character varying(20) NOT NULL,
    description text,
    has_life boolean,
    is_spherical boolean,
    age_in_millions_of_years numeric NOT NULL,
    planet_type integer,
    distance_from_heart integer,
    star_id integer
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
-- Name: satellite; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.satellite (
    satellite_id integer NOT NULL,
    satellite_name character varying(100),
    planet_id integer,
    moon_id integer,
    description text,
    name character varying(20) NOT NULL
);


ALTER TABLE public.satellite OWNER TO freecodecamp;

--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    name character varying(20) NOT NULL,
    description text,
    is_spherical boolean,
    age_in_millions_of_years numeric NOT NULL,
    distance_from_heart integer,
    galaxy_id integer
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

ALTER TABLE ONLY public.galaxy ALTER COLUMN galaxy_id SET DEFAULT nextval('public.galaxy_universe_id_seq'::regclass);


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

COPY public.galaxy (galaxy_id, name, description, has_life, is_spherical, age_in_millions_of_years, galaxy_type, distance_from_heart) FROM stdin;
1	Milky Way	Our home galaxy	t	t	13600	1	0
2	Andromeda	Nearest spiral galaxy	f	t	10000	1	2537000
3	Triangulum	Third largest in the Local Group	f	t	12000	1	3000000
4	Whirlpool	Famous for its spiral structure	f	t	500	1	23000000
5	Sombrero	Known for its bright nucleus	f	t	9000	2	29000000
6	Messier 87	A giant elliptical galaxy	f	f	13000	3	53000000
\.


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

COPY public.moon (moon_id, name, description, has_life, is_spherical, age_in_millions_of_years, distance_from_heart, planet_id) FROM stdin;
1	Moon	The only natural satellite of Earth	f	t	4500	384400	1
2	Phobos	A moon of Mars	f	t	4500	9376	2
3	Deimos	A moon of Mars	f	t	4500	23460	2
4	Io	A moon of Jupiter	f	t	4500	421700	3
5	Europa	A moon of Jupiter	f	t	4500	670900	3
6	Ganymede	The largest moon in the Solar System	f	t	4500	1070400	3
7	Callisto	A moon of Jupiter	f	t	4500	1882700	3
8	Titan	The largest moon of Saturn	f	t	4500	1221870	4
9	Rhea	A moon of Saturn	f	t	4500	527040	4
10	Iapetus	A moon of Saturn	f	t	4500	3561300	4
11	Dione	A moon of Saturn	f	t	4500	377400	4
12	Tethys	A moon of Saturn	f	t	4500	294660	4
13	Enceladus	A moon of Saturn	f	t	4500	238020	4
14	Miranda	A moon of Uranus	f	t	4500	129390	8
15	Ariel	A moon of Uranus	f	t	4500	191020	8
16	Umbriel	A moon of Uranus	f	t	4500	266000	8
17	Titania	The largest moon of Uranus	f	t	4500	436300	8
18	Oberon	A moon of Uranus	f	t	4500	583520	8
19	Triton	The largest moon of Neptune	f	t	4500	354800	7
20	Charon	The largest moon of Pluto	f	t	4500	19591	9
\.


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

COPY public.planet (planet_id, name, description, has_life, is_spherical, age_in_millions_of_years, planet_type, distance_from_heart, star_id) FROM stdin;
1	Earth	Our home planet	t	t	4500	1	0	1
2	Mars	The Red Planet	f	t	4500	1	225000000	1
3	Jupiter	The largest planet in our solar system	f	t	4500	2	778500000	1
4	Saturn	Known for its ring system	f	t	4500	2	1429000000	1
5	Venus	The hottest planet in our solar system	f	t	4500	1	108200000	1
6	Mercury	The smallest planet in our solar system	f	t	4500	1	57900000	1
7	Neptune	The farthest planet from the Sun	f	t	4500	2	449500000	1
8	Uranus	Known for its unique tilt	f	t	4500	2	287100000	1
9	Proxima b	An exoplanet orbiting Proxima Centauri	f	t	4500	3	4300000	4
10	Kepler-22b	An exoplanet in the habitable zone	f	t	4500	3	60000000	5
11	Gliese 581g	A potentially habitable exoplanet	f	t	4500	3	2000000	6
12	TRAPPIST-1d	One of the seven planets orbiting TRAPPIST-1	f	t	4500	3	4000000	6
\.


--
-- Data for Name: satellite; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

COPY public.satellite (satellite_id, satellite_name, planet_id, moon_id, description, name) FROM stdin;
1	Hubble Space Telescope	\N	\N	A space telescope that was launched into low Earth orbit in 1990	Hubble
2	Lunar Reconnaissance Orbiter	\N	1	A NASA robotic spacecraft currently orbiting the Moon	LRO
3	Mars Reconnaissance Orbiter	2	\N	A NASA spacecraft designed to study Mars from orbit	MRO
\.


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

COPY public.star (star_id, name, description, is_spherical, age_in_millions_of_years, distance_from_heart, galaxy_id) FROM stdin;
1	Sun	The star at the center of our solar system	t	4600	0	1
2	Alpha Centauri A	The closest star system to the Solar System	t	5500	4300000	2
3	Alpha Centauri B	Part of the Alpha Centauri star system	t	5500	4300000	2
4	Proxima Centauri	The closest known star to the Sun	t	4500	4300000	2
5	Betelgeuse	A red supergiant star in the constellation Orion	t	8500	640000	3
6	Sirius	The brightest star in the night sky	t	300	8600000	4
\.


--
-- Name: galaxy_universe_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_universe_id_seq', 1, false);


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
-- Name: satellite satellite_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.satellite
    ADD CONSTRAINT satellite_name_key UNIQUE (name);


--
-- Name: satellite satellite_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.satellite
    ADD CONSTRAINT satellite_pkey PRIMARY KEY (satellite_id);


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
-- Name: satellite fk_moon_satellite; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.satellite
    ADD CONSTRAINT fk_moon_satellite FOREIGN KEY (moon_id) REFERENCES public.moon(moon_id);


--
-- Name: satellite fk_planet_satellite; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.satellite
    ADD CONSTRAINT fk_planet_satellite FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


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

