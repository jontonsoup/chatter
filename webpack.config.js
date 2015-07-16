var webpack = require("webpack");

module.exports = {
  entry: "./web/static/js/app.js",
  output: {
    path: "./priv/static/js",
    filename: "bundle.js"
  },
  module: {
    loaders: [
      {

        exclude: /(node_modules|bower_components)/,
        loader: 'babel'
      },
      {
        test: /\.scss$/,
        loader: 'style!css!sass'
      },
      { test: /\.jpe?g$|\.gif$|\.png$|\.svg$|\.woff$|\.ttf$/, loader: "file" }
    ]
  },
  plugins: [
            new webpack.dependencies.LabeledModulesPlugin()
           ]
};
