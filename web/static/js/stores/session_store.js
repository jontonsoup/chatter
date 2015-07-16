var alt = require("alt");
var alt_instance = new alt();
var SessionActions = require("../actions/session_actions");

class SessionStore {
  constructor() {
    this.session = false;

    this.bindListeners({
      handleUpdateSession: SessionActions.UPDATE_SESSION
    });
  }

  handleUpdateSession(session) {
    this.session = session;
  }
}

module.exports = alt_instance.createStore(SessionStore, "SessionStore");
