TRUNCATE TABLE goals RESTART IDENTITY CASCADE;
TRUNCATE TABLE matches RESTART IDENTITY CASCADE;
TRUNCATE TABLE tournaments RESTART IDENTITY CASCADE;
TRUNCATE TABLE teams RESTART IDENTITY CASCADE;

INSERT INTO teams (name, nickname, stadium, founded_year, city) VALUES
  ('C.A. Talleres', 'Los Matadores', 'Estadio Mario A. Kempes', 1913, 'Córdoba'),
  ('Instituto A.C.C.', 'La Gloria', 'Estadio Juan D. Perón', 1918, 'Córdoba');

INSERT INTO tournaments (name, season, organizer) VALUES
  ('2025 1° Semestre Apertura', 'Primera', NULL),
  ('2024 Superliga Argentina', 'Primera', NULL),
  ('2024 Copa de la Liga Profesional', 'Primera', NULL),
  ('2023 Copa de la Liga Profesional', 'Primera', NULL),
  ('2023 Superliga Argentina', 'Primera', NULL),
  ('1999/2000 Clausura', 'Primera', NULL),
  ('1999/2000 Apertura', 'Primera', NULL),
  ('1989/1990', 'Primera', NULL),
  ('1988/1989 Liguilla Libertadores', 'Primera', NULL),
  ('1988/1989', 'Primera', NULL),
  ('1987/1988', 'Primera', NULL),
  ('1986/1987', 'Primera', NULL),
  ('1985/1986', 'Primera', NULL),
  ('Nacional 1985', 'Primera', NULL),
  ('Metropolitano 1984', 'Primera', NULL),
  ('Metropolitano 1983', 'Primera', NULL),
  ('Metropolitano 1982', 'Primera', NULL),
  ('Nacional 1982', 'Primera', NULL),
  ('Metropolitano 1981', 'Primera', NULL),
  ('Nacional 1981', 'Primera', NULL),
  ('Nacional 1980', 'Primera', NULL),
  ('Nacional 1979', 'Primera', NULL),
  ('2016', 'Segunda', NULL),
  ('2013/2014', 'Segunda', NULL),
  ('2008/2009', 'Segunda', NULL),
  ('2007/2008', 'Segunda', NULL),
  ('2007 Clausura', 'Segunda', NULL),
  ('2006 Apertura', 'Segunda', NULL),
  ('1997/1998', 'Segunda', NULL),
  ('1996/1997', 'Segunda', NULL),
  ('1995/1996 Clausura', 'Segunda', NULL),
  ('1995/1996 Apertura', 'Segunda', NULL),
  ('1994 Reducido', 'Segunda', NULL),
  ('1993/1994', 'Segunda', NULL);

INSERT INTO matches (match_date, venue, stage, tournament_id, home_team_id, away_team_id, home_score, away_score)
SELECT DATE '2025-01-01', NULL, '16. Jornada', t.id, ht.id, at.id, 1, 2
FROM tournaments t, teams ht, teams at
WHERE t.name = '2025 1° Semestre Apertura' AND ht.name = 'C.A. Talleres' AND at.name = 'Instituto A.C.C.';

INSERT INTO matches (match_date, venue, stage, tournament_id, home_team_id, away_team_id, home_score, away_score)
SELECT DATE '2024-01-01', NULL, '9. Jornada', t.id, ht.id, at.id, 1, 1
FROM tournaments t, teams ht, teams at
WHERE t.name = '2024 Superliga Argentina' AND ht.name = 'C.A. Talleres' AND at.name = 'Instituto A.C.C.';

INSERT INTO matches (match_date, venue, stage, tournament_id, home_team_id, away_team_id, home_score, away_score)
SELECT DATE '2024-01-01', NULL, '4. Jornada', t.id, ht.id, at.id, 2, 2
FROM tournaments t, teams ht, teams at
WHERE t.name = '2024 Copa de la Liga Profesional' AND ht.name = 'Instituto A.C.C.' AND at.name = 'C.A. Talleres';

INSERT INTO matches (match_date, venue, stage, tournament_id, home_team_id, away_team_id, home_score, away_score)
SELECT DATE '2023-01-01', NULL, '4. Jornada', t.id, ht.id, at.id, 0, 0
FROM tournaments t, teams ht, teams at
WHERE t.name = '2023 Copa de la Liga Profesional' AND ht.name = 'C.A. Talleres' AND at.name = 'Instituto A.C.C.';

