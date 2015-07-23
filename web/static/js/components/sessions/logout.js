var Formsy = require('formsy-react');
var React = require('react');
var Button = require('react-bootstrap').Button;
var SessionAsync = require("../../utils/async/session_async");

var Logout = React.createClass({
  submit: function (model) {
    SessionAsync.destroySession(model);
  },
  render: function () {
    return (
      <Formsy.Form onValidSubmit={this.submit} onValid={true} onInvalid={true}>
        <Button name="submit" type="submit" bsStyle="primary">
          Log Out
        </Button>
      </Formsy.Form>
    );
  }
});

var LogoutRender = {
  render: function(){
    if (document.querySelector('#logout')) {
      React.render(<Logout />, document.getElementById('logout'));
    }
  }
};

module.exports = LogoutRender;
