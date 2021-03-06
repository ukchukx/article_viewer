const mix = require('laravel-mix');
const path = require('path');
const MomentLocalesPlugin = require('moment-locales-webpack-plugin');
require('laravel-mix-eslint');

mix.setPublicPath('../priv/static')
  .js('js/app.js', 'js/app.js')
  .eslint()
  .extract(Object.keys(require('./package.json').dependencies))
  .sass('css/app.scss', 'css/app.css')
  .version()
  .copyDirectory('./static', '../priv/static')
  .webpackConfig({
    resolve: {
      extensions: ['.vue', '.js'],
      alias: {
        '@': path.resolve(__dirname, 'js')
      }
    },
    plugins: [
      // strip all locales except “en”
      new MomentLocalesPlugin()
    ]
  })
  .options({
    clearConsole: false,
    processCssUrls: false
  });
