# Impression Photography v14 testing notes

## Homepage photo rule
- Each homepage category uses the newest year that has published photos for that category.
- At most 5 photos are used per category.
- If there are no published photos for that category, the existing design fallback is shown.
- The public gallery is category based; year filters and year metadata are removed.
- Homepage and project images use `object-fit: contain` so source photos are not cropped. Portrait/landscape mismatches may show letterboxing instead of cutting the image.

## Social content
- Demo/fake Instagram and YouTube cards have been removed.
- The homepage social panels only show records actually synced into D1.
- `View on Instagram` and `View on YouTube` remain visible on mobile.
- Every synced YouTube video is kept in the database and can be selected/played from the carousel. The sync endpoint now paginates through up to 20 pages (up to 1,000 uploads per sync), rather than only importing the first 12.
- Instagram Reels stay hosted by Instagram and are embedded.

## Instagram photos
- Sync imports direct image posts as pending photos when R2 is connected.
- Their year is derived from Instagram's `timestamp`.
- Category is suggested from hashtags in the caption (`#prewedding`, `#birthday`, `#family`, `#maternity`, `#portfolio`, `#wedding`, `#beach`).
- Imported photos remain unpublished until an admin approves them.
- Instagram sync follows pagination (up to 20 pages / 1,000 media items per sync).

## Instagram API setup
The API integration expects these Worker secrets:
- `INSTAGRAM_USER_ID`
- `INSTAGRAM_ACCESS_TOKEN`
- optional `INSTAGRAM_GRAPH_VERSION` (defaults to `v24.0` in this project)

The Instagram account must be a Professional account (Business or Creator). The current Meta Instagram Login path uses the `instagram_business_basic` permission for basic account/media access. See Meta's Instagram API documentation/Postman collection.

## YouTube API setup
Worker secret:
- `YOUTUBE_API_KEY`

Worker variable:
- `YOUTUBE_CHANNEL_HANDLE=@impressionphotography9904`

After setting the key, use Admin -> Videos -> Sync YouTube channel. The backend finds the channel's uploads playlist and paginates through its public uploads.
