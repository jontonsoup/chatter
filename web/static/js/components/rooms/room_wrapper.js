var React = require("react");
var RoomStore = require("../../stores/room_store");
var RoomActions = require("../../actions/room_actions");
var Link = require("react-router").Link;

var RoomWrapper = React.createClass({
  getInitialState() {
    return RoomStore.getState();
  },
  componentDidMount() {
    RoomStore.listen(this.onChange);
    RoomActions.fetchRooms();
  },

  componentWillUnmount() {
    RoomStore.unlisten(this.onChange);
  },

  onChange(state) {
    this.setState(state);
  },

  render: function () {
    return (
      <div className="col-md-12">
      <ul>
      {this.state.rooms.map((room) => {
        return (
          <Link key={room.id} to="chat" params={{id: room.id}}>
            <li>{room.topic}</li>
          </Link>
        );
      })}
      </ul>
      </div>
    );
  }
});

module.exports = RoomWrapper;
