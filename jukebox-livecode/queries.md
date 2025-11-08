1. List all artists (only names)

```sql
SELECT name FROM artists ORDER BY name ASC;

```

2. Count the number of tracks that are shorter than 2 minutes

```sql
SELECT count(*) FROM tracks WHERE milliseconds < 2 * 60 * 1000;

```

3. List the first ten albums of the Jukebox DB, sorted alphabetically

```sql
SELECT * FROM albums ORDER BY title limit 10;

```

4. List the track and album information for the tracks which names are containing a 'death'

```sql
 -- List the track and album information for the tracks which names are containing a 'death' case insensitive
select
  tracks.name,
  albums.title
from
  tracks
  join albums on tracks.album_id = albums.id
where
  tracks.name like '%death%';
```

5. List the top 5 Rock artists with the most tracks

```sql
select
  artists.name,
  count(tracks.name) as track_counts
from
  tracks
  join genres on genre_id = genres.id
  join albums on albums.id = album_id
  join artists on artist_id = artists.id
where
  genres.name = 'Rock'
group by
  artists.name
order by
  track_counts desc
limit 5;
```
