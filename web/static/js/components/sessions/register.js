var Formsy = require('formsy-react');
var React = require('react');
var Button = require('react-bootstrap').Button;
var FRC = require('formsy-react-components');
var Input = FRC.Input;
var ReactIntl = require("react-intl");
var IntlMixin = ReactIntl.IntlMixin;
var FormattedMessage  = ReactIntl.FormattedMessage;
var SessionAsync = require("../../utils/async/session_async");

var Register = React.createClass({
  mixins: [IntlMixin],

  getInitialState: function() {
    return { canSubmit: false };
  },
  enableButton: function () {
    this.setState({
      canSubmit: true
    });
  },
  disableButton: function () {
    this.setState({
      canSubmit: false
    });
  },
  submit: function (model) {
    SessionAsync.createSession(model);
  },
  render: function () {
    return (
      <div className="col-md-6">
        <FormattedMessage message={this.getIntlMessage("title")}/>
        <Formsy.Form onValidSubmit={this.submit} onValid={this.enableButton} onInvalid={this.disableButton}>
        <Input layout="vertical" name="email" validations="isEmail" value="" label="Email" type="email" placeholder="bob@aol.com" />
        <Input layout="vertical" name="username" value="" label="Username" type="text" placeholder="Sp@rky" />

        <Input layout="vertical" name="password" value="" label="Password" type="password" validations="minLength:8" validationError="Your password must be at least 8 characters long." placeholder="Choose a password" />
        <Button name="submit" type="submit" disabled={!this.state.canSubmit}>
          <FormattedMessage message={this.getIntlMessage("submit")}/>
        </Button>
        </Formsy.Form>
      </div>
    );
  }
});

module.exports = Register;
