# UI changes — v16

- Photography cards use the natural image aspect ratio (clamped to a practical range) so images are not cropped.
- Desktop keeps left/right arrows for multi-image cards.
- Mobile hides the arrows and shows a subtle “Swipe to explore photos” hint below the image until the visitor swipes or uses another control.
- Card CTA is now a real WhatsApp button: “Interested in this?” + “Discuss this shoot”.
- Mobile CTA becomes full-width and touch-friendly.
- Homepage curation remains latest published year per category, maximum 5 images.


## v17 — natural image aspect ratios
- Homepage photography cards no longer force a 16:9 image frame.
- Each active image sets the card media area's aspect ratio from its intrinsic dimensions.
- Portrait, square, and landscape photos therefore get appropriately shaped image areas.
- Images use `object-fit: contain`, so the photograph itself is never cropped or distorted.
- Desktop arrows, mobile swipe hint, dots, Discuss this shoot CTA, maximum-five homepage rule, latest-year selection, and social panels are retained.
