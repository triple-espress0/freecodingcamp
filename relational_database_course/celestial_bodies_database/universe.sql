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
    name character varying(30) NOT NULL,
    age_in_million_years integer,
    number_of_stars integer,
    distance_from_earth_in_mpc numeric(6,2),
    description text NOT NULL,
    has_life boolean,
    is_visible_from_earth boolean
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
    description text NOT NULL,
    age_in_milion_years integer,
    distance_from_earth_in_mpc numeric(6,2),
    planet_id integer,
    has_life boolean,
    has_been_visited boolean
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
    description text NOT NULL,
    age_in_milion_years integer,
    distance_from_earth_in_mpc numeric(6,2),
    star_id integer,
    has_life boolean,
    has_been_visited boolean
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
    description text NOT NULL,
    age_in_million_years integer,
    distance_from_earth_in_mpc numeric(6,2),
    galaxy_id integer,
    number_of_planets integer,
    is_visible_from_earth boolean,
    is_older_than_sun boolean,
    star_type_id integer NOT NULL
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
-- Name: star_type; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star_type (
    star_type_id integer NOT NULL,
    name character varying(30) NOT NULL,
    description text
);


ALTER TABLE public.star_type OWNER TO freecodecamp;

--
-- Name: star_type_star_type_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.star_type_star_type_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.star_type_star_type_id_seq OWNER TO freecodecamp;

--
-- Name: star_type_star_type_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.star_type_star_type_id_seq OWNED BY public.star_type.star_type_id;


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
-- Name: star_type star_type_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star_type ALTER COLUMN star_type_id SET DEFAULT nextval('public.star_type_star_type_id_seq'::regclass);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

COPY public.galaxy (galaxy_id, name, age_in_million_years, number_of_stars, distance_from_earth_in_mpc, description, has_life, is_visible_from_earth) FROM stdin;
1	Milky Way	\N	\N	\N	The Milky Way is the galaxy that includes the Solar System, with the name describing the galaxy's appearance from Earth: a hazy band of light seen in the night sky formed from stars that cannot be individually distinguished by the naked eye.	\N	\N
2	Eye of Sauron	\N	\N	\N	An intermediate spiral Seyfert galaxy with weak inner ring structure located 15.8 megaparsecs (52 million light-years) from Earth in the constellation Canes Venatici.	\N	\N
3	Fireworks Galaxy	\N	\N	\N	A face-on intermediate spiral galaxy with a small bright nucleus, whose location in the sky straddles the boundary between the northern constellations of Cepheus and Cygnus.	\N	\N
4	Malin 1	\N	\N	\N	Malin 1 is a giant low surface brightness spiral galaxy.	\N	\N
5	Sombrero Galaxy	\N	\N	\N	The Sombrero Galaxy is a peculiar galaxy of unclear classification in the constellation borders of Virgo and Corvus, being about 9.55 megaparsecs from the Milky Way galaxy.	\N	\N
6	Condor Galaxy	\N	\N	\N	A large barred spiral galaxy of type SBsb pec in the constellation Pavo.	\N	\N
\.


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

COPY public.moon (moon_id, name, description, age_in_milion_years, distance_from_earth_in_mpc, planet_id, has_life, has_been_visited) FROM stdin;
1	Luna	Luna is the moon of planet Earth and was formed as a result of a collision of a Mars-sized body with Earth.	\N	\N	1	\N	\N
2	Phobos	Phobos is the larger innermost moon, and is thought to be a rubble pile held together by a dark thin crust.	\N	\N	3	\N	\N
3	Europa	Europa, along with Callisto, Ganymede, and Io, were discovered by the Italian astronomer Galileo Galilei in 1610.	\N	\N	2	\N	\N
4	Tethys	It is composed almost entirely of pure ice. It has a very high albedo and is one of the most reflective object in the solar system.	\N	\N	4	\N	\N
5	Atlas	Its unusual shape comes from ring dust particles that impact its equatorial region as it orbits within the Roche Division.	\N	\N	5	\N	\N
6	Telesto	Co-orbital with the moon Tethys and resides in Tethys leading Lagrangian point.	\N	\N	4	\N	\N
7	Puck	Puck is believed to have water ice on its surface.	\N	\N	2	\N	\N
8	Sycorax	May belong to the same moon cluster as Setebos and Prospero.	\N	\N	6	\N	\N
9	Portia	Portia orbit is decaying due to tidal forces.	\N	\N	8	\N	\N
10	Setebos	Setebos is an irregular retrograde moon.	\N	\N	10	\N	\N
11	Sao	It orbits in a Kozai resonance.	\N	\N	11	\N	\N
12	Nix	It is a small, irregular-shaped moon.	\N	\N	7	\N	\N
13	Triton	Its surface is covered in nitrogen ice and water ice, with active nitrogen cryogeysers and water ice cryvolcanoes.	\N	\N	9	\N	\N
14	Mab	Mabs orbit is very perturbed by one or more nearby moons. Not much is known about this moon.	\N	\N	12	\N	\N
15	Caliban	Its believed to be a captured object and is light red in color.	\N	\N	8	\N	\N
16	Ariel	Its surface is composed of equal amounts of water ice and rock.	\N	\N	9	\N	\N
17	Ymir	It may be a contact binary double object.	\N	\N	7	\N	\N
18	Mimas	Mimas is responsible for clearing material from the Cassini Division	\N	\N	6	\N	\N
19	Rhea	It is composed of 75% water ice and 25% rocky material, and has a thin oxygen atmosphere.	\N	\N	11	\N	\N
20	Leda	Leda is a small moon.	\N	\N	5	\N	\N
\.


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

