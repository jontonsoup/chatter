var Formsy = require('formsy-react');
var React = require('react');
var Button = require('react-bootstrap').Button;
var FRC = require('formsy-react-components');
var Input = FRC.Input;

var Register = React.createClass({
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
    // someDep.saveEmail(model.email);
  },
  render: function () {
    return (
      <Formsy.Form onValidSubmit={this.submit} onValid={this.enableButton} onInvalid={this.disableButton}>
      <Input layout="vertical" name="email1" validations="isEmail" value="" label="Email" type="email" placeholder="This is an email input." />
      <Button type="submit" disabled={!this.state.canSubmit}>Submit</Button>
      </Formsy.Form>
    );
  }
});

module.exports = Register;
