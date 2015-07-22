var React = require('react');
var Main = require('../components/layouts/logged_out_main');
var Home = require('../components/home');
var Router = require('react-router');
var DefaultRoute = Router.DefaultRoute;
var Route = Router.Route;

module.exports = (
  <Route name="app" path="/" handler={Main}>
  </Route>
);
