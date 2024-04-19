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
-- Name: asteroid; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.asteroid (
    asteroid_id integer NOT NULL,
    name character varying(40) NOT NULL,
    diam_km integer NOT NULL,
    inclination numeric(8,4),
    discovery_date date NOT NULL,
    galaxy_id integer NOT NULL,
    astronomer_id integer NOT NULL
);


ALTER TABLE public.asteroid OWNER TO freecodecamp;

--
-- Name: asteroid_asteroid_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.asteroid_asteroid_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.asteroid_asteroid_id_seq OWNER TO freecodecamp;

--
-- Name: asteroid_asteroid_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.asteroid_asteroid_id_seq OWNED BY public.asteroid.asteroid_id;


--
-- Name: astronomer; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.astronomer (
    astronomer_id integer NOT NULL,
    name character varying(50) NOT NULL,
    gender character varying(20) NOT NULL,
    date_of_birth date NOT NULL,
    dyied date,
    country character varying(40) NOT NULL
);


ALTER TABLE public.astronomer OWNER TO freecodecamp;

--
-- Name: astronomer_astronomer_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.astronomer_astronomer_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.astronomer_astronomer_id_seq OWNER TO freecodecamp;

--
-- Name: astronomer_astronomer_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.astronomer_astronomer_id_seq OWNED BY public.astronomer.astronomer_id;


--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(40) NOT NULL,
    number_stars_million numeric(10,2) NOT NULL,
    diameter_ly numeric(12,2) NOT NULL,
    distance_earth_ly bigint NOT NULL
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
    name character varying(40) NOT NULL,
    diam_km numeric(10,2) NOT NULL,
    distance_its_planet_km bigint,
    has_reg_traject boolean NOT NULL,
    astronomer_id integer NOT NULL,
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
    name character varying(50) NOT NULL,
    description text NOT NULL,
    diameter_km numeric(12,2),
    has_life boolean NOT NULL,
    galaxy_id integer NOT NULL,
    planet_types_id integer NOT NULL,
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
-- Name: planet_types; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet_types (
    planet_types_id integer NOT NULL,
    name character varying(50) NOT NULL,
    definition text NOT NULL,
    structure text
);


ALTER TABLE public.planet_types OWNER TO freecodecamp;

--
-- Name: planet_types_planet_types_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.planet_types_planet_types_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.planet_types_planet_types_id_seq OWNER TO freecodecamp;

--
-- Name: planet_types_planet_types_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.planet_types_planet_types_id_seq OWNED BY public.planet_types.planet_types_id;


--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    name character varying(50) NOT NULL,
    tempreture_far numeric(10,2) NOT NULL,
    age_million_y numeric(10,2) NOT NULL,
    color character varying(50) NOT NULL,
    is_spherical boolean NOT NULL,
    galaxy_id integer NOT NULL,
    color_num integer
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
-- Name: asteroid asteroid_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.asteroid ALTER COLUMN asteroid_id SET DEFAULT nextval('public.asteroid_asteroid_id_seq'::regclass);