INSERT INTO matches (match_date, venue, stage, tournament_id, home_team_id, away_team_id, home_score, away_score)
SELECT DATE '2023-01-01', NULL, '9. Jornada', t.id, ht.id, at.id, 0, 3
FROM tournaments t, teams ht, teams at
WHERE t.name = '2023 Superliga Argentina' AND ht.name = 'Instituto A.C.C.' AND at.name = 'C.A. Talleres';

INSERT INTO matches (match_date, venue, stage, tournament_id, home_team_id, away_team_id, home_score, away_score)
SELECT DATE '1999-01-01', NULL, '5. Jornada', t.id, ht.id, at.id, 2, 0
FROM tournaments t, teams ht, teams at
WHERE t.name = '1999/2000 Clausura' AND ht.name = 'Instituto A.C.C.' AND at.name = 'C.A. Talleres';

INSERT INTO matches (match_date, venue, stage, tournament_id, home_team_id, away_team_id, home_score, away_score)
SELECT DATE '1999-01-01', NULL, '5. Jornada', t.id, ht.id, at.id, 2, 2
FROM tournaments t, teams ht, teams at
WHERE t.name = '1999/2000 Apertura' AND ht.name = 'C.A. Talleres' AND at.name = 'Instituto A.C.C.';

INSERT INTO matches (match_date, venue, stage, tournament_id, home_team_id, away_team_id, home_score, away_score)
SELECT DATE '1989-01-01', NULL, '38. Jornada', t.id, ht.id, at.id, 2, 0
FROM tournaments t, teams ht, teams at
WHERE t.name = '1989/1990' AND ht.name = 'C.A. Talleres' AND at.name = 'Instituto A.C.C.';

INSERT INTO matches (match_date, venue, stage, tournament_id, home_team_id, away_team_id, home_score, away_score)
SELECT DATE '1989-01-01', NULL, '19. Jornada', t.id, ht.id, at.id, 4, 2
FROM tournaments t, teams ht, teams at
WHERE t.name = '1989/1990' AND ht.name = 'Instituto A.C.C.' AND at.name = 'C.A. Talleres';

INSERT INTO matches (match_date, venue, stage, tournament_id, home_team_id, away_team_id, home_score, away_score)
SELECT DATE '1988-01-01', NULL, 'Cuartos - Ida', t.id, ht.id, at.id, 1, 3
FROM tournaments t, teams ht, teams at
WHERE t.name = '1988/1989 Liguilla Libertadores' AND ht.name = 'Instituto A.C.C.' AND at.name = 'C.A. Talleres';

INSERT INTO matches (match_date, venue, stage, tournament_id, home_team_id, away_team_id, home_score, away_score)
SELECT DATE '1988-01-01', NULL, 'Cuartos - Vuelta', t.id, ht.id, at.id, 2, 1
FROM tournaments t, teams ht, teams at
WHERE t.name = '1988/1989 Liguilla Libertadores' AND ht.name = 'C.A. Talleres' AND at.name = 'Instituto A.C.C.';

INSERT INTO matches (match_date, venue, stage, tournament_id, home_team_id, away_team_id, home_score, away_score)
SELECT DATE '1988-01-01', NULL, '30. Jornada', t.id, ht.id, at.id, 2, 1
FROM tournaments t, teams ht, teams at
WHERE t.name = '1988/1989' AND ht.name = 'C.A. Talleres' AND at.name = 'Instituto A.C.C.';

INSERT INTO matches (match_date, venue, stage, tournament_id, home_team_id, away_team_id, home_score, away_score)
SELECT DATE '1988-01-01', NULL, '11. Jornada', t.id, ht.id, at.id, 1, 1
FROM tournaments t, teams ht, teams at
WHERE t.name = '1988/1989' AND ht.name = 'Instituto A.C.C.' AND at.name = 'C.A. Talleres';

INSERT INTO matches (match_date, venue, stage, tournament_id, home_team_id, away_team_id, home_score, away_score)
SELECT DATE '1987-01-01', NULL, '32. Jornada', t.id, ht.id, at.id, 0, 4
FROM tournaments t, teams ht, teams at
WHERE t.name = '1987/1988' AND ht.name = 'C.A. Talleres' AND at.name = 'Instituto A.C.C.';

INSERT INTO matches (match_date, venue, stage, tournament_id, home_team_id, away_team_id, home_score, away_score)
SELECT DATE '1987-01-01', NULL, '13. Jornada', t.id, ht.id, at.id, 1, 3
FROM tournaments t, teams ht, teams at
WHERE t.name = '1987/1988' AND ht.name = 'Instituto A.C.C.' AND at.name = 'C.A. Talleres';

