# Movie Database

My first off-platform PostgreSQL project from Codecademy's Full-Stack Engineer path. I set up PostgreSQL on my own Windows PC and built a small database of my favorite movies, then kept adding to it the way a real table grows over time.

There's no live site for this one. It's a set of SQL files you run against a local PostgreSQL database.

## What it does

Each part of the project is its own numbered file, so the database can be rebuilt from scratch by running them in order:

- `01_create_table.sql` creates a `films` table with a name and release year
- `02_insert_movies.sql` adds five of my favorites: The Lion King, The Passion of the Christ, The Dark Knight, Django Unchained, and 1917
- `03_browse_movies.sql` finds the movies from the year I was born and the ones that came out after
- `04_add_columns.sql` adds runtime, category, rating, and box office columns
- `05_backfill_data.sql` fills in those new columns for the movies already in the table
- `06_add_constraints.sql` adds a UNIQUE rule so the same movie name can't go in twice
- `07_test_constraints.sql` tries to break that rule on purpose (every statement in it should fail)

## How to run it

You need PostgreSQL installed. I used PostgreSQL 19 with pgAdmin 4 and psql.

Create the database:

```
psql -U postgres -c "CREATE DATABASE movies;"
```

Then run the files in order from this folder:

```
psql -U postgres -d movies -f 01_create_table.sql
psql -U postgres -d movies -f 02_insert_movies.sql
psql -U postgres -d movies -f 03_browse_movies.sql
psql -U postgres -d movies -f 04_add_columns.sql
psql -U postgres -d movies -f 05_backfill_data.sql
psql -U postgres -d movies -f 06_add_constraints.sql
psql -U postgres -d movies -f 07_test_constraints.sql
```

Run each file only once. Unlike Codecademy's editor, a local database keeps everything, so running the inserts twice would add every movie again.

To start over, drop the database and run them all again:

```
psql -U postgres -c "DROP DATABASE movies;"
```

## Example output

After the backfill, the table looks like this:

```
           name            | release_year | runtime | category  | rating | box_office
---------------------------+--------------+---------+-----------+--------+------------
 The Lion King             |         1994 |      88 | animation |    8.5 |  968750709
 The Passion of the Christ |         2004 |     127 | drama     |    7.2 |  612060372
 The Dark Knight           |         2008 |     152 | action    |      9 | 1008480203
 Django Unchained          |         2012 |     165 | western   |    8.5 |  426076540
 1917                      |         2019 |     119 | war       |    8.2 |  384580017
(5 rows)
```

And the constraint tests fail the way they should:

```
ERROR:  duplicate key value violates unique constraint "unique_name"
DETAIL:  Key (name)=(The Lion King) already exists.
ERROR:  duplicate key value violates unique constraint "unique_name"
DETAIL:  Key (name)=(The Dark Knight) already exists.
ERROR:  could not create unique index "unique_rating"
DETAIL:  Key (rating)=(8.5) is duplicated.
```

## What I learned

- Running SQL locally is different from Codecademy's editor. Codecademy starts fresh every time you run, but my own database keeps everything, so I split the project into one file per step and ran each one once.
- I already had a `films` table from testing my PostgreSQL setup, with different columns. I made a separate `movies` database for this project so the two wouldn't clash. Then in pgAdmin I filtered on `release_year` and got "column does not exist" because I'd opened the `films` table in the wrong database. The title bar showed which database I was in.
- Box office numbers can get big, so `box_office` is a BIGINT. A regular INTEGER tops out around 2.1 billion.
- A rating of 9.0 shows up as just `9` in a REAL column. Same value, just displayed without the trailing zero.
- The project suggested testing a UNIQUE rule on `release_year`, but all five of my movies came out in different years, so that rule would have worked and stuck. I tested on `rating` instead, since two of my movies are rated 8.5.
- Postgres won't let you add a constraint that your existing data already breaks.
- A UNIQUE rule blocks updates too, not just inserts. Renaming 1917 to The Dark Knight was rejected.

Built by DeVante Bush
