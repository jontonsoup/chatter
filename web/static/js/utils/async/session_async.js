var Utils = require("./utils");
var request = require("superagent");

var SessionAsync  = {

  createSession: function(form) {
    request
    .post("/register")
    .send(form)
    .end(function(err, response){
     Utils.checkStatus(response);
     window.location.href = "/";
     location.reload();
    });
  },

  createLoginSession: function(form) {
    request
    .post("/login")
    .send(form)
    .end(function(err, response){
     Utils.checkStatus(response);
     window.location.href = "/";
     location.reload();
    });
  },

  destroySession: function(form) {
    request
    .post("/logout")
    .end(function(err, response){
     Utils.checkStatus(response);
     window.location.href = "/";
     location.reload();
    })
  }
};

module.exports = SessionAsync;
