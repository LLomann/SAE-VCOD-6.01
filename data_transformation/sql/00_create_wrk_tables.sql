-- public.tournaments definition
DROP TABLE IF EXISTS public.wrk_tournaments;
CREATE TABLE public.wrk_tournaments (
  tournament_id varchar NULL,
  tournament_name varchar NULL,
  tournament_date timestamp NULL,
  tournament_organizer varchar NULL,
  tournament_format varchar NULL,
  tournament_nb_players int NULL
);

--ALTER TABLE public.wrk_tournaments
--ADD CONSTRAINT primary key (tournament_id);

DROP TABLE IF EXISTS public.wrk_decklists;
CREATE TABLE public.wrk_decklists (
  tournament_id varchar NULL,
  player_key varchar NULL,
  player_id varchar NULL,
  card_type varchar NULL,
  card_name varchar NULL,
  card_url varchar NULL,
  card_count int NULL
);

--ALTER TABLE public.wrk_decklists
--ADD CONSTRAINT primary key (tournament_id, player_key);

DROP TABLE IF EXISTS public.wrk_matches;
CREATE TABLE public.wrk_matches (
  tournament_id varchar NULL,
  player_id_1 varchar NULL,
  player_1_key varchar NULL,
  matches_score_1 int NULL,
  player_id_2 varchar NULL,
  player_2_key varchar NULL,
  matches_score_2 int NULL,
  winner varchar NULL
);


-- Table boosters
DROP TABLE IF EXISTS public.wrk_boosters;
CREATE TABLE public.wrk_boosters (
  booster_id VARCHAR PRIMARY KEY,
  booster_name VARCHAR NULL,
  release_date DATE NULL,
  card_count INT NULL,
  image_url TEXT NULL
);

-- Table cards
DROP TABLE IF EXISTS public.wrk_cards;
CREATE TABLE public.wrk_cards (
  booster_id VARCHAR NOT NULL,
  card_number VARCHAR NOT NULL,
  card_name VARCHAR NULL,
  card_pokemon_type VARCHAR NULL,
  card_hp VARCHAR NULL,
  card_type VARCHAR NULL,
  card_evolution VARCHAR NULL,
  card_evolves_from VARCHAR NULL,
  card_ability VARCHAR NULL,
  card_ability_label VARCHAR NULL,
  card_attack_1 VARCHAR NULL,
  card_attack_1_label TEXT NULL,
  card_attack_2 VARCHAR NULL,
  card_attack_2_label TEXT NULL,
  card_weakness VARCHAR NULL,
  card_retreat VARCHAR NULL,
  card_rule TEXT NULL,
  card_image_url TEXT NULL
);
