var Utils = require("./utils");
var request = require("superagent");

var SessionAsync  = {

  createSession: function(form) {
    request
    .post("/register")
    .send(form)
    .end(function(err, response){
     Utils.checkStatus(response);
     location.reload();
    });
  }
};

module.exports = SessionAsync;
