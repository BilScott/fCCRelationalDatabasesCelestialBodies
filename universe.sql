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
-- Name: comet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.comet (
    comet_id integer NOT NULL,
    name character varying(50) NOT NULL,
    ra integer,
    "dec" integer,
    dist_in_ly numeric(6,2),
    orbital_period numeric(5,2),
    tail_length_km numeric(8,2),
    description text NOT NULL,
    last_observed_date date,
    visible boolean,
    discovered_by character varying(50),
    year_discovered integer
);


ALTER TABLE public.comet OWNER TO freecodecamp;

--
-- Name: comet_comet_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.comet_comet_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.comet_comet_id_seq OWNER TO freecodecamp;

--
-- Name: comet_comet_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.comet_comet_id_seq OWNED BY public.comet.comet_id;


--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(30) NOT NULL,
    ra integer,
    "dec" integer,
    dist_in_ly numeric(4,1),
    description text NOT NULL,
    visible boolean,
    bigger_than_earth boolean
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
    ra integer,
    "dec" integer,
    dist_in_ly numeric(4,1),
    description text NOT NULL,
    visible boolean,
    bigger_than_earth boolean,
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
    name character varying(30) NOT NULL,
    ra integer,
    "dec" integer,
    dist_in_ly numeric(4,1),
    description text NOT NULL,
    visible boolean,
    bigger_than_earth boolean,
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
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    name character varying(30) NOT NULL,
    ra integer,
    "dec" integer,
    dist_in_ly numeric(4,1),
    description text NOT NULL,
    visible boolean,
    bigger_than_earth boolean,
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
-- Name: comet comet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.comet ALTER COLUMN comet_id SET DEFAULT nextval('public.comet_comet_id_seq'::regclass);


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
-- Data for Name: comet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.comet VALUES (1, 'Halley', 134, -12, 0.00, 75.30, 240000.00, 'Famous comet visible every 75-76 years', '1986-02-09', false, 'Edmond Halley', 1758);
INSERT INTO public.comet VALUES (2, 'Hale-Bopp', 204, -17, 0.00, 253.30, 560000.00, 'Large and bright comet visible in 1997', '1997-03-22', false, 'Alan Hale, Thomas Bopp', 1995);
INSERT INTO public.comet VALUES (3, 'Encke', 161, 2, 0.00, 3.30, 300000.00, 'Comet with one of the shortest known orbital periods', '2017-03-10', false, 'Pierre Méchain', 1786);
INSERT INTO public.comet VALUES (4, 'Borrelly', 147, -5, 0.00, 6.86, 800000.00, 'Comet visited by the Deep Space 1 spacecraft', '2001-09-21', false, 'Alphonse Borrelly', 1904);
INSERT INTO public.comet VALUES (5, 'Tempel 1', 177, -19, 0.00, 5.52, 240000.00, 'Comet impacted by NASA’s Deep Impact probe', '2005-07-04', false, 'Ernst Wilhelm Tempel', 1867);
INSERT INTO public.comet VALUES (6, 'Neowise', 225, 46, 0.01, 676.70, 410000.00, 'Bright comet discovered by the NEOWISE mission', '2020-07-23', false, 'NEOWISE', 2020);
INSERT INTO public.comet VALUES (7, 'Lovejoy', 95, -42, 0.00, 622.00, 120000.00, 'Comet discovered by Australian astronomer Terry Lovejoy', '2011-12-15', false, 'Terry Lovejoy', 2011);
INSERT INTO public.comet VALUES (8, 'Swift-Tuttle', 139, -9, 0.00, 133.00, 260000.00, 'Parent body of the Perseid meteor shower', '1992-07-22', false, 'Lewis Swift, Horace Parnell Tuttle', 1862);
INSERT INTO public.comet VALUES (9, 'Siding Spring', 208, -30, 0.00, 400.00, 100000.00, 'Comet that passed close to Mars in 2014', '2014-10-19', false, 'Robert McNaught', 2007);
INSERT INTO public.comet VALUES (10, 'Comet X9', 186, -22, 0.00, 82.00, 150000.00, 'Fictional comet with an unusually fast orbit', '2032-09-15', true, 'Unknown', 2032);
INSERT INTO public.comet VALUES (11, 'Shoemaker-Levy 9', 244, -13, 0.00, 7.50, 700000.00, 'Comet that collided with Jupiter in 1994', '1994-07-16', false, 'Carolyn and Eugene Shoemaker, David Levy', 1993);
INSERT INTO public.comet VALUES (12, 'Bennett', 215, 7, 0.00, 169.00, 480000.00, 'Bright comet visible in 1970', '1970-03-26', false, 'John Caister Bennett', 1969);
INSERT INTO public.comet VALUES (13, 'Hyakutake', 154, 25, 0.00, 300.00, 100000.00, 'Comet that passed close to Earth in 1996', '1996-03-25', false, 'Yuji Hyakutake', 1996);
INSERT INTO public.comet VALUES (14, 'Comet C12', 144, -11, 0.01, 500.00, 230000.00, 'Fictional comet with a large, glowing tail', '2024-05-01', true, 'John Doe', 2024);
INSERT INTO public.comet VALUES (15, 'Ikeya-Seki', 212, -5, 0.00, 880.00, 160000.00, 'Brightest comet of the 20th century', '1965-10-21', false, 'Kaoru Ikeya, Tsutomu Seki', 1965);
INSERT INTO public.comet VALUES (16, 'West', 203, 10, 0.00, 558.00, 150000.00, 'Comet visible in 1976 with a large tail', '1976-02-25', false, 'Richard West', 1975);
INSERT INTO public.comet VALUES (17, 'McNaught', 130, 22, 0.00, 500.00, 350000.00, 'Great comet of 2007, visible from the southern hemisphere', '2007-01-12', false, 'Robert McNaught', 2006);
INSERT INTO public.comet VALUES (18, 'Tebbutt', 188, -31, 0.00, 400.00, 300000.00, 'Comet visible in 1861, during the American Civil War', '1861-06-29', false, 'John Tebbutt', 1861);
INSERT INTO public.comet VALUES (19, 'C/2011 W3', 170, -18, 0.00, 700.00, 220000.00, 'Sungrazer comet discovered by Terry Lovejoy', '2011-12-16', false, 'Terry Lovejoy', 2011);
INSERT INTO public.comet VALUES (20, 'Comet W20', 163, -10, 0.00, 350.00, 500000.00, 'Fictional comet visible in 2025', '2025-06-05', true, 'Jane Smith', 2025);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'The Milky Way', 95, 43, 717.6, 'Home Galaxy', true, true);
INSERT INTO public.galaxy VALUES (2, 'The Andromeda Galaxy', 7, 100, 416.8, 'M31', true, true);
INSERT INTO public.galaxy VALUES (3, 'The Whirlpool Galaxy', 3, 95, 146.8, 'M51', true, true);
INSERT INTO public.galaxy VALUES (4, 'The Triangulum Galaxy', 25, 70, 785.4, 'M33', true, true);
INSERT INTO public.galaxy VALUES (5, 'The Sombrero Galaxy', 39, 27, 343.9, 'M104', true, true);
INSERT INTO public.galaxy VALUES (6, 'M81 and M82', 26, 73, 694.4, 'M81 and M82', true, true);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Moon', 103, 18, 1.0, 'Earth’s natural satellite', true, false, 3);
INSERT INTO public.moon VALUES (2, 'Phobos', 104, 19, 1.5, 'One of the moons of Mars', false, false, 4);
INSERT INTO public.moon VALUES (3, 'Deimos', 104, 19, 1.5, 'The smaller and outer moon of Mars', false, false, 4);
INSERT INTO public.moon VALUES (4, 'Io', 105, 20, 5.2, 'Volcanically active moon of Jupiter', false, false, 5);
INSERT INTO public.moon VALUES (5, 'Europa', 105, 20, 5.2, 'Icy moon with a subsurface ocean', false, false, 5);
INSERT INTO public.moon VALUES (6, 'Ganymede', 105, 20, 5.2, 'Largest moon in the Solar System', false, true, 5);
INSERT INTO public.moon VALUES (7, 'Callisto', 105, 20, 5.2, 'Heavily cratered moon of Jupiter', false, false, 5);
INSERT INTO public.moon VALUES (8, 'Titan', 106, 21, 9.5, 'Largest moon of Saturn, with a thick atmosphere', false, true, 6);
INSERT INTO public.moon VALUES (9, 'Enceladus', 106, 21, 9.5, 'Icy moon of Saturn, with geysers of water', false, false, 6);
INSERT INTO public.moon VALUES (10, 'Mimas', 106, 21, 9.5, 'Small moon of Saturn, known for its large crater', false, false, 6);
INSERT INTO public.moon VALUES (11, 'Tethys', 106, 21, 9.5, 'Moon of Saturn, primarily composed of water ice', false, false, 6);
INSERT INTO public.moon VALUES (12, 'Oberon', 107, 22, 19.8, 'Outer moon of Uranus', false, false, 7);
INSERT INTO public.moon VALUES (13, 'Titania', 107, 22, 19.8, 'Largest moon of Uranus', false, false, 7);
INSERT INTO public.moon VALUES (14, 'Ariel', 107, 22, 19.8, 'Bright moon of Uranus with canyons', false, false, 7);
INSERT INTO public.moon VALUES (15, 'Miranda', 107, 22, 19.8, 'Innermost moon of Uranus', false, false, 7);
INSERT INTO public.moon VALUES (16, 'Triton', 108, 23, 30.1, 'Largest moon of Neptune, with a retrograde orbit', false, false, 8);
INSERT INTO public.moon VALUES (17, 'Nereid', 108, 23, 30.1, 'Outer moon of Neptune with an eccentric orbit', false, false, 8);
INSERT INTO public.moon VALUES (20, 'Oberun', 220, 25, 0.0, 'Second-largest moon of Uranus with a dark, heavily cratered surface', false, false, 18);
INSERT INTO public.moon VALUES (18, 'Phoebe', 160, -8, 0.0, 'Small, irregularly shaped moon of Mars', false, false, 8);
INSERT INTO public.moon VALUES (19, 'Europe', 245, -16, 0.0, 'Icy moon of Jupiter with a potential subsurface ocean', false, false, 13);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Mercury', 101, 16, 0.4, 'Closest planet to the Sun', false, false, 1);
INSERT INTO public.planet VALUES (2, 'Venus', 102, 17, 0.7, 'Hottest planet in the Solar System', false, false, 2);
INSERT INTO public.planet VALUES (3, 'Earth', 103, 18, 1.0, 'Our home planet', true, false, 3);
INSERT INTO public.planet VALUES (4, 'Mars', 104, 19, 1.5, 'The Red Planet', true, false, 4);
INSERT INTO public.planet VALUES (5, 'Jupiter', 105, 20, 5.2, 'Largest planet in the Solar System', true, true, 5);
INSERT INTO public.planet VALUES (6, 'Saturn', 106, 21, 9.5, 'Planet with prominent rings', true, true, 6);
INSERT INTO public.planet VALUES (7, 'Uranus', 107, 22, 19.8, 'Ice giant with a tilted axis', true, true, 7);
INSERT INTO public.planet VALUES (8, 'Neptune', 108, 23, 30.1, 'Farthest known planet in the Solar System', true, true, 8);
INSERT INTO public.planet VALUES (9, 'Proxima b', 217, -62, 4.2, 'Planet in the habitable zone of Proxima Centauri', false, true, 9);
INSERT INTO public.planet VALUES (10, 'Gliese 581g', 153, -7, 20.3, 'Potentially habitable exoplanet', false, true, 10);
INSERT INTO public.planet VALUES (11, 'Kepler-22b', 298, 8, 620.0, 'Exoplanet located in the habitable zone', false, true, 11);
INSERT INTO public.planet VALUES (12, 'HD 209458 b', 330, 18, 150.0, 'First exoplanet observed transiting its star', false, true, 12);
INSERT INTO public.planet VALUES (13, 'Trappist-1e', 118, -63, 39.0, 'One of seven Earth-sized planets orbiting Trappist-1', false, false, 13);
INSERT INTO public.planet VALUES (14, 'Trappist-1f', 119, -64, 40.0, 'Another Earth-sized planet in the Trappist-1 system', false, false, 13);
INSERT INTO public.planet VALUES (15, 'Ross 128 b', 212, 20, 11.0, 'Exoplanet orbiting red dwarf Ross 128', false, true, 14);
INSERT INTO public.planet VALUES (16, 'LHS 1140 b', 123, 25, 40.6, 'Exoplanet in the habitable zone of LHS 1140', false, true, 15);
INSERT INTO public.planet VALUES (17, 'K2-18b', 112, 8, 124.0, 'Exoplanet with potential water clouds', false, true, 16);
INSERT INTO public.planet VALUES (18, 'HD 40307g', 254, 15, 42.0, 'Exoplanet in a star’s habitable zone', false, true, 17);
INSERT INTO public.planet VALUES (19, 'Tau Ceti e', 82, -7, 11.9, 'Exoplanet orbiting the nearby star Tau Ceti', false, true, 18);
INSERT INTO public.planet VALUES (20, '55 Cancri e', 132, 28, 40.0, 'Super-Earth exoplanet orbiting 55 Cancri', false, true, 19);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sirius', 101, 16, 8.6, 'Brightest star in the night sky', true, true, 1);
INSERT INTO public.star VALUES (2, 'Betelgeuse', 88, 7, 642.5, 'Red supergiant in Orion', true, true, 3);
INSERT INTO public.star VALUES (3, 'Rigel', 78, -8, 860.0, 'Blue supergiant in Orion', true, true, 2);
INSERT INTO public.star VALUES (4, 'Proxima Centauri', 217, -62, 4.2, 'Closest known star to the Sun', true, false, 4);
INSERT INTO public.star VALUES (5, 'Vega', 279, 38, 25.0, 'Bright star in Lyra', true, true, 1);
INSERT INTO public.star VALUES (6, 'Deneb', 310, 45, 425.0, 'Bright star in Cygnus', true, true, 5);
INSERT INTO public.star VALUES (7, 'Altair', 297, 8, 16.7, 'Fast-spinning star in Aquila', true, true, 3);
INSERT INTO public.star VALUES (8, 'Antares', 247, -26, 550.0, 'Red supergiant in Scorpius', true, true, 2);
INSERT INTO public.star VALUES (9, 'Spica', 202, -11, 250.0, 'Binary star system in Virgo', true, true, 6);
INSERT INTO public.star VALUES (10, 'Polaris', 37, 89, 323.0, 'North Star', true, true, 1);
INSERT INTO public.star VALUES (11, 'Fomalhaut', 344, -29, 25.1, 'Bright star in Piscis Austrinus', true, true, 4);
INSERT INTO public.star VALUES (12, 'Aldebaran', 68, 16, 65.1, 'Bright star in Taurus', true, true, 5);
INSERT INTO public.star VALUES (13, 'Castor', 113, 32, 51.6, 'Multiple star system in Gemini', true, true, 2);
INSERT INTO public.star VALUES (14, 'Pollux', 114, 28, 33.7, 'Bright star in Gemini', true, true, 6);
INSERT INTO public.star VALUES (15, 'Arcturus', 213, 19, 36.7, 'Bright star in Bootes', true, true, 1);
INSERT INTO public.star VALUES (16, 'Capella', 79, 46, 42.9, 'Bright star in Auriga', true, true, 2);
INSERT INTO public.star VALUES (17, 'Bellatrix', 82, 6, 240.0, 'Star in Orion', true, true, 3);
INSERT INTO public.star VALUES (18, 'Algol', 47, 41, 92.8, 'Eclipsing binary in Perseus', true, true, 5);
INSERT INTO public.star VALUES (19, 'Mira', 34, -3, 300.0, 'Variable star in Cetus', true, true, 4);
INSERT INTO public.star VALUES (20, 'Canopus', 261, -52, 310.0, 'Second-brightest star in the sky', true, true, 6);


