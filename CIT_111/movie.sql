USE movie;

DELETE FROM actor;

DELETE FROM actor
WHERE given_name = 'tim';

ALTER TABLE actor auto_increment = 1;
ALTER TABLE movie auto_increment = 1;

INSERT INTO actor
(given_name, family_name)
VALUES
('Tim', 'Allen'),
('Tom', 'Hanks'),
('Annie', 'Potts'),
('John', 'Ratzenberger');

INSERT INTO movie
(title, year_release, rating, studio)
VALUE
('Toy Story', 'G',  '1995', 'Pixar'),
('Toy Story 2', 'G',  '1999', 'Pixar')


INSERT INTO movie_cast
(moive.id, actor_id)
values
(1, 1),
(2, 1)
(2, 3)