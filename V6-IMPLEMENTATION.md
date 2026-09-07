# Impression Photography — V6

## Homepage
- Reworked the hero to the requested tall, cinematic, full-width presentation.
- Hero content is centered over the image with a readability overlay.
- Hero heading is `Stories that feel real.` and the existing hero slideshow/dots remain functional.
- Rebuilt the lower photography showcase as a true 3-up large-image carousel on desktop.
- The carousel advances one image at a time automatically and loops through the selected images.
- The carousel becomes 2-up on smaller tablets and 1-up on phones.
- Removed the V5 thumbnail-ticker sizing/math that caused tiny images and large empty space.

## Admin
- Strengthened light-mode text contrast across the admin interface.
- Sidebar active/hover states now use a soft light highlight instead of a black block.
- Careers action buttons use equal sizing on desktop and stack cleanly on small screens.

## Careers / Google Forms
- Removed the previous Google Apps Script/API form-generation flow.
- `Generate Google Form` now simply opens Google's Forms page in a new tab:
  https://www.googleapps.com/forms/about/
- The admin can create the form manually and paste its URL into the Google Form link field.
- Removed the obsolete worker endpoint and Apps Script generator file.

## Verification
- Full dependency installation/build could not be completed in the packaging environment because `npm install` timed out before creating `node_modules`.
- System TypeScript parsing was run. Remaining diagnostics are dependency/type-environment diagnostics already caused by missing installed packages plus pre-existing project type diagnostics; no new syntax error was observed in the V6 edits.
