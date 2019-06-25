#!/bin/bash
mix deps.get
cd assets && npm i --no-audit && npm run build && cd ..
mix phx.digest
docker build -t article_viewer .

