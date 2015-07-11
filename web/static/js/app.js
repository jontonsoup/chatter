import React from "bower_components/react/react";

var App = React.createClass({
  render:function(){
    return <h1>Hello World</h1>
  }
});

React.render(<App />, document.body);

module.exports = App
// var Router = require('react-router');
// var routes = require('./config/routes');

// Router.run(routes, function(Root){
//     React.render(<Root />, document.getElementById('app'));
// });

