INSERT INTO teams (id, name, nickname, stadium, founded_year, city) VALUES
  (1, 'Club Atlético Norte', 'Los Halcones', 'Estadio Central Norte', 1908, 'Ciudad Esperanza'),
  (2, 'Deportivo Sur Unido', 'Los Guerreros', 'Fortaleza del Sur', 1912, 'Ciudad Esperanza'),
  (3, 'Instituto del Este', 'Los Académicos', 'Coliseo del Este', 1920, 'Ciudad Esperanza'),
  (4, 'Atlético Oeste', 'Los Acereros', 'Parque Oeste', 1915, 'Ciudad Esperanza')
ON CONFLICT DO NOTHING;

INSERT INTO tournaments (id, name, season, organizer) VALUES
  (1, 'Liga Esperanza', '2024', 'Asociación Local'),
  (2, 'Copa Ciudad', '2024', 'Municipalidad')
ON CONFLICT DO NOTHING;

INSERT INTO matches (id, match_date, venue, stage, tournament_id, home_team_id, away_team_id, home_score, away_score, attendance) VALUES
  (1, '2024-03-15', 'Estadio Central Norte', 'Liga', 1, 1, 2, 2, 1, 35000),
  (2, '2024-04-20', 'Fortaleza del Sur', 'Liga', 1, 2, 3, 1, 1, 33000),
  (3, '2024-05-05', 'Coliseo del Este', 'Liga', 1, 3, 4, 0, 2, 28000),
  (4, '2024-06-01', 'Parque Oeste', 'Copa', 2, 4, 1, 3, 2, 31000)
ON CONFLICT DO NOTHING;

INSERT INTO goals (match_id, team_id, scorer, minute, type) VALUES
  (1, 1, 'Facundo Rivas', 18, 'jugada'),
  (1, 2, 'Emanuel Díaz', 55, 'penal'),
  (1, 1, 'Sebastián Gómez', 72, 'jugada'),
  (2, 2, 'Carlos Benítez', 10, 'jugada'),
  (2, 3, 'Lucio Ferreyra', 67, 'tiro libre'),
  (3, 4, 'Nahuel Maidana', 25, 'jugada'),
  (3, 4, 'Leandro Gaitán', 70, 'contragolpe'),
  (4, 4, 'Matías Lemos', 5, 'jugada'),
  (4, 1, 'Tomás Varela', 48, 'jugada'),
  (4, 4, 'Matías Lemos', 63, 'jugada'),
  (4, 1, 'Tomás Varela', 78, 'tiro libre'),
  (4, 4, 'Bruno Carrizo', 89, 'jugada')
ON CONFLICT DO NOTHING;
