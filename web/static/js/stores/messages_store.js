var alt = require("../alt");
var MessageActions = require("../actions/messages_actions");

class MessagesStore {
  constructor() {
    this.messages = [];
    this.channel = null;

    this.bindListeners({
       handleUpdateMessages: MessageActions.UPDATE_MESSAGES,
       handleFetchMessages: MessageActions.FETCH_MESSAGES,
       handleSetChannel: MessageActions.SET_CHANNEL,
       handleClear: MessageActions.CLEAR
    });
  }

  handleUpdateMessages(message) {
     this.messages = this.messages.concat(message);
  }

  handleSetChannel(channel) {
    this.channel = channel;
  }

  handleFetchMessages() {
    this.messages = [];
  }

  handleClear(){
    this.messages = [];
    this.channel = null;
  }
}

module.exports = alt.createStore(MessagesStore, "MessagesStore");
