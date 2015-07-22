var React = require("react");
var SessionStore = require("../stores/session_store");
var Button = require("react-bootstrap").Button;

var session = React.createClass({
  getInitialState() {
    return SessionStore.getState();
  },

  componentDidMount() {
    SessionStore.listen(this.onChange);
  },

  componentWillUnmount() {
    SessionStore.unlisten(this.onChange);
  },

  onChange(state) {
    this.setState(state);
  },

  render() {
    return (
      <Button style={{marginBottom: 15}}>Logout</Button>
    );
  }
});

module.exports = session;


