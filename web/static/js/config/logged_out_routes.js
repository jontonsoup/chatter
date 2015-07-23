var React = require('react');
var Main = require('../components/layouts/logged_out_main');
var Register = require('../components/sessions/register_wrapper');
var Router = require('react-router');
var DefaultRoute = Router.DefaultRoute;
var History = Router.HistoryLocation;
var Route = Router.Route;

module.exports = (
  <Route name="app">
     <Route name="main" path="/" handler={Main}/>
     <Route name="register" path="/register" handler={Register}/>
   </Route>
);
