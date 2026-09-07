# V3 Improvements

Implemented on top of the V2 project.

## UI / media
- Fixed the homepage rolling image strip: slightly taller, compact, 3-up desktop layout, no image cropping, smooth single-direction horizontal movement.
- Removed any hero blur filter and kept the text overlay separate from the photograph.
- Added working light/dark theme styling and persisted the selected theme.
- Theme switch now visually reflects its state.
- Dark theme makes the Impression Photography logo white while light theme keeps the original logo.

## Admin validation / errors
- Replaced native browser `alert()` feedback with an in-app admin notice.
- Added inline gallery allocation validation based on the number of approved/published photos actually available in each category.
- Generate Preview is disabled when an allocation cannot be fulfilled.
- Gallery publish errors are displayed in the admin UI.
- Careers save errors are displayed in the admin UI.
- Added V3 runtime schema safety for `site_settings` and `careers`, plus a formal migration.
- Public data also initializes the V3 schema if a deployment was made before D1 migrations were applied, preventing the homepage/Careers 500 caused by missing V2 tables.

## Testing note
The source syntax was checked with the system TypeScript compiler. Full `npm run build` could not be run in this environment because the ZIP does not contain `node_modules`.

After extracting:
1. `npm install`
2. `npm run build`
3. For local testing, `npm run dev`
4. For production, commit/push the project and let the connected Cloudflare Worker deploy, or use `npm run deploy`.
5. If using a separate D1 deployment workflow, `npm run db:migrate` can be run before deploy; the V3 runtime safety is also present.