INSERT INTO matches (match_date, venue, stage, tournament_id, home_team_id, away_team_id, home_score, away_score)
SELECT DATE '1986-01-01', NULL, '23. Jornada', t.id, ht.id, at.id, 3, 2
FROM tournaments t, teams ht, teams at
WHERE t.name = '1986/1987' AND ht.name = 'C.A. Talleres' AND at.name = 'Instituto A.C.C.';

INSERT INTO matches (match_date, venue, stage, tournament_id, home_team_id, away_team_id, home_score, away_score)
SELECT DATE '1986-01-01', NULL, '4. Jornada', t.id, ht.id, at.id, 0, 0
FROM tournaments t, teams ht, teams at
WHERE t.name = '1986/1987' AND ht.name = 'C.A. Talleres' AND at.name = 'Instituto A.C.C.';

INSERT INTO matches (match_date, venue, stage, tournament_id, home_team_id, away_team_id, home_score, away_score)
SELECT DATE '1985-01-01', NULL, '23. Jornada', t.id, ht.id, at.id, 0, 0
FROM tournaments t, teams ht, teams at
WHERE t.name = '1985/1986' AND ht.name = 'Instituto A.C.C.' AND at.name = 'C.A. Talleres';

INSERT INTO matches (match_date, venue, stage, tournament_id, home_team_id, away_team_id, home_score, away_score)
SELECT DATE '1985-01-01', NULL, '4. Jornada', t.id, ht.id, at.id, 0, 0
FROM tournaments t, teams ht, teams at
WHERE t.name = '1985/1986' AND ht.name = 'C.A. Talleres' AND at.name = 'Instituto A.C.C.';

INSERT INTO matches (match_date, venue, stage, tournament_id, home_team_id, away_team_id, home_score, away_score)
SELECT DATE '1985-01-01', NULL, 'Playoffs', t.id, ht.id, at.id, 0, 4
FROM tournaments t, teams ht, teams at
WHERE t.name = 'Nacional 1985' AND ht.name = 'C.A. Talleres' AND at.name = 'Instituto A.C.C.';

INSERT INTO matches (match_date, venue, stage, tournament_id, home_team_id, away_team_id, home_score, away_score)
SELECT DATE '1984-01-01', NULL, '20. Jornada', t.id, ht.id, at.id, 2, 1
FROM tournaments t, teams ht, teams at
WHERE t.name = 'Metropolitano 1984' AND ht.name = 'C.A. Talleres' AND at.name = 'Instituto A.C.C.';

INSERT INTO matches (match_date, venue, stage, tournament_id, home_team_id, away_team_id, home_score, away_score)
SELECT DATE '1984-01-01', NULL, '1. Jornada', t.id, ht.id, at.id, 2, 1
FROM tournaments t, teams ht, teams at
WHERE t.name = 'Metropolitano 1984' AND ht.name = 'Instituto A.C.C.' AND at.name = 'C.A. Talleres';

INSERT INTO matches (match_date, venue, stage, tournament_id, home_team_id, away_team_id, home_score, away_score)
SELECT DATE '1983-01-01', NULL, '34. Jornada', t.id, ht.id, at.id, 3, 2
FROM tournaments t, teams ht, teams at
WHERE t.name = 'Metropolitano 1983' AND ht.name = 'Instituto A.C.C.' AND at.name = 'C.A. Talleres';

INSERT INTO matches (match_date, venue, stage, tournament_id, home_team_id, away_team_id, home_score, away_score)
SELECT DATE '1983-01-01', NULL, '15. Jornada', t.id, ht.id, at.id, 1, 0
FROM tournaments t, teams ht, teams at
WHERE t.name = 'Metropolitano 1983' AND ht.name = 'C.A. Talleres' AND at.name = 'Instituto A.C.C.';

INSERT INTO matches (match_date, venue, stage, tournament_id, home_team_id, away_team_id, home_score, away_score)
SELECT DATE '1982-01-01', NULL, '22. Jornada', t.id, ht.id, at.id, 2, 0
FROM tournaments t, teams ht, teams at
WHERE t.name = 'Metropolitano 1982' AND ht.name = 'Instituto A.C.C.' AND at.name = 'C.A. Talleres';

