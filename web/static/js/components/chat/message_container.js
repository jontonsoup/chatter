var React = require("react");
var Message = require("./message");
var Table =  require("react-bootstrap").Table;
var SendMessage = require("./send_message");

var MessageContainer = React.createClass({
  render: function () {
    var rows = [];
    this.props.messages.forEach(function(message) {
      rows.push(<Message key={message.id} text={message.text} author={message.user.email}/>)
    });
    return (
      <div>
      <Table striped bordered>
        <tbody>{rows}</tbody>
      </Table>
      <SendMessage {...this.props}/>
      </div>
    );
  }
});

module.exports = MessageContainer;
