# Quote-MCP API Endpoints

All endpoints are rooted at  
`http://172.188.80.68/mcp1`

| HTTP | Path                                     | Description                                 |
|------|------------------------------------------|---------------------------------------------|
| POST | `/quotes/scrape-from-db`                 | Fetch new quotes from your database.        |
| POST | `/generate/structure`                    | Clean & structure raw quote text.           |
| POST | `/images/batch-author-images`            | Bulk download author images.                |
| POST | `/azure/submit-batch`                    | Send quote text to Azure for alt-text.      |
| POST | `/merge_text/merge-textual-data`         | Merge quotes with generated alt-text.       |
| POST | `/match/match-alt-text`                  | Attach each alt-text to its quote record.   |
| POST | `/resizer/generate-resized-urls`         | Generate resized image URLs.                |
| POST | `/distribute/distribute-urls`            | Update DB with new image URLs.              |
| POST | `/videometa/video-meta`                  | Fetch video metadata (duration, format).    |
| POST | `/metadata/generate-metadata`            | Build final JSON/CSV for front-end.         |
| POST | `/rotate/rotate-metadata`                | Shuffle or rotate metadata order.           |
| POST | `/reorder/reorder`                       | Final sort (e.g. newest-first).             |
