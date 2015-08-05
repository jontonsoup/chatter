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
    var id = this.props.params.id;
    var data = {channel: this.props.channel, model: model, id: id};
    MessageActions.createMessage(data);
    this.refs.form.reset();
  },
  render: function () {
    return (
      <div className="col-md-12">
        <Formsy.Form ref="form" onValidSubmit={this.submit} onValid={this.enableButton} onInvalid={this.disableButton}>
        <Input layout="vertical" name="message" value="" type="text" validations="minLength:1" placeholder="Enter your message here" autoComplete="off"/>
        <Button name="submit" type="submit" disabled={!this.state.canSubmit} className="pull-right">
          Send
        </Button>
        </Formsy.Form>
      </div>
    );
  }
});

module.exports = SendMessage;
