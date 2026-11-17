#!/bin/bash
set -eu

cd "$(dirname "$0")"

echo "Building draft..."
./bin/zola build --drafts --base-url https://draft.warwickspeed.run --output-dir ./draft/public --force
cd draft
../node_modules/.bin/purgecss --config ../purgecss.config.js --preserve-paths
cd ..

echo "Building main site..."
./bin/zola build --base-url https://warwickspeed.run --output-dir ./prod/public --force
cd prod
../node_modules/.bin/purgecss --config ../purgecss.config.js --preserve-paths
cd ..