--
-- Name: comet_comet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.comet_comet_id_seq', 20, true);


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

SELECT pg_catalog.setval('public.planet_planet_id_seq', 20, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 20, true);


--
-- Name: comet comet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.comet
    ADD CONSTRAINT comet_pkey PRIMARY KEY (comet_id);


--
-- Name: comet comet_unique_description; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.comet
    ADD CONSTRAINT comet_unique_description UNIQUE (description);


--
-- Name: comet comet_unique_name; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.comet
    ADD CONSTRAINT comet_unique_name UNIQUE (name);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name: moon moon_unique_description; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_unique_description UNIQUE (description);


--
-- Name: moon moon_unique_name; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_unique_name UNIQUE (name);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: planet planet_unique_description; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_unique_description UNIQUE (description);


--
-- Name: planet planet_unique_name; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_unique_name UNIQUE (name);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: star star_unique_description; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_unique_description UNIQUE (description);


--
-- Name: star star_unique_name; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_unique_name UNIQUE (name);


--
-- Name: galaxy unique_description; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT unique_description UNIQUE (description);


--
-- Name: galaxy unique_name; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT unique_name UNIQUE (name);


--
-- Name: star fk_galaxy; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT fk_galaxy FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- Name: moon fk_planet; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT fk_planet FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: planet fk_star; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT fk_star FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- PostgreSQL database dump complete
--

