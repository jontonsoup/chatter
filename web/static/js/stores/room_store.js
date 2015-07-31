var alt = require("../alt");
var RoomActions = require("../actions/room_actions");

class RoomStore {
  constructor() {
    this.rooms = [];

    this.bindListeners({
      handleUpdateRooms: RoomActions.UPDATE_ROOMS,
      handleFetchRooms: RoomActions.FETCH_ROOMS
    });
  }

  handleUpdateRooms(rooms) {
    this.rooms = rooms;
  }

  handleFetchRooms() {
    this.rooms = [];
  }
}

module.exports = alt.createStore(RoomStore, "RoomStore");
