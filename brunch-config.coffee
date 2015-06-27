exports.config =
  files:
    javascripts: joinTo: 'js/app.js'
    stylesheets: joinTo: 'css/app.css'
    templates: joinTo: 'js/app.js'
  paths:
    watched: [
      'web/static'
      'test/static'
    ]
    public: 'priv/static'
  plugins: coffee: ignore: [ /^(web\/static\/vendor)/ ]


# To use a separate vendor.js bundle, specify two files path
# https://github.com/brunch/brunch/blob/stable/docs/config.md#files
# joinTo: {
#  'js/app.js': /^(web\/static\/js)/,
#  'js/vendor.js': /^(web\/static\/vendor)/
# }
#
# To change the order of concatenation of files, explictly mention here
# https://github.com/brunch/brunch/tree/stable/docs#concatenation
# order: {
#   before: [
#     'web/static/vendor/js/jquery-2.1.1.js',
#     'web/static/vendor/js/bootstrap.min.js'
#   ]
# }
