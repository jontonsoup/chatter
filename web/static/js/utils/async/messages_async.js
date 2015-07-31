var Phoenix = require("../../phoenix");
var socket = new Phoenix.Socket("/ws");
var MessagesActions = require("../../actions/messages_actions");

class MessagesAsync{
  constructor(id){
   this.id = id;
    var chan = socket.chan(`rooms:${id}`, {});
    this.chan = chan;
    socket.connect();
  }
  createMessage(message) {
  }

  fetchMessages(){
    this.chan.join().receive("ok", messages => {
      MessagesActions.updateMessages(messages);
    });
  }
}

module.exports = MessagesAsync;
