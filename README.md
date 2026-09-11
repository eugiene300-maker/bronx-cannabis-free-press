# The Bronx Cannabis Free Press — local media property for BX Buddiez

A static local cannabis news magazine for the Bronx, built for SEO. Presented by **BX Buddiez**, 2935 Third Ave, Bronx, NY 10455 (https://bxbuddiez.com/).

## Preview
Open `index.html` in any browser. No server is needed.

## Design
Big-city newspaper layout (top bar, highlight cards, section tabs, section rows with titles on the left, numbered "Start here" lists, large footer) in BX blue (#4C71F8) with dark el-train steel, 4/5/6 subway green and 2/5 red accents. Type: Playfair Display (masthead), Newsreader (headlines), Literata (article text), DM Sans (navigation and labels).

## Works on any domain
- **No web address is written into the pages.** Canonical tags and schema use root-relative links (`/articles/...`), so the site works on whatever domain you upload it to. Upload it to the domain's root folder.
- **Newsroom email:** the page script builds it automatically as `newsroom@<your domain>`. Set up that mailbox, or forward it.
- **Sitemap and feeds:** these files must contain full URLs, so they can't be domain-free. After uploading, **double-click `SET-UP-SITEMAP-AND-FEEDS.bat`** and type your address. It fills in `sitemap.xml`, `robots.txt` and `feed.xml` from the templates in `_feeds/`.

## What's inside
- `articles/`: 20 articles, each 1,100–1,600 words with sources cited.
- Section pages:
  - `news.html`
  - `dispensaries.html`: all 23 licensed Bronx stores, with reviews
  - `delivery.html`
  - `cannabis-friendliness-index.html`: 44 rated spots
  - `culture.html`
  - `guides.html`
  - `the-block.html`: news and social stories, dissected
- `bx-buddiez.html`: the sponsor page, with address and phone, hours, a map, directions from 8 areas, deep links to the menu, and an FAQ.
- Trust pages:
  - about, editorial guidelines, staff and `authors/*`
  - corrections and sponsorship disclosure
  - privacy, terms and contact
  - photo credits, sitemap and 404
- `assets/brand/`: logo, share image, favicon and avatars. (The podcast was removed; `podcast.html`, `podcast.xml` and the `podcast-cover*.png` files are leftovers you can delete.)
- `_build-source/`: the Python generator, the article JSON files and the research dossier.
  - To rebuild, run `cd _build-source/build && python3 pages.py`.
  - The rebuilt site goes to `_build-source/out/`. Copy it over this folder.

## Photos
Each page looks for its photos in `assets/img/` first. If a photo isn't there, the page loads the online original instead. **Double-click `DOWNLOAD-IMAGES.bat` once** to save all 39 photos locally.

## Schema (JSON-LD, one @graph per page)
- **Publication:** NewsMediaOrganization (with publishing principles, ethics, corrections, masthead and funding info) and WebSite.
- **Sponsor:** the BX Buddiez Store/LocalBusiness entity, with address, geo, hours, OCM license and sameAs.
- **Articles:** NewsArticle or Article, Person, BreadcrumbList, FAQPage and speakable.
- **Other pages:** Review (on the BX Buddiez review), ItemList, ProfilePage, AboutPage and ContactPage.

## Before launch
1. **Upload and run the setup script.** Upload the site, run `SET-UP-SITEMAP-AND-FEEDS.bat`, then submit `sitemap.xml` in Google Search Console.
2. **The staff are placeholder personas.** Replace them with real contributors in `AUTHORS` in `data.py`, then rebuild.
3. **Newsletter.** Connect the signup form on the front page to your email provider.
4. **Paid links.** Each page has exactly one outbound link to bxbuddiez.com (two on the sponsor page and the sponsor review), with anchors and target pages varied across the site. All other sponsor mentions are plain text or link to the internal sponsor page. Google's policy says paid links should use `rel="sponsored"`, which you can turn on with `SPONSOR_REL` in `data.py`.
5. **Photo rights.** Confirm you have the rights to the 4 Google Maps photos.
