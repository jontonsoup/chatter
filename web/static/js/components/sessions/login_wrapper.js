var React = require("react");
var RouteHandler = require("react-router").RouteHandler;
var Register = require("../sessions/login");
var logini18n = require("../../utils/i18n/login");


var LoginWrapper = React.createClass({
  render: function(){
    return (
        <Register {...logini18n}/>
    )
  }
});

module.exports = LoginWrapper;
