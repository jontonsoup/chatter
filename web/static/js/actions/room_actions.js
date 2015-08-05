var alt = require("../alt");
var Phoenix = require("../phoenix");
var socket = new Phoenix.Socket("/ws");
socket.connect();
var chan = socket.chan("rooms:lobby", {});


class RoomActions{
  updateRooms(rooms) {
    this.dispatch(rooms);
  }

  clear() {
    chan.leave();
    this.dispatch();
  }

  fetchRooms() {
    chan = socket.chan("rooms:lobby", {});
    chan.join().receive("ok", rooms => {
      this.actions.updateRooms(rooms);
     });
    this.dispatch();
  }
}

module.exports = alt.createActions(RoomActions);
