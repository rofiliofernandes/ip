# Impression Photography — v2 Recommendations

Implemented v2 changes:

- Careers validity date uses DD/MM/YYYY in the admin UI and displays DD/MM/YYYY publicly. Expired active jobs automatically disappear from the public Careers page; admins can still hide, publish, edit, or permanently delete them.
- Careers posts keep the Google Form URL and show an `APPLY NOW` button that opens the form in a new tab. The website does not collect applications.
- Homepage Gallery distribution UI now has a 15-slot counter, remaining-slot counter, category cards, and +/- controls. Each category is constrained by the remaining available slots so the allocation cannot exceed 15.
- Homepage Gallery controls are responsive and usable on mobile.
- Manual photo upload was added to Gallery & Curation. The admin selects a category/context and image; the browser converts the image to WebP before uploading it to the configured R2 storage. The photo is added to Pending in the selected category.
- Instagram image materialization/import uses WebP conversion at higher quality (92). Reels remain hosted by Instagram.
- Hero images are loaded eagerly, rendered without CSS blur, and use higher-quality WebP imports for future Instagram materialization.
- Rolling homepage strip is now a one-direction seamless carousel. It does not reverse direction or visibly jump, and it uses `contain` so images are not cropped. Admin still controls up to 5 images, time on screen, and speed.
- Footer social row is centered and the WhatsApp social/contact option was removed from the footer; the floating WhatsApp widget remains.
- New `impression-logo.webp` is used as the public header/footer logo and `favicon.webp` is used as the favicon.

## Important Cloudflare requirement

Manual uploads and durable Instagram WebP storage require an R2 bucket bound to the Worker as `MEDIA`. The v2 code already contains the secure upload/reservation flow. If `MEDIA` is not bound, the admin UI will show a clear storage-not-enabled error instead of pretending the image was stored.

No new D1 migration is required for these v2 UI/storage changes because the existing schema already contains the required photo, storage, homepage, and careers fields.
