# import {Socket} from "phoenix"

# let socket = new Socket("/ws")
# socket.connect()
# let chan = socket.chan("topic:subtopic", {})
# chan.join().receive("ok", chan => {
#   console.log("Success!")
# })

$('form#register').on('ajax:success', ->
  window.location = '/'
).on 'ajax:error', ->
  $('.alert-danger').html 'Unable to login.'

$('form#login').on('ajax:success', ->
  window.location = '/'
).on 'ajax:error', ->
  $('.alert-danger').html 'Unable to login.'

# App = {
# }

# export default App
