exports.config = {
  files: {
    stylesheets: {
      joinTo: 'css/app.css'
    }
  },
  conventions: {
    assets: /^(web\/static\/assets)/
  },
  paths: {
    // Which directories to watch
    watched: ["web/static", "test/static"],
    // Where to compile files to
    public: "priv/static"
  },

  plugins: {
  }
};
