--
-- PostgreSQL database dump
--

-- Dumped from database version 12.16 (Ubuntu 12.16-0ubuntu0.20.04.1)
-- Dumped by pg_dump version 12.16 (Ubuntu 12.16-0ubuntu0.20.04.1)

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
    name character varying(40) NOT NULL,
    description text,
    galaxy_type text NOT NULL,
    distance_from_earth_in_millions_of_years numeric(10,0)
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
    age_in_millions_of_years integer,
    planet_id integer,
    description text,
    has_life boolean
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
    name character varying(40) NOT NULL,
    has_life boolean,
    age_in_million_of_years integer,
    star_id integer NOT NULL,
    description text
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
    name character varying(20) NOT NULL,
    description text NOT NULL
);


ALTER TABLE public.planet_types OWNER TO freecodecamp;

--
-- Name: planet_types_type_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.planet_types_type_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.planet_types_type_id_seq OWNER TO freecodecamp;

--
-- Name: planet_types_type_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.planet_types_type_id_seq OWNED BY public.planet_types.planet_types_id;


--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    name character varying(40) NOT NULL,
    age_in_millions_of_years integer,
    galaxy_id integer NOT NULL,
    description text
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

ALTER TABLE ONLY public.planet_types ALTER COLUMN planet_types_id SET DEFAULT nextval('public.planet_types_type_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Via Lactea', 'Nuestra galaxia, una inmensa colección de estrellas, planetas, gases y polvo. Se encuentra a una distancia de unos 27,000 años luz del centro galáctico.', 'Espiral', 0);
INSERT INTO public.galaxy VALUES (2, 'Galaxia del Triángulo (M33)', 'Una galaxia espiral cercana a la Vía Láctea, situada a unos 3 millones de años luz de distancia.', 'Espiral', 14);
INSERT INTO public.galaxy VALUES (3, 'Gran Nube de Magallanes', 'Una galaxia enana irregular que orbita nuestra Vía Láctea, ubicada a unos 160,000 años luz de distancia.', 'Irregular', 1300);
INSERT INTO public.galaxy VALUES (4, 'Pequeña Nube de Magallanes', 'Otra galaxia enana que también es una satélite de la Vía Láctea, a unos 200,000 años luz de distancia.', 'Irregular', 2500);
INSERT INTO public.galaxy VALUES (5, 'Galaxia del Remolino (M51)', 'Una galaxia espiral famosa por su diseño en espiral. Se encuentra a unos 23 millones de años luz de distancia.', 'Espiral', 15000);
INSERT INTO public.galaxy VALUES (6, 'Galaxia del Cigarro (M82)', 'Una galaxia irregular y brillante que está experimentando una intensa actividad de formación estelar. Se encuentra a unos 12 millones de años luz de distancia.', 'Irregular', 15000);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Luna', 4500, 3, 'La única luna de la Tierra, es un mundo rocoso que ha influido en la geología y la evolución de nuestro planeta.', false);
INSERT INTO public.moon VALUES (2, 'Io', 4600, 5, ' Io es una de las cuatro grandes lunas galileanas de Júpiter.', false);
INSERT INTO public.moon VALUES (3, 'Europa', 4600, 5, 'Europa es famosa por su superficie cubierta de hielo y la posibilidad de tener un océano líquido bajo su superficie.', false);
INSERT INTO public.moon VALUES (4, 'Ganímedes', 4600, 5, 'Ganímedes es la luna más grande del sistema solar y tiene su propio campo magnético.', false);
INSERT INTO public.moon VALUES (5, 'Calisto', 4600, 5, 'Calisto es una luna grande con una superficie llena de cráteres y un terreno variado.', false);
INSERT INTO public.moon VALUES (6, 'Mimas', 4500, 6, 'Mimas es conocida por su enorme cráter Herschel, que le da un aspecto similar a la Estrella de la Muerte en Star Wars.', false);
INSERT INTO public.moon VALUES (7, 'Encélado', 4500, 6, 'Encélado es famosa por sus géiseres de hielo que expulsan agua y vapor en el espacio.', false);
INSERT INTO public.moon VALUES (8, 'Titán', 4500, 6, 'Titán es la luna más grande de Saturno y posee una atmósfera densa.', false);
INSERT INTO public.moon VALUES (10, 'Tritón', 4500, 8, 'Tritón es una luna inusual que orbita en dirección retrógrada alrededor de Neptuno.', false);
INSERT INTO public.moon VALUES (11, 'Fobos', 4600, 4, 'Fobos es la luna más grande de Marte y orbita muy cerca de la superficie del planeta.', false);
INSERT INTO public.moon VALUES (12, 'Deimos', 4600, 4, 'Deimos es una pequeña luna marciana con una forma irregular.', false);
INSERT INTO public.moon VALUES (13, 'Miranda', 4500, 7, 'Miranda es una luna de Urano con una superficie extremadamente variada.', false);
INSERT INTO public.moon VALUES (14, 'Oberón', 4500, 7, 'Oberón es una luna de Urano con una superficie antigua y arrugada.', false);
INSERT INTO public.moon VALUES (15, 'Titania', 4500, 7, 'Titania es la luna más grande de Urano y tiene una superficie con características variadas, incluidos cráteres y cañones.', false);
INSERT INTO public.moon VALUES (16, 'Proteo', 4500, 8, 'Proteo es una de las lunas más grandes de Neptuno y tiene una forma irregular.', false);
INSERT INTO public.moon VALUES (17, 'Náyade', 4500, 8, 'Náyade es una pequeña luna interior de Neptuno.', false);
INSERT INTO public.moon VALUES (18, 'Thalassa', 4500, 8, 'Thalassa es otra pequeña luna interior de Neptuno.', false);
INSERT INTO public.moon VALUES (19, 'Despina', 4500, 8, 'Despina es una luna interior de Neptuno con una forma irregular.', false);
INSERT INTO public.moon VALUES (20, 'Galatea', 4500, 8, 'Galatea es una de las lunas más grandes de Neptuno y tiene una superficie irregular.', false);
INSERT INTO public.moon VALUES (21, 'Hyperion', 4600, 6, 'Hyperion es una luna irregular de Saturno con una forma irregular y una superficie llena de cráteres.', false);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Mercurio', false, 4600, 1, 'El planeta más cercano al Sol, un mundo rocoso.');
INSERT INTO public.planet VALUES (2, 'Venus', false, 4600, 1, 'Un planeta similar a la Tierra pero inhóspito debido a su atmósfera densa y caliente.');
INSERT INTO public.planet VALUES (3, 'Tierra', true, 4600, 1, 'Nuestro hogar, el único planeta conocido con vida.');
INSERT INTO public.planet VALUES (4, 'Marte', false, 4600, 1, 'El "planeta rojo", con características geológicas interesantes.');
INSERT INTO public.planet VALUES (5, 'Júpiter', false, 4600, 1, 'El gigante gaseoso con una gran mancha roja y muchos satélites.');
INSERT INTO public.planet VALUES (6, 'Saturno', false, 4600, 1, 'Famoso por sus anillos espectaculares y lunas.');
INSERT INTO public.planet VALUES (7, 'Urano', false, 4600, 1, 'Un gigante helado que gira de lado en su órbita.');
INSERT INTO public.planet VALUES (8, 'Neptuno', false, 4600, 1, 'Un planeta azul y ventoso con una atmósfera turbulenta.');
INSERT INTO public.planet VALUES (9, 'Arcturus b', false, 7100, 7, 'Arcturus b es un exoplaneta que orbita la estrella gigante Arcturus.');
INSERT INTO public.planet VALUES (10, 'Capella b', false, 1200, 6, 'Capella b es un exoplaneta que forma parte de un sistema binario de estrellas, Capella A y Capella B.');
INSERT INTO public.planet VALUES (11, 'Vega b', false, 455, 5, 'Vega b es un exoplaneta que orbita la estrella Vega, una estrella brillante de tipo A0V.');
INSERT INTO public.planet VALUES (12, 'Antares b', false, 12, 4, 'Antares b es un exoplaneta que orbita la estrella gigante roja Antares.');


