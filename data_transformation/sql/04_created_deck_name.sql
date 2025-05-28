DROP TABLE IF EXISTS wrk_decks_summary;

CREATE TABLE wrk_decks_summary AS
SELECT 
  wd.tournament_id,
  wd.player_id,

  -- Concaténation des noms de cartes, en les répétant selon leur count
  STRING_AGG(REPEAT(wc.card_name || ' - ', wd.card_count), '' ORDER BY wc.card_name) AS deck_name,

  -- Type d'énergie dominant
  (
    SELECT wc1.card_pokemon_type
    FROM wrk_decklists wd1
    JOIN wrk_cards wc1 ON wc1.booster_id = wd1.booster_id AND wc1.card_number = wd1.card_number
    WHERE wd1.tournament_id = wd.tournament_id AND wd1.player_id = wd.player_id
      AND wc1.card_type = 'Pokémon' AND wc1.card_evolution = 'Basic'
    GROUP BY wc1.card_pokemon_type
    ORDER BY SUM(wd1.card_count) DESC, wc1.card_pokemon_type
    LIMIT 1
  ) AS deck_energy,

  -- Faiblesse dominante
  (
    SELECT wc2.card_weakness
    FROM wrk_decklists wd2
    JOIN wrk_cards wc2 ON wc2.booster_id = wd2.booster_id AND wc2.card_number = wd2.card_number
    WHERE wd2.tournament_id = wd.tournament_id AND wd2.player_id = wd.player_id
      AND wc2.card_type = 'Pokémon' AND wc2.card_evolution = 'Basic'
      AND wc2.card_weakness IS NOT NULL
    GROUP BY wc2.card_weakness
    ORDER BY SUM(wd2.card_count) DESC, wc2.card_weakness
    LIMIT 1
  ) AS deck_weakness

FROM wrk_decklists wd
JOIN wrk_cards wc ON wc.booster_id = wd.booster_id AND wc.card_number = wd.card_number

-- On garde que les cartes Pokémon de base pour la composition du nom
WHERE wc.card_type = 'Pokémon' AND wc.card_evolution = 'Basic'

GROUP BY wd.tournament_id, wd.player_id
ORDER BY wd.tournament_id, wd.player_id;