INSERT INTO matches (match_date, venue, stage, tournament_id, home_team_id, away_team_id, home_score, away_score)
SELECT DATE '1982-01-01', NULL, '3. Jornada', t.id, ht.id, at.id, 2, 2
FROM tournaments t, teams ht, teams at
WHERE t.name = 'Metropolitano 1982' AND ht.name = 'C.A. Talleres' AND at.name = 'Instituto A.C.C.';

INSERT INTO matches (match_date, venue, stage, tournament_id, home_team_id, away_team_id, home_score, away_score)
SELECT DATE '1982-01-01', NULL, 'Fase', t.id, ht.id, at.id, 0, 1
FROM tournaments t, teams ht, teams at
WHERE t.name = 'Nacional 1982' AND ht.name = 'Instituto A.C.C.' AND at.name = 'C.A. Talleres';

INSERT INTO matches (match_date, venue, stage, tournament_id, home_team_id, away_team_id, home_score, away_score)
SELECT DATE '1982-01-01', NULL, 'Fase', t.id, ht.id, at.id, 1, 1
FROM tournaments t, teams ht, teams at
WHERE t.name = 'Nacional 1982' AND ht.name = 'C.A. Talleres' AND at.name = 'Instituto A.C.C.';

INSERT INTO matches (match_date, venue, stage, tournament_id, home_team_id, away_team_id, home_score, away_score)
SELECT DATE '1981-01-01', NULL, '34. Jornada', t.id, ht.id, at.id, 2, 1
FROM tournaments t, teams ht, teams at
WHERE t.name = 'Metropolitano 1981' AND ht.name = 'C.A. Talleres' AND at.name = 'Instituto A.C.C.';

INSERT INTO matches (match_date, venue, stage, tournament_id, home_team_id, away_team_id, home_score, away_score)
SELECT DATE '1981-01-01', NULL, '17. Jornada', t.id, ht.id, at.id, 1, 0
FROM tournaments t, teams ht, teams at
WHERE t.name = 'Metropolitano 1981' AND ht.name = 'Instituto A.C.C.' AND at.name = 'C.A. Talleres';

INSERT INTO matches (match_date, venue, stage, tournament_id, home_team_id, away_team_id, home_score, away_score)
SELECT DATE '1981-01-01', NULL, 'Intergrupo Vuelta', t.id, ht.id, at.id, 1, 2
FROM tournaments t, teams ht, teams at
WHERE t.name = 'Nacional 1981' AND ht.name = 'C.A. Talleres' AND at.name = 'Instituto A.C.C.';

INSERT INTO matches (match_date, venue, stage, tournament_id, home_team_id, away_team_id, home_score, away_score)
SELECT DATE '1981-01-01', NULL, 'Intergrupo Ida', t.id, ht.id, at.id, 1, 0
FROM tournaments t, teams ht, teams at
WHERE t.name = 'Nacional 1981' AND ht.name = 'Instituto A.C.C.' AND at.name = 'C.A. Talleres';

INSERT INTO matches (match_date, venue, stage, tournament_id, home_team_id, away_team_id, home_score, away_score)
SELECT DATE '1980-01-01', NULL, 'Intergrupo Vuelta', t.id, ht.id, at.id, 1, 3
FROM tournaments t, teams ht, teams at
WHERE t.name = 'Nacional 1980' AND ht.name = 'Instituto A.C.C.' AND at.name = 'C.A. Talleres';

INSERT INTO matches (match_date, venue, stage, tournament_id, home_team_id, away_team_id, home_score, away_score)
SELECT DATE '1980-01-01', NULL, 'Intergrupo Ida', t.id, ht.id, at.id, 1, 1
FROM tournaments t, teams ht, teams at
WHERE t.name = 'Nacional 1980' AND ht.name = 'C.A. Talleres' AND at.name = 'Instituto A.C.C.';

INSERT INTO matches (match_date, venue, stage, tournament_id, home_team_id, away_team_id, home_score, away_score)
SELECT DATE '1979-01-01', NULL, 'Intergrupo Vuelta', t.id, ht.id, at.id, 4, 2
FROM tournaments t, teams ht, teams at
WHERE t.name = 'Nacional 1979' AND ht.name = 'Instituto A.C.C.' AND at.name = 'C.A. Talleres';

INSERT INTO matches (match_date, venue, stage, tournament_id, home_team_id, away_team_id, home_score, away_score)
SELECT DATE '1979-01-01', NULL, 'Intergrupo Ida', t.id, ht.id, at.id, 3, 1
FROM tournaments t, teams ht, teams at
WHERE t.name = 'Nacional 1979' AND ht.name = 'C.A. Talleres' AND at.name = 'Instituto A.C.C.';