--
-- Name: astronomer astronomer_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.astronomer ALTER COLUMN astronomer_id SET DEFAULT nextval('public.astronomer_astronomer_id_seq'::regclass);


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
-- Name: planet_types planet_types_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet_types ALTER COLUMN planet_types_id SET DEFAULT nextval('public.planet_types_planet_types_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Data for Name: asteroid; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.asteroid VALUES (1, '4 Vesta', 525, 48.0000, '1807-03-29', 1, 1);
INSERT INTO public.asteroid VALUES (2, '99942 Apophis', 370, 3.3390, '2004-06-19', 1, 2);
INSERT INTO public.asteroid VALUES (3, '11 parthenope', 149, 4.3000, '1850-05-11', 1, 3);
INSERT INTO public.asteroid VALUES (4, '87 Sylvia', 286, 10.9000, '1866-05-16', 1, 4);
INSERT INTO public.asteroid VALUES (5, '588 Achilles', 135, 10.0000, '1906-02-22', 1, 5);
INSERT INTO public.asteroid VALUES (6, '1125 china', 22, 3.0407, '1957-10-30', 1, 11);


--
-- Data for Name: astronomer; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.astronomer VALUES (1, 'heinrich willhelm Mallhias Olbers', 'male', '1758-10-11', '1840-03-02', 'Germany');
INSERT INTO public.astronomer VALUES (2, 'David J Tholen', 'male', '1955-07-31', NULL, 'America');
INSERT INTO public.astronomer VALUES (3, 'Annibal de Gasparis', 'male', '1819-11-09', '1892-03-21', 'Italy');
INSERT INTO public.astronomer VALUES (4, 'Franck Marchis', 'male', '1973-04-06', NULL, 'France');
INSERT INTO public.astronomer VALUES (5, 'Max Wolf', 'male', '1863-06-21', '1932-10-03', 'Germany');
INSERT INTO public.astronomer VALUES (6, 'Glileo Galilei', 'male', '1564-02-15', '1642-01-08', 'Italy');
INSERT INTO public.astronomer VALUES (7, 'Giovani Domenico', 'male', '1625-06-08', '1712-09-14', 'Italy');
INSERT INTO public.astronomer VALUES (8, 'Christiano Huygens', 'male', '1629-04-14', '1695-07-08', 'Germany');
INSERT INTO public.astronomer VALUES (9, 'G. Edward Danielson', 'male', '1919-06-16', '1997-04-28', 'USA');
INSERT INTO public.astronomer VALUES (10, 'William Herschel', 'male', '1738-11-15', '1822-08-25', 'England');
INSERT INTO public.astronomer VALUES (11, 'Charles Dillon Perrine', 'male', '1867-07-28', '1951-06-21', 'USA');
INSERT INTO public.astronomer VALUES (12, 'Gerard Kuiper', 'male', '1905-12-03', '1973-12-23', 'Germany');
INSERT INTO public.astronomer VALUES (13, 'James W. Christy', 'male', '1938-09-15', '2000-01-06', 'USA');
INSERT INTO public.astronomer VALUES (14, 'Stephan P. Synott', 'male', '1946-12-03', '2014-09-01', 'USA');
INSERT INTO public.astronomer VALUES (15, 'William Lassel', 'male', '1799-06-18', '1880-10-05', 'England');
INSERT INTO public.astronomer VALUES (16, 'Asaph Hall', 'male', '1829-10-15', '1907-11-22', 'USA');
INSERT INTO public.astronomer VALUES (17, 'eternity', 'from the creation', '0001-01-01', NULL, 'universal');
INSERT INTO public.astronomer VALUES (18, 'Zhang Yvzhe', 'male', '1973-09-03', NULL, 'china');


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', 300.00, 105700.00, 0);
INSERT INTO public.galaxy VALUES (2, 'Andromeda', 1000000.00, 220000.00, 32537000000);
INSERT INTO public.galaxy VALUES (3, 'Pinwheel', 1000000.00, 170000.00, 20870000);
INSERT INTO public.galaxy VALUES (4, 'Sombrero', 100000.00, 50000.00, 23350000);
INSERT INTO public.galaxy VALUES (5, 'whirlpool', 100000.00, 60000.00, 31000000);
INSERT INTO public.galaxy VALUES (6, 'NGC', 130000.00, 110000.00, 350000000);
INSERT INTO public.galaxy VALUES (7, 'Sagittarius', 51.00, 24.00, 27710);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Ganymed', 5268.20, 2631, true, 6, 5);
INSERT INTO public.moon VALUES (2, 'Lapetus', 1469.00, 3561000, true, 7, 6);
INSERT INTO public.moon VALUES (3, 'Io', 3643.20, 422000, true, 6, 5);
INSERT INTO public.moon VALUES (4, 'Callisto', 4820.60, 1883000, true, 6, 5);
INSERT INTO public.moon VALUES (5, 'Dione', 562.00, 377400, true, 7, 6);
INSERT INTO public.moon VALUES (6, 'Titan', 2575.00, 1200000, true, 8, 6);
INSERT INTO public.moon VALUES (7, 'Adrestea', 16.40, 129000, true, 9, 5);
INSERT INTO public.moon VALUES (8, 'Europa', 3121.60, 617000, true, 6, 5);
INSERT INTO public.moon VALUES (9, 'Enceladus', 252.10, 238000, true, 10, 6);
INSERT INTO public.moon VALUES (10, 'Himalia', 140.00, 11500000, true, 11, 5);
INSERT INTO public.moon VALUES (11, 'Mimas', 396.40, 186000, true, 10, 6);
INSERT INTO public.moon VALUES (12, 'Rhea', 1527.60, 527000, true, 7, 6);
INSERT INTO public.moon VALUES (13, 'Elara', 85.00, 11700000, true, 11, 5);
INSERT INTO public.moon VALUES (14, 'Mirand', 470.00, 129800, true, 12, 7);
INSERT INTO public.moon VALUES (15, 'Thebe', 98.60, 222000, true, 14, 5);
INSERT INTO public.moon VALUES (16, 'Moon', 3474.80, 384400, true, 17, 1);
INSERT INTO public.moon VALUES (17, 'Charon', 1212.00, 19640, true, 13, 9);
INSERT INTO public.moon VALUES (18, 'Hyperon', 270.00, 1500000, true, 15, 6);
INSERT INTO public.moon VALUES (19, 'Triton', 2706.80, 354800, true, 15, 8);
INSERT INTO public.moon VALUES (20, 'Phabos', 22533.00, 6000, true, 16, 4);
INSERT INTO public.moon VALUES (21, 'Deimos', 22.00, 23436, true, 16, 4);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Mercury', 'the first planet from the Sun and the smallest in the Solar System', 4879.40, false, 1, 1, 8);
INSERT INTO public.planet VALUES (2, 'Venus', 'Venus is the second planet from the Sun. Has the densest the densest atmosphere of the terrestrial planets, composed mostly of carbon dioxide with a thick, global sulfuric acid cloud cover.', 12104.00, false, 1, 1, 8);
INSERT INTO public.planet VALUES (3, 'Earth', 'Earth is the third planet from the Sun and the only astronomical object known to harbor life.', 12742.00, true, 1, 1, 8);
INSERT INTO public.planet VALUES (4, 'Mars', 'Mars is the fourth planet from the Sun. The surface of Mars is orange-red because it is covered in iron(III) oxide dust, giving it the nickname "the Red Planet".', 6779.00, false, 1, 1, 8);
INSERT INTO public.planet VALUES (5, 'Jupiter', 'is the fifth planet from the Sun and the largest in the Solar System', 142800.00, false, 1, 2, 8);
INSERT INTO public.planet VALUES (6, 'Saturn', 'is the sixth planet from the Sun and the second-largest in the Solar System', 120500.00, false, 1, 2, 8);
INSERT INTO public.planet VALUES (7, 'Uranus', 'is the seventh planet from the Sun. It is a gaseous cyan-coloured', 51118.00, false, 1, 3, 8);
INSERT INTO public.planet VALUES (8, 'Neptune', ' is the eighth and farthest known planet from the Sun. It is the fourth-largest planet in the Solar System by diameter, the third-most-massive planet, and the densest giant planet. ', 49529.00, false, 1, 3, 8);
INSERT INTO public.planet VALUES (9, 'Pluto', ' is the eighth and farthest known planet from the Sun. It is the fourth-largest planet in the Solar System by diameter, the third-most-massive planet, and the densest giant planet. ', 2376.60, false, 1, 4, 8);
INSERT INTO public.planet VALUES (10, 'SWEEPS-11', 'SWEEPS-11 is an extrasolar planet orbiting the star SWEEPS J175902.67−291153.5 in the constellation Sagittarius, approximately 27,710 light years away from the Solar System', NULL, false, 7, 5, 4);
INSERT INTO public.planet VALUES (11, 'SWEEPS-04', 'SWEEPS-04 is an extrasolar planet orbiting the star SWEEPS J175853.92−291120.6 in the constellation Sagittarius', NULL, false, 7, 5, 4);
INSERT INTO public.planet VALUES (12, 'M51-ULS-1b', 'orbiting the high-mass X-ray binary M51-ULS-1 in this galaxy was announced. If confirmed, it would be the first known instance of an extragalactic planet', NULL, false, 7, 5, 4);


--
-- Data for Name: planet_types; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet_types VALUES (1, 'terrestrial', 'A terrestrial planet, telluric planet, or rocky planet, is a planet that is composed primarily of silicate, rocks or metals. ', 'central metallic core (mostly iron) with a surrounding silicate mantle.');
INSERT INTO public.planet_types VALUES (2, 'gas giant', 'A gas giant is a giant planet composed mainly of hydrogen and helium.', 'helium hydrogen');
INSERT INTO public.planet_types VALUES (3, 'ice giant', 'An ice giant is a giant planet composed mainly of elements heavier than hydrogen and helium, such as oxygen, carbon, nitrogen, and sulfur', 'oxygen, carbon, nitrogen, and sulfur');
INSERT INTO public.planet_types VALUES (4, 'dwarf planet', 'A dwarf planet is a small planetary-mass object that is in direct orbit around the Sun,', 'The category dwarf planet arose from a conflict between dynamical and geophysical ideas of what a useful conception of a planet would be');
INSERT INTO public.planet_types VALUES (5, 'extragalactic', 'An extragalactic planet, also known as an extragalactic exoplanet or an extroplanet is a star-bound planet or rogue planet located outside of the Milky Way Galaxy.', NULL);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Betelgeuse', 4800.00, 10.01, 'orange-red', true, 1, 1);
INSERT INTO public.star VALUES (2, 'Sirius', 18000.00, 230.00, 'blue-white', false, 1, 1);
INSERT INTO public.star VALUES (3, 'Canope', 13600.00, 10.00, 'Yellowish white', true, 1, 1);
INSERT INTO public.star VALUES (4, 'Antares', 6400.00, 11.01, 'reddish', true, 1, 1);
INSERT INTO public.star VALUES (5, 'Arcturus', 7300.00, 8500.00, 'reddish orange', false, 1, 1);
INSERT INTO public.star VALUES (6, 'Vega', 16820.00, 455.00, 'bluish orange', true, 1, 1);
INSERT INTO public.star VALUES (7, 'Rigel', 21000.00, 9.00, 'blue white', true, 1, 1);
INSERT INTO public.star VALUES (8, 'sun', 10000.00, 4603.00, 'rain boy', true, 1, 7);


--
-- Name: asteroid_asteroid_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.asteroid_asteroid_id_seq', 6, true);


--
-- Name: astronomer_astronomer_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.astronomer_astronomer_id_seq', 18, true);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 7, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 21, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 12, true);


--
-- Name: planet_types_planet_types_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_types_planet_types_id_seq', 5, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 8, true);


--
-- Name: asteroid asteroid_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.asteroid
    ADD CONSTRAINT asteroid_name_key UNIQUE (name);


--
-- Name: asteroid asteroid_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.asteroid
    ADD CONSTRAINT asteroid_pkey PRIMARY KEY (asteroid_id);


--
-- Name: astronomer astronomer_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.astronomer
    ADD CONSTRAINT astronomer_name_key UNIQUE (name);


--
-- Name: astronomer astronomer_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.astronomer
    ADD CONSTRAINT astronomer_pkey PRIMARY KEY (astronomer_id);


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
-- Name: planet_types planet_types_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet_types
    ADD CONSTRAINT planet_types_name_key UNIQUE (name);


--
-- Name: planet_types planet_types_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet_types
    ADD CONSTRAINT planet_types_pkey PRIMARY KEY (planet_types_id);


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
-- Name: asteroid asteroid_astronomer_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.asteroid
    ADD CONSTRAINT asteroid_astronomer_id_fkey FOREIGN KEY (astronomer_id) REFERENCES public.astronomer(astronomer_id);


--
-- Name: asteroid asteroid_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.asteroid
    ADD CONSTRAINT asteroid_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- Name: moon moon_astronomer_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_astronomer_id_fkey FOREIGN KEY (astronomer_id) REFERENCES public.astronomer(astronomer_id);


--
-- Name: moon moon_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: planet planet_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- Name: planet planet_planet_types_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_planet_types_id_fkey FOREIGN KEY (planet_types_id) REFERENCES public.planet_types(planet_types_id);


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

