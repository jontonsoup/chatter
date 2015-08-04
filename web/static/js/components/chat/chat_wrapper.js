var React = require('react');
var MessageContainer = require("./message_container");
var MessageStore = require("../../stores/messages_store");
var MessagesActions = require("../../actions/messages_actions");
var Phoenix = require("../../phoenix");
var socket = new Phoenix.Socket("/ws");

var ChatWrapper = React.createClass({
  getInitialState() {
    return MessageStore.getState();
  },

  componentDidMount() {
    MessageStore.listen(this.onChange);
    var id = this.props.params.id;
    var chan = socket.chan(`rooms:${id}`, {});
    socket.connect();
    MessagesActions.setChannel(chan);
    MessagesActions.joinChannel(chan);
  },

  componentWillUnmount() {
    MessageStore.unlisten(this.onChange);
  },

  onChange(state) {
    this.setState(state);
  },

  render: function () {
    return(
      <div className="col-md-12">
        <MessageContainer {...this.props} channel={this.state.channel} messages={this.state.messages}></MessageContainer>
      </div>
    );
  }
});

module.exports = ChatWrapper;
