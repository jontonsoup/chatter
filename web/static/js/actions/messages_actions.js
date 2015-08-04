var alt = require("../alt");

class MessagesActions{
  updateMessages(message) {
    this.dispatch(message);
  }

  fetchMessages(chan) {
     chan.join().receive("ok", messages => {
      this.actions.updateMessages(messages);
     });
    this.dispatch();
  }

  setChannel(channel) {
    this.dispatch(channel);
  }

  createMessage(data) {
    var channel = data.channel;
    channel.push("new_msg", {body: data.model.message, id: data.id});
    this.actions.updateMessages({text: data.model.message});
  }
}

module.exports = alt.createActions(MessagesActions);
