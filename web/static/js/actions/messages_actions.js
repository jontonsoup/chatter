var alt = require("../alt");
var Phoenix = require("../phoenix");
var socket = new Phoenix.Socket("/ws");

class MessagesActions{
  createMessages(id, message) {
    this.actions.fetchMessages(id);
  }

  updateMessages(messages) {
    this.dispatch(messages);
  }

  fetchMessages(id) {
    var chan = socket.chan(`rooms:${id}`, {});
    this.chan = chan;
    socket.connect();
     chan.join().receive("ok", messages => {
      this.actions.updateMessages(messages);
     });
    this.dispatch();
  }
}

module.exports = alt.createActions(MessagesActions);
