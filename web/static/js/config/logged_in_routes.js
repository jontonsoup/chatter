var React = require("react");
var Chat = require("../components/chat/chat_wrapper");
var Rooms = require("../components/rooms/room_wrapper");
var Router = require("react-router");
var Route = Router.Route;

module.exports = (
  <Route name="app">
     <Route name="room" path="/" handler={Rooms}/>
     <Route name="chat" path="/room/:id" handler={Chat}/>
  </Route>
);
