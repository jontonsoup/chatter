var alt = require('alt');
var alt_instance = new alt();

class SessionActions {
  updateSession(session) {
    this.dispatch(session);
  }
}

module.exports = alt_instance.createActions(SessionActions);
