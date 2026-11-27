# Tummy Log

A food and stomach-symptom diary that spots which foods tend to come before symptoms.

## Use it

Open the app in any browser, on a phone or a computer. On a phone, use your browser's "Add to Home Screen" option to keep it one tap away.

- **Log**
  - **Meals**: list each food or ingredient, pick a saved recipe, or scan a barcode on packaged food.
  - **Daily symptom check**: a tick list for each day covering bloating, stomach pain, cramps, nausea, wind, heartburn, croakiness (with an "I burped" option), eye twitch and other. Ticking a symptom opens a 1 to 5 severity rating, when it started and how long it lasted, or "All day". Saving with nothing ticked records a symptom-free day.
  - **Day context**: stress level, period, hours of sleep, exercise and any other illness.
- **Diary**: everything logged, grouped by day, with edit and delete.
- **Poop**: log each poop with its consistency on the Bristol stool scale (1 to 7). A month calendar shows how many times you went each day, coloured hard, normal or loose. Tap a day to see its entries.
- **Recipes**: save recipes you make often. Each ingredient has a quantity (whole numbers, decimals or fractions like 1/2) and a unit such as g, ml, tsp, cloves or tins. Log one as a meal in one tap. If you change it that day (add, remove or change the amount of an ingredient), the change is saved as a dated variation under the main recipe, ready to reuse.
- **Patterns**: for each food, how often a symptom followed within a chosen time window (2 to 12 hours by default), compared with the usual rate across all meals. Hard poops (types 1 to 2) and loose poops (types 6 to 7) count as symptoms. A second table compares symptom days with and without each context factor. Tap "See an example" to try it with made-up data.

## Barcode scanning

Tap **Scan a barcode** on the meal form. It uses the phone's camera, or you can take a photo of the barcode or type the number. The product's name and ingredients come from [Open Food Facts](https://world.openfoodfacts.org), a free public food database, and you pick which ones to add. Scanning needs the site to be served over HTTPS (Vercel and GitHub Pages both do this) and an internet connection. Some products aren't in the database; those have to be typed in by hand.

## Where the data is kept

The whole app is one file, `index.html`, with no server and no sign-up.

- Opened from a normal web address (for example Vercel), entries are saved in that browser on that device only. Clearing browser data deletes them, and they don't sync between a phone and a computer.
- Opened as a Claude artifact, entries are saved to the viewer's Claude account and sync across their devices. Each person only sees their own entries. Barcode scanning doesn't work inside Claude.

## Hosting

**Vercel:** at vercel.com/new, import this repository, leave Framework Preset as "Other" with no build settings, and deploy. Every push to `main` updates the site.

**GitHub Pages** (public repositories on free accounts): Settings → Pages, deploy from branch `main`, folder `/ (root)`.

## How the patterns work

For every time a food was eaten, the app checks whether a symptom was logged inside the time window. That gives the food's symptom rate, which is compared with the usual rate across all meals. Small samples are pulled toward the usual rate, so a food eaten only once or twice can't top the list. A food needs at least 5 meals, 3 of them followed by symptoms, a rate of 50% or more, and 1.3 times the usual rate to be marked "Strong".

These patterns are clues, not a diagnosis. Ongoing or severe symptoms should be checked by a doctor.
