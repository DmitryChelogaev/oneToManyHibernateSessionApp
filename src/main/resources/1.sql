/*
 Navicat Premium Data Transfer

 Source Server         : localhost
 Source Server Type    : PostgreSQL
 Source Server Version : 110018
 Source Host           : localhost:5432
 Source Catalog        : director-movie
 Source Schema         : public

 Target Server Type    : PostgreSQL
 Target Server Version : 110018
 File Encoding         : 65001

 Date: 15/11/2023 11:51:04
*/


-- ----------------------------
-- Table structure for director
-- ----------------------------
DROP TABLE IF EXISTS "director";
CREATE TABLE "director" (
  "id" int4 NOT NULL GENERATED BY DEFAULT AS IDENTITY (
INCREMENT 1
MINVALUE  1
MAXVALUE 2147483647
START 1
CACHE 1
),
  "name" varchar(100) COLLATE "pg_catalog"."default" NOT NULL,
  "age" int4
)
;

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
-- Table structure for movie
-- ----------------------------
DROP TABLE IF EXISTS "movie";
CREATE TABLE "movie" (
  "movie_id" int4 NOT NULL GENERATED BY DEFAULT AS IDENTITY (
INCREMENT 1
MINVALUE  1
MAXVALUE 2147483647
START 1
CACHE 1
),
  "director_id" int4 NOT NULL,
  "name" varchar(200) COLLATE "pg_catalog"."default" NOT NULL,
  "year_of_production" int4
)
;

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

-- ----------------------------
-- Auto increment value for director
-- ----------------------------
SELECT setval('"director_director_id_seq"', 29, true);

-- ----------------------------
-- Uniques structure for table director
-- ----------------------------
ALTER TABLE "director" ADD CONSTRAINT "director_name_key" UNIQUE ("name");

-- ----------------------------
-- Checks structure for table director
-- ----------------------------
ALTER TABLE "director" ADD CONSTRAINT "director_age_check" CHECK ((age > 10));

-- ----------------------------
-- Primary Key structure for table director
-- ----------------------------
ALTER TABLE "director" ADD CONSTRAINT "director_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Auto increment value for movie
-- ----------------------------
SELECT setval('"movie_movie_id_seq"', 37, true);

-- ----------------------------
-- Checks structure for table movie
-- ----------------------------
ALTER TABLE "movie" ADD CONSTRAINT "movie_year_of_production_check" CHECK ((year_of_production > 1900));

-- ----------------------------
-- Primary Key structure for table movie
-- ----------------------------
ALTER TABLE "movie" ADD CONSTRAINT "movie_pkey" PRIMARY KEY ("movie_id");

-- ----------------------------
-- Foreign Keys structure for table movie
-- ----------------------------
ALTER TABLE "movie" ADD CONSTRAINT "movie_director_id_fkey" FOREIGN KEY ("director_id") REFERENCES "director" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION;