INSERT INTO matches (match_date, venue, stage, tournament_id, home_team_id, away_team_id, home_score, away_score)
SELECT DATE '2016-01-01', NULL, '7. Jornada', t.id, ht.id, at.id, 1, 1
FROM tournaments t, teams ht, teams at
WHERE t.name = '2016' AND ht.name = 'C.A. Talleres' AND at.name = 'Instituto A.C.C.';

INSERT INTO matches (match_date, venue, stage, tournament_id, home_team_id, away_team_id, home_score, away_score)
SELECT DATE '2013-01-01', NULL, '33. Jornada', t.id, ht.id, at.id, 1, 1
FROM tournaments t, teams ht, teams at
WHERE t.name = '2013/2014' AND ht.name = 'Instituto A.C.C.' AND at.name = 'C.A. Talleres';

INSERT INTO matches (match_date, venue, stage, tournament_id, home_team_id, away_team_id, home_score, away_score)
SELECT DATE '2013-01-01', NULL, '12. Jornada', t.id, ht.id, at.id, 1, 2
FROM tournaments t, teams ht, teams at
WHERE t.name = '2013/2014' AND ht.name = 'C.A. Talleres' AND at.name = 'Instituto A.C.C.';

INSERT INTO matches (match_date, venue, stage, tournament_id, home_team_id, away_team_id, home_score, away_score)
SELECT DATE '2008-01-01', NULL, '31. Jornada', t.id, ht.id, at.id, 1, 0
FROM tournaments t, teams ht, teams at
WHERE t.name = '2008/2009' AND ht.name = 'Instituto A.C.C.' AND at.name = 'C.A. Talleres';

INSERT INTO matches (match_date, venue, stage, tournament_id, home_team_id, away_team_id, home_score, away_score)
SELECT DATE '2008-01-01', NULL, '12. Jornada', t.id, ht.id, at.id, 0, 2
FROM tournaments t, teams ht, teams at
WHERE t.name = '2008/2009' AND ht.name = 'C.A. Talleres' AND at.name = 'Instituto A.C.C.';

INSERT INTO matches (match_date, venue, stage, tournament_id, home_team_id, away_team_id, home_score, away_score)
SELECT DATE '2007-01-01', NULL, '23. Jornada', t.id, ht.id, at.id, 3, 1
FROM tournaments t, teams ht, teams at
WHERE t.name = '2007/2008' AND ht.name = 'Instituto A.C.C.' AND at.name = 'C.A. Talleres';

INSERT INTO matches (match_date, venue, stage, tournament_id, home_team_id, away_team_id, home_score, away_score)
SELECT DATE '2007-01-01', NULL, '4. Jornada', t.id, ht.id, at.id, 2, 0
FROM tournaments t, teams ht, teams at
WHERE t.name = '2007/2008' AND ht.name = 'C.A. Talleres' AND at.name = 'Instituto A.C.C.';

INSERT INTO matches (match_date, venue, stage, tournament_id, home_team_id, away_team_id, home_score, away_score)
SELECT DATE '2007-01-01', NULL, '8. Jornada', t.id, ht.id, at.id, 1, 0
FROM tournaments t, teams ht, teams at
WHERE t.name = '2007 Clausura' AND ht.name = 'Instituto A.C.C.' AND at.name = 'C.A. Talleres';

INSERT INTO matches (match_date, venue, stage, tournament_id, home_team_id, away_team_id, home_score, away_score)
SELECT DATE '2006-01-01', NULL, '8. Jornada', t.id, ht.id, at.id, 4, 2
FROM tournaments t, teams ht, teams at
WHERE t.name = '2006 Apertura' AND ht.name = 'C.A. Talleres' AND at.name = 'Instituto A.C.C.';

INSERT INTO matches (match_date, venue, stage, tournament_id, home_team_id, away_team_id, home_score, away_score)
SELECT DATE '1997-01-01', NULL, 'Zona campeonato 9. fecha', t.id, ht.id, at.id, 0, 2
FROM tournaments t, teams ht, teams at
WHERE t.name = '1997/1998' AND ht.name = 'Instituto A.C.C.' AND at.name = 'C.A. Talleres';

