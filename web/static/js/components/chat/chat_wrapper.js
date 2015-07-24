var React = require('react');
var MessageContainer = require("./message_container");

var messages =  [
    { id: 1, author: "bob", text: "howdy dowdy" },
    { id: 2, author: "billl", text: "yeahhhh dowdy" }
];

var ChatWrapper = React.createClass({
  render: function () {
    return (
      <div className="col-md-12">
       <MessageContainer messages={messages}></MessageContainer>
      </div>
    );
  }
});

module.exports = ChatWrapper;
