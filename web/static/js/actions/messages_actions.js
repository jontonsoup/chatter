var alt = require("../alt");

class MessagesActions{
  fetchMessages(channel){
  }

  updateMessages(message) {
    this.dispatch(message);
  }

  joinChannel(channel) {
     channel.join().receive("ok", messages => {
      this.actions.updateMessages(messages);
     });

    channel.on("new_msg", payload => {
      this.actions.updateMessages({text: payload.body});
    });
    this.dispatch();
  }

  setChannel(channel) {
    this.dispatch(channel);
  }

  createMessage(data) {
    var channel = data.channel;
    channel.push("new_msg", {body: data.model.message, id: data.id});
  }
}

module.exports = alt.createActions(MessagesActions);
