var alt = require("../alt");
var MessageActions = require("../actions/messages_actions");

class MessagesStore {
  constructor() {
    this.messages = [];

    this.bindListeners({
      handleUpdateMessages: MessageActions.UPDATE_MESSAGES,
      handleFetchMessages: MessageActions.FETCH_MESSAGES
    });
  }

  handleUpdateMessages(messages) {
    this.messages = messages;
  }

  handleFetchMessages() {
    this.messages = [];
  }
}

module.exports = alt.createStore(MessagesStore, "MessagesStore");
