var React = require("react");
var RouteHandler = require("react-router").RouteHandler;
var Register = require("../sessions/register");
var registerI18n = require("../../utils/i18n/register");


var RegisterWrapper = React.createClass({
  render: function(){
    return (
        <Register {...registerI18n}/>
    )
  }
});

module.exports = RegisterWrapper;
