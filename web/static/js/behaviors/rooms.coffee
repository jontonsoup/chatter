Phoenix = require("phoenix")

chatInput         = $("#chat-input")
messagesContainer = $("#messages")
room = $("#room").data("room_id")
id = $("#user_id").data("user_id")
token = Cookies.get("remember_token")

socket = new Phoenix.Socket("/ws", {params: {user_id: id, room_id: room}})
socket.connect()
chan = socket.chan("rooms:#{room}", {})

chatInput.on("keypress", (event) ->
  if(event.keyCode == 13)
    chan.push("new_msg", {body: chatInput.val(), user_id: id, room_id: room})
    chatInput.val("")
)

chan.on("new_msg", (payload) ->
  messagesContainer.append("<br/>#{Date()} #{payload.body}")
  console.log(payload.body)
)

chan.join().receive("ok", (chan) ->
  console.log("Welcome to Phoenix Chat!")
)

