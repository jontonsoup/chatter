var React = require('react');
var Router = require('react-router');
var LoggedInRoutes = require('./config/logged_in_routes');
var LoggedOutRoutes = require('./config/logged_out_routes');
var Logout = require("./components/sessions/logout");
import "whatwg-fetch";

if (document.querySelector('#loggedout_app')) {
  Router.run(LoggedOutRoutes, function(Root){
    React.render(<Root />, document.getElementById('loggedout_app'));
  });
}

if (document.querySelector('#loggedin_app')) {
  Router.run(LoggedInRoutes, function(Root){
    React.render(<Root />, document.getElementById('loggedin_app'));
  });
}

Logout.render();