COPY public.planet (planet_id, name, description, age_in_milion_years, distance_from_earth_in_mpc, star_id, has_life, has_been_visited) FROM stdin;
1	Earth	Earth is the third planet from the Sun and the only place known in the universe where life has originated and found habitability.	\N	\N	1	\N	\N
2	TOI-1452b	A Water World Candidate	\N	\N	1	\N	\N
3	WASP-39 b	The First Found With Atmospheric Carbon Dioxide	\N	\N	1	\N	\N
4	WASP-103 b	The Rugby Ball Planet	\N	\N	3	\N	\N
5	TYC 8998-760-1 b	The Brown Dwarf	\N	\N	4	\N	\N
6	PSR B1257+12 A	The first exoplanet discovered still holds the record for being the least massive.	\N	\N	2	\N	\N
7	51 Pegasi b	The First Around a Sun-Like Star	\N	\N	5	\N	\N
8	PSR B1620-26 b	This is the oldest planet known, at somewhere around 12.7 billion years old. That is just a little younger than the universe itself.	\N	\N	6	\N	\N
9	Gliese 876 d	It’s only 15 light-years away. It’s small enough to be rocky, though far, far larger than Earth.	\N	\N	3	\N	\N
10	Gliese 581	Gliese-581c is on the inner edge of the habitable zone and may have suffered a fate similar to Venus, turning noxious and harsh.	\N	\N	3	\N	\N
11	Kepler-11 f	A confirmed mini-Neptune.	\N	\N	5	\N	\N
12	Kepler-452b	Almost definitely the most Earth-like planet found thus far.	\N	\N	4	\N	\N
\.


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

COPY public.star (star_id, name, description, age_in_million_years, distance_from_earth_in_mpc, galaxy_id, number_of_planets, is_visible_from_earth, is_older_than_sun, star_type_id) FROM stdin;
1	Sun	It is a nearly perfect ball of hot plasma, heated to incandescence by nuclear fusion reactions in its core.	\N	\N	1	\N	\N	\N	1
2	Sirius	Observed in NGC 4151	\N	\N	2	\N	\N	\N	2
3	Canopus	Canopus was well known to the ancients and is named either for an ancient city in northern Egypt	\N	\N	3	\N	\N	\N	3
4	Rigel Kentaurus	Rigel Kentaurus, also known as Alpha Centauri, is the third brightest star in the night sky.	\N	\N	4	\N	\N	\N	2
5	Vega	Vega is the fifth-brightest star in the night sky.	\N	\N	5	\N	\N	\N	2
6	Capella	The sixth brightest star in the sky is Capella.	\N	\N	6	\N	\N	\N	2
\.


--
-- Data for Name: star_type; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

COPY public.star_type (star_type_id, name, description) FROM stdin;
1	Solar-type	A Solar-type star has about the same mass as our Sun and is fusing hydrogen into helium at its core.
2	Hot Blue	Stars which are much more massive than our Sun burn hotter but for much less time, living and dying within a few million years.
3	Red Dwarf	Stars which are much less massive than our Sun burn cooler, and live longer – potentially for hundreds of billions of years.
\.


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
-- Name: star_type_star_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_type_star_type_id_seq', 3, true);


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
-- Name: star_type star_type_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star_type
    ADD CONSTRAINT star_type_name_key UNIQUE (name);


--
-- Name: star_type star_type_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star_type
    ADD CONSTRAINT star_type_pkey PRIMARY KEY (star_type_id);


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
-- Name: star star_star_type_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_star_type_id_fkey FOREIGN KEY (star_type_id) REFERENCES public.star_type(star_type_id);


--
-- PostgreSQL database dump complete
--

