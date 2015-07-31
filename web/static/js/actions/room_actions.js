var alt = require("../alt");
var Phoenix = require("../phoenix");
var socket = new Phoenix.Socket("/ws");
var chan = socket.chan("rooms:lobby", {});


class RoomActions{
  updateRooms(rooms) {
    this.dispatch(rooms);
  }

  fetchRooms() {
    socket.connect();
     chan.join().receive("ok", rooms => {
      this.actions.updateRooms(rooms);
     });
    this.dispatch();
  }
}

module.exports = alt.createActions(RoomActions);
