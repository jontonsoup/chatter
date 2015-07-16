var React = require("react");
var RouteHandler = require("react-router").RouteHandler;
var Register = require("../components/register");


var Main = React.createClass({
  render: function(){
    return (
      <div className="main-container">
        <nav className="navbar navbar-default" role="navigation">
          <div className="col-sm-2 col-sm-offset-9" style={{marginTop: 15}}>
          </div>
        </nav>
        <div className="container">
          <Register/>
          <RouteHandler />
        </div>
      </div>
    )
  }
});

module.exports = Main;
