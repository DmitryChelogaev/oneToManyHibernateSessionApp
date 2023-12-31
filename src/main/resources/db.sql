CREATE DATABASE "director-movie"
    WITH
    OWNER = postgres
    ENCODING = 'UTF8'
    LC_COLLATE = 'Russian_Russia.1251'
    LC_CTYPE = 'Russian_Russia.1251'
    TABLESPACE = pg_default
    CONNECTION LIMIT = -1
    IS_TEMPLATE = False;

COMMENT ON DATABASE "director-movie"
    IS 'OneToMany';

CREATE TABLE IF NOT EXISTS public.director
(
    id integer NOT NULL GENERATED BY DEFAULT AS IDENTITY,
    name character varying(100) COLLATE pg_catalog."default" NOT NULL,
    age integer,
    CONSTRAINT director_pkey PRIMARY KEY (id),
    CONSTRAINT director_name_key UNIQUE (name),
    CONSTRAINT director_age_check CHECK (age > 10)
);

CREATE TABLE IF NOT EXISTS public.movie
(
    movie_id integer NOT NULL GENERATED BY DEFAULT AS IDENTITY ( INCREMENT 1 START 1 MINVALUE 1 MAXVALUE 2147483647 CACHE 1 ),
    director_id integer NOT NULL,
    name character varying(200) COLLATE pg_catalog."default" NOT NULL,
    year_of_production integer,
    CONSTRAINT movie_pkey PRIMARY KEY (movie_id),
    CONSTRAINT movie_director_id_fkey FOREIGN KEY (director_id)
        REFERENCES public.director (id) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION,
    CONSTRAINT movie_year_of_production_check CHECK (year_of_production > 1900)
);


-- ----------------------------
-- Records of director
-- ----------------------------
BEGIN;
INSERT INTO "director" ("id", "name", "age") VALUES (1, 'Quentin Tarantino', 57);
INSERT INTO "director" ("id", "name", "age") VALUES (2, 'Martin Scorsese', 78);
INSERT INTO "director" ("id", "name", "age") VALUES (3, 'Guy Ritchie', 52);
INSERT INTO "director" ("id", "name", "age") VALUES (4, 'Woody Allen', 85);
INSERT INTO "director" ("id", "name", "age") VALUES (5, 'David Lynch', 74);
INSERT INTO "director" ("id", "name", "age") VALUES (6, 'Christopher Nolan', 50);
COMMIT;

-- ----------------------------
-- Records of movie
-- ----------------------------
BEGIN;
INSERT INTO "movie" ("movie_id", "director_id", "name", "year_of_production") VALUES (1, 1, 'Reservoir Dogs', 1992);
INSERT INTO "movie" ("movie_id", "director_id", "name", "year_of_production") VALUES (2, 1, 'Pulp Fiction', 1994);
INSERT INTO "movie" ("movie_id", "director_id", "name", "year_of_production") VALUES (4, 1, 'Once Upon a Time in Hollywood', 2019);
INSERT INTO "movie" ("movie_id", "director_id", "name", "year_of_production") VALUES (8, 3, 'Lock, Stock and Two Smoking Barrels', 1998);
INSERT INTO "movie" ("movie_id", "director_id", "name", "year_of_production") VALUES (9, 3, 'Snatch', 2000);
INSERT INTO "movie" ("movie_id", "director_id", "name", "year_of_production") VALUES (10, 4, 'Midnight in Paris', 2011);
INSERT INTO "movie" ("movie_id", "director_id", "name", "year_of_production") VALUES (11, 6, 'Inception', 2010);
INSERT INTO "movie" ("movie_id", "director_id", "name", "year_of_production") VALUES (3, 2, 'The Hateful Eight', 2015);
COMMIT;