INSERT INTO matches (match_date, venue, stage, tournament_id, home_team_id, away_team_id, home_score, away_score)
SELECT DATE '1997-01-01', NULL, 'Zona campeonato 2. fecha', t.id, ht.id, at.id, 1, 0
FROM tournaments t, teams ht, teams at
WHERE t.name = '1997/1998' AND ht.name = 'C.A. Talleres' AND at.name = 'Instituto A.C.C.';

INSERT INTO matches (match_date, venue, stage, tournament_id, home_team_id, away_team_id, home_score, away_score)
SELECT DATE '1997-01-01', NULL, 'Zona interior 29. Jornada', t.id, ht.id, at.id, 1, 0
FROM tournaments t, teams ht, teams at
WHERE t.name = '1997/1998' AND ht.name = 'Instituto A.C.C.' AND at.name = 'C.A. Talleres';

INSERT INTO matches (match_date, venue, stage, tournament_id, home_team_id, away_team_id, home_score, away_score)
SELECT DATE '1997-01-01', NULL, 'Zona interior 14. Jornada', t.id, ht.id, at.id, 0, 0
FROM tournaments t, teams ht, teams at
WHERE t.name = '1997/1998' AND ht.name = 'C.A. Talleres' AND at.name = 'Instituto A.C.C.';

INSERT INTO matches (match_date, venue, stage, tournament_id, home_team_id, away_team_id, home_score, away_score)
SELECT DATE '1996-01-01', NULL, '15. Jornada', t.id, ht.id, at.id, 1, 2
FROM tournaments t, teams ht, teams at
WHERE t.name = '1996/1997' AND ht.name = 'Instituto A.C.C.' AND at.name = 'C.A. Talleres';

INSERT INTO matches (match_date, venue, stage, tournament_id, home_team_id, away_team_id, home_score, away_score)
SELECT DATE '1996-01-01', NULL, '7. Jornada', t.id, ht.id, at.id, 0, 1
FROM tournaments t, teams ht, teams at
WHERE t.name = '1996/1997' AND ht.name = 'C.A. Talleres' AND at.name = 'Instituto A.C.C.';

INSERT INTO matches (match_date, venue, stage, tournament_id, home_team_id, away_team_id, home_score, away_score)
SELECT DATE '1995-01-01', NULL, '5. Jornada', t.id, ht.id, at.id, 1, 1
FROM tournaments t, teams ht, teams at
WHERE t.name = '1995/1996 Clausura' AND ht.name = 'Instituto A.C.C.' AND at.name = 'C.A. Talleres';

INSERT INTO matches (match_date, venue, stage, tournament_id, home_team_id, away_team_id, home_score, away_score)
SELECT DATE '1995-01-01', NULL, '5. Jornada', t.id, ht.id, at.id, 2, 1
FROM tournaments t, teams ht, teams at
WHERE t.name = '1995/1996 Apertura' AND ht.name = 'C.A. Talleres' AND at.name = 'Instituto A.C.C.';

INSERT INTO matches (match_date, venue, stage, tournament_id, home_team_id, away_team_id, home_score, away_score)
SELECT DATE '1994-01-01', NULL, 'Vuelta', t.id, ht.id, at.id, 3, 1
FROM tournaments t, teams ht, teams at
WHERE t.name = '1994 Reducido' AND ht.name = 'C.A. Talleres' AND at.name = 'Instituto A.C.C.';

INSERT INTO matches (match_date, venue, stage, tournament_id, home_team_id, away_team_id, home_score, away_score)
SELECT DATE '1994-01-01', NULL, 'Ida', t.id, ht.id, at.id, 1, 1
FROM tournaments t, teams ht, teams at
WHERE t.name = '1994 Reducido' AND ht.name = 'Instituto A.C.C.' AND at.name = 'C.A. Talleres';

INSERT INTO matches (match_date, venue, stage, tournament_id, home_team_id, away_team_id, home_score, away_score)
SELECT DATE '1993-01-01', NULL, '39. Jornada', t.id, ht.id, at.id, 0, 1
FROM tournaments t, teams ht, teams at
WHERE t.name = '1993/1994' AND ht.name = 'C.A. Talleres' AND at.name = 'Instituto A.C.C.';

INSERT INTO matches (match_date, venue, stage, tournament_id, home_team_id, away_team_id, home_score, away_score)
SELECT DATE '1993-01-01', NULL, '18. Jornada', t.id, ht.id, at.id, 0, 2
FROM tournaments t, teams ht, teams at
WHERE t.name = '1993/1994' AND ht.name = 'Instituto A.C.C.' AND at.name = 'C.A. Talleres';
