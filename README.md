# Rails E-Commerce Storefront — Ruby on Rails e-commerce storefront reference implementation

Want to run your own e-commerce storefront without paying for SaaS? **Rails E-Commerce Storefront** is a free, Apache-2.0-licensed Ruby on Rails project that you can clone and self-host today. A self-contained Ruby on Rails 7 e-commerce storefront with product catalog, shopping cart, checkout, and admin product management. Every Rails E-Commerce Storefront feature — every screen, every seed record — is here. [Open Rails E-Commerce Storefront on cenius.ai](https://cenius.ai/marketplace/p/rails-e-commerce-storefront?ref=gh&utm_campaign=rails-e-commerce-storefront) to modify it without writing code.


[![License: Apache 2.0](https://img.shields.io/badge/License-Apache%202.0-blue.svg)](LICENSE) ![Stack](https://img.shields.io/badge/Stack-Ruby%20on%20Rails-3b82f6) [![Built with cenius.ai](https://img.shields.io/badge/Built%20with-cenius.ai-8b5cf6)](https://cenius.ai)

[![Open in cenius.ai](https://img.shields.io/badge/▶%20Open%20%26%20edit%20in-cenius.ai-8b5cf6?style=for-the-badge)](https://cenius.ai/marketplace/p/rails-e-commerce-storefront?ref=gh&utm_campaign=rails-e-commerce-storefront)

> **▶ [Open & edit in cenius.ai](https://cenius.ai/marketplace/p/rails-e-commerce-storefront?ref=gh&utm_campaign=rails-e-commerce-storefront)** — one click to an editable workspace: describe changes in plain English, get an instant preview, one-click deploy and host. Modifications made on the platform come with full rebrand & relicense rights.

_Local clone? See [Quick start](#quick-start) below. cenius.ai is the zero-setup path._

## Demo

![Rails E-Commerce Storefront — e-commerce storefront](.github/media/poster.png)

![Rails E-Commerce Storefront demo — e-commerce storefront built with Ruby on Rails](.github/media/hero_flagship.gif)

▶ **[See it in action](https://cenius.ai/marketplace/p/rails-e-commerce-storefront?ref=gh&utm_campaign=rails-e-commerce-storefront)** — full demo on the project page · [MP4](.github/media/demo.mp4)

## Screenshots

<img src=".github/media/shot-1.png" width="32%" alt="Rails E-Commerce Storefront e-commerce storefront screenshot 1"/> <img src=".github/media/shot-2.png" width="32%" alt="Rails E-Commerce Storefront e-commerce storefront screenshot 2"/> <img src=".github/media/shot-3.png" width="32%" alt="Rails E-Commerce Storefront e-commerce storefront screenshot 3"/>

## Quick start

```bash
./install.sh   # installs dependencies + seeds demo data
```

See [`INSTALL.md`](INSTALL.md) for full setup and usage instructions.

## Features

- Product Listing (Index Grid)
- Product Detail Page
- Add to Cart
- Shopping Cart View
- Checkout
- Admin Product Management
- Demo Data Seeding
- Admin Authentication

## Architecture

No external services required: the entire e-commerce storefront runs from this Ruby on Rails repo (1,695 files). Top-level layout: `app/`, `bin/`, `config/`, `db/`, `lib/`, `log/`, `public/`, `storage/`. Kick off `./install.sh` to pull packages and seed the database, then the app is up. Step-by-step setup guide: [`INSTALL.md`](INSTALL.md).

## Usage guide

Once the application is running, open your browser to `http://localhost:3000`.

### Storefront

#### Browse Products

- The home page displays a grid of products, organized by category.
- Click any product to view its detail page, showing name, description, price, image, and stock availability.

#### Shopping Cart

- On a product detail page, click **Add to Cart** to place the item in your session-based cart.
- Access your cart anytime via the navigation link (e.g., `/cart`). The cart page lists items, quantities, and allows removal.

#### Checkout

- From the cart, proceed to checkout at `/orders/new`. Fill in your contact and shipping details, then submit the form.
- After successful submission, you'll see an order confirmation page (`/orders/:id`) with your order summary and line items.

### Admin Panel

- Navigate to `/admin/login` to access the admin login page.
- Enter the admin credentials (see seeds or create via console).
- Once logged in, you'll be directed to the admin products list.

#### Managing Products

- **List** all products (`/admin/products`). Click a product name to edit.
- **Create** a new product by clicking "New Product" and filling the form (name, description, price, image URL, stock, category).
- **Edit** a product: update fields and save.
- **Delete** a product: click the delete button on the list.

### API / Manual Requests (optional)

If you prefer to interact programmatically, here are the key endpoints:

```bash
## List products
curl http://localhost:3000/products

## View a product (replace 1 with id)
curl http://localhost:3000/products/1

_Full guide: [`USAGE.md`](USAGE.md)_

## FAQ

### What's the quickest way to self-host Rails E-Commerce Storefront?

Pull the repo, run `./install.sh`, and you are up — the script installs packages and pre-seeds the database. [`INSTALL.md`](INSTALL.md) covers any platform-specific tweaks.

### Is there a no-code way to modify Rails E-Commerce Storefront?

[cenius.ai](https://cenius.ai/marketplace/p/rails-e-commerce-storefront?ref=gh&utm_campaign=rails-e-commerce-storefront) handles the implementation. Tell it what you want in everyday words, pick up the updated build. No coding needed.

### How do I make Rails E-Commerce Storefront my own brand?

Absolutely. [Open it on cenius.ai](https://cenius.ai/marketplace/p/rails-e-commerce-storefront?ref=gh&utm_campaign=rails-e-commerce-storefront) and remix it there — platform modifications come with full rebrand and relicense rights over your derivative, so the result is entirely yours.

### Which framework or language does Rails E-Commerce Storefront use?

Rails E-Commerce Storefront is a Ruby on Rails application — and this repository holds the complete, runnable source, not a stripped-down sample. Highlights include product Listing (Index Grid).

### Is Rails E-Commerce Storefront free for commercial use?

Confirmed free for commercial use — MIT terms let you incorporate, resell, or ship it in any product. [LICENSE](LICENSE).

## License & rebranding

Released under the [Apache License 2.0](LICENSE) (© 2026 Cenius AI) — free for personal and commercial use. The Cenius name/logo are trademarks (see NOTICE).

**Need a customized version?** [Remix this app on cenius.ai](https://cenius.ai/marketplace/p/rails-e-commerce-storefront?ref=gh&utm_campaign=rails-e-commerce-storefront) — modifications made on the platform come with **full rebrand & relicense rights** over your derivative.

## Built with cenius.ai

This entire application — code, design, seeded demo data — was generated on **[cenius.ai](https://cenius.ai)** from a plain-English description.

- 🚀 [Build your own app on cenius.ai](https://cenius.ai)
- 🎛️ [Remix Rails E-Commerce Storefront on the marketplace](https://cenius.ai/marketplace/p/rails-e-commerce-storefront?ref=gh&utm_campaign=rails-e-commerce-storefront) — open it in a workspace, prompt for changes, and ship your own version.

More open-source apps: [the Cenius-ai catalog](https://github.com/Cenius-ai) · [showcase index](https://github.com/Cenius-ai/showcase)
