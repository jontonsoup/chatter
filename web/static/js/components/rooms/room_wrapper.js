var React = require("react");
var RoomStore = require("../../stores/room_store");
var RoomActions = require("../../actions/room_actions");

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
        {this.state.rooms}
      </div>
    );
  }
});

module.exports = RoomWrapper;
