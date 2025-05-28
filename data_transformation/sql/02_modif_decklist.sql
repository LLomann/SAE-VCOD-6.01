DROP TABLE IF EXISTS wrk_decklists;

ALTER TABLE wrk_decklists
ADD COLUMN booster_id VARCHAR(10),
ADD COLUMN card_number VARCHAR(10);


UPDATE wrk_decklists
SET
  booster_id = split_part(card_url, '/', 5),
  card_number = split_part(card_url, '/', 6);
