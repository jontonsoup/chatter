var React = require("react");

var Message = React.createClass({
  render: function () {
    return (
    <tr>
      <td>{this.props.text}</td>
    </tr>
    );
  }
});

module.exports = Message;
