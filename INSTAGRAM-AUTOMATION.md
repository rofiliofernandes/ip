# Instagram Automation

## Service hashtags

Each service can now have one or more Instagram hashtags, for example:

- Party Photography → `#party, #partyphotography`
- Wedding Photography → `#wedding, #weddingphotography`
- Pre-Wedding → `#prewedding`

When Instagram Sync imports the connected account's own media, the caption hashtags are matched against the active service mappings. A matching service title becomes the media category. Photos remain pending for approval.

If no configured hashtag matches, existing legacy mappings are still used for common categories; otherwise the media is categorized as `Other`.

## Instagram Reels

Instagram Reels are imported as Instagram-hosted media. The Worker stores the Reel permalink/ID and does **not** download the Reel video file. The public website renders the Reel through Instagram's embed player.

YouTube remains supported. New Vimeo entries have been removed from the Admin UI.

## Migration

Apply migration `0010_service_instagram_hashtags.sql` to the production D1 database before deploying the new Worker code.
