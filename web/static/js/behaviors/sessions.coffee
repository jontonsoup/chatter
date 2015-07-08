$("#register").on("ajax:success", ->
  location.assign(location.host)
).on "ajax:error", ->
  $(".alert-danger").html "Unable to login."

$("#login").on("ajax:success", ->
  location.assign(location.host)
).on "ajax:error", ->
  $(".alert-danger").html "Unable to login."

$("#logout").on("ajax:success", ->
  location.assign(location.host)
).on "ajax:error", ->
  $(".alert-danger").html "Unable to logout"
