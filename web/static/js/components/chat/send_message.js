var Formsy = require("formsy-react");
var React = require("react");
var Button = require("react-bootstrap").Button;
var FRC = require("formsy-react-components");
var Input = FRC.Input;
var MessageActions = require("../../actions/messages_actions");

var SendMessage = React.createClass({
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
    MessageActions.createMessage(model);
  },
  render: function () {
    return (
      <div className="col-md-6">
        <Formsy.Form onValidSubmit={this.submit} onValid={this.enableButton} onInvalid={this.disableButton}>
        <Input layout="vertical" name="message" value="" type="text" validations="minLength:1" placeholder="Enter your message here" />
        <Input name="id" value={this.props.params.id} type="hidden"/>
        <Button name="submit" type="submit" disabled={!this.state.canSubmit}>
          Send
        </Button>
        </Formsy.Form>
      </div>
    );
  }
});

module.exports = SendMessage;
