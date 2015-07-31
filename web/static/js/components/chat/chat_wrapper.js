var React = require('react');
var MessageContainer = require("./message_container");
var MessageStore = require("../../stores/message_store");
var MessagesActions = require("../../actions/messages_actions");

var ChatWrapper = React.createClass({
  getInitialState() {
    return MessageStore.getState();
  },
  componentDidMount() {
    MessageStore.listen(this.onChange);
    var id = this.props.params.id;
    MessagesActions.fetchMessages(id);
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
        <MessageContainer {...this.props} messages={this.state.messages}></MessageContainer>
      </div>
    );
  }
});

module.exports = ChatWrapper;
