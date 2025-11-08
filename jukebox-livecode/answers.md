1.  Should yield 275 results

2.  Should yield 93 results

3.  First result should be "...And Justice For All" and last one "Ace Of Spades"

4.  Something like this

```sql
SELECT
  tracks.name,
  albums.title
FROM tracks
JOIN albums ON tracks.album_id = albums.id
WHERE UPPER(tracks.name) LIKE "%music%"
```

5. First result should show Led Zeppelin, the last one should be Pearl Jam.
