var alt = require("../alt");
var Phoenix = require("../phoenix");
var socket = new Phoenix.Socket("/ws");


class RoomActions{
  updateRooms(rooms) {
    this.dispatch(rooms);
  }

  fetchRooms() {
    socket.connect();
    var chan = socket.chan("rooms:lobby", {});
     chan.join().receive("ok", rooms => {
      this.actions.updateRooms(rooms);
     });
    this.dispatch();
  }

  locationsFailed(errorMessage) {
    this.dispatch(errorMessage);
  }
}

module.exports = alt.createActions(RoomActions);
