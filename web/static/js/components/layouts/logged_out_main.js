var React = require("react");
var RouteHandler = require("react-router").RouteHandler;
var Register = require("../sessions/register");
var i18n = require("../../utils/i18n/register");


var LoggedOutMain = React.createClass({
  render: function(){
    return (
      <div className="main-container">
        <nav className="navbar navbar-default" role="navigation">
          <div className="col-sm-2 col-sm-offset-9" style={{marginTop: 15}}>
          </div>
        </nav>
        <div className="container">
          <Register {...i18n}/>
          <RouteHandler />
        </div>
      </div>
    )
  }
});

module.exports = LoggedOutMain;
