# ArticleViewer

To install and run:

  * Install dependencies with `mix deps.get`
  * Install Node.js dependencies with `cd assets && npm i --no-audit`
  * Create a file `.env` in the root directory containing the `ELEVIO_KEY` and `ELEVIO_TOKEN` environment variables. These variables should contain your API key and token respectively.
  * Here's a sample:
  ```bash
  #!/bin/sh
  export ELEVIO_KEY="xxxx"
  export ELEVIO_TOKEN="xxxx"
  ```
  * Make the file executable with `chmod a+x .env`
  * Load the environment variables and start the app with `source .env && mix phx.server`
  * You can run tests with `source .env && mix test`

Now visit [`localhost:4000`](http://localhost:4000) from your browser.

To deploy a production build:
  * Set up the `.env` file as described above
  * Run `./build.sh` to build a docker image
  * Run the image with `./run.sh`
  * Visit [`localhost:4000`](http://localhost:4000) from your browser

