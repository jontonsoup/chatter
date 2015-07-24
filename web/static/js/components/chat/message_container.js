var React = require("react");
var Message = require("./message");
var Table =  require("react-bootstrap").Table;

var MessageContainer = React.createClass({
  render: function () {
    var rows = [];
    this.props.messages.forEach(function(message) {
      rows.push(<Message key={message.id} text={message.text} author={message.author}/>)
    });
    return (
      <Table striped bordered>
        <tbody>{rows}</tbody>
      </Table>
    );
  }
});

module.exports = MessageContainer;