--
-- Data for Name: planet_types; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet_types VALUES (1, 'Planeta rocoso', 'también denominados telúricos, o terrestres, son cuerpos de densidad elevada, formados principalmente por materiales rocosos y metálicos');
INSERT INTO public.planet_types VALUES (2, 'Planetas gaseosos', 'caracterizados por sus densas atmósferas, por rápido movimiento de rotación, inmensos campos magnéticos');
INSERT INTO public.planet_types VALUES (3, 'Planetas interiores', 'los que se encuentran antes del cinturón de asteroides como Mercurio, Venus, Tierra, Marte.');
INSERT INTO public.planet_types VALUES (4, 'Planetas exteriores', 'los que se encuentran después del cinturón de asteroides como Júpiter, Saturno, Urano, Neptuno, y Plutón.');


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (2, 'Betelgeuse', 10, 1, 'Betelgeuse es una estrella supergigante roja en la constelación de Orión. También se encuentra en la Vía Láctea.');
INSERT INTO public.star VALUES (3, 'Rigel', 9, 1, 'Rigel es una estrella supergigante azul en la constelación de Orión. Al igual que Betelgeuse, se encuentra en la Vía Láctea.');
INSERT INTO public.star VALUES (4, 'Antares', 12, 1, 'Antares es una estrella supergigante roja en la constelación de Escorpio. Se encuentra en la Vía Láctea.');
INSERT INTO public.star VALUES (5, 'Vega', 455, 1, 'Vega es una estrella brillante en la constelación de la Lira (Lyra) y se encuentra en la Vía Láctea.');
INSERT INTO public.star VALUES (6, 'Capella', 440, 1, 'Capella es una estrella binaria compuesta por dos estrellas gigantes amarillas de tipo espectral G. Está situada en la constelación de Auriga.');
INSERT INTO public.star VALUES (7, 'Arcturus', 7100, 1, 'Arcturus es una gigante roja de tipo espectral K0III. Es la estrella más brillante de la constelación de Bootes y una de las estrellas más brillantes en el cielo nocturno.');
INSERT INTO public.star VALUES (1, 'Sol', 4600, 1, 'Nuestra estrella, el Sol, se encuentra en la Vía Láctea, específicamente en uno de los brazos en espiral llamado el Brazo de Orión.');


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 6, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 21, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 12, true);


--
-- Name: planet_types_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_types_type_id_seq', 4, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 7, true);


--
-- Name: galaxy galaxy_galaxy_id_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_galaxy_id_key UNIQUE (galaxy_id);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: moon moon_moon_id_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_moon_id_key UNIQUE (moon_id);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: planet planet_planet_id_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_planet_id_key UNIQUE (planet_id);


--
-- Name: planet_types planet_types_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet_types
    ADD CONSTRAINT planet_types_pkey PRIMARY KEY (planet_types_id);


--
-- Name: planet_types planet_types_type_id_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet_types
    ADD CONSTRAINT planet_types_type_id_key UNIQUE (planet_types_id);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: star star_star_id_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_star_id_key UNIQUE (star_id);


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

