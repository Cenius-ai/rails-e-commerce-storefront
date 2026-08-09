#!/usr/bin/env bash
set -euo pipefail
cd "$(dirname "$0")"

echo "=== Market Storefront — Install ==="
echo ""

echo "→ Installing Ruby dependencies..."
bundle install --quiet

echo "→ Setting up database..."
ruby bin/rails db:prepare

echo "→ Seeding demo data..."
ruby bin/rails db:seed

echo ""
echo "=== Setup complete ==="
echo "Start the server:  bundle exec rails server -b 0.0.0.0 -p 3000"
echo "Demo admin:        cenius@cenius.ai / cenius"
echo ""
