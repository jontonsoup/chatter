var React = require('react');
var Chat = require('../components/chat/chat_wrapper');
var Router = require('react-router');
var Route = Router.Route;

module.exports = (
  <Route name="app">
     <Route name="chat" path="/" handler={Chat}/>
  </Route>
);
