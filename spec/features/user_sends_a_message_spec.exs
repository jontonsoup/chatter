# defmodule RealtimeChat.UserSendsMessage do
#   use ESpec.Phoenix, request: RealtimeChat.Endpoint, async: true
#   alias RealtimeChat.Factory

#   context "sends a message" do
#     context "from a room" do
#       it "creates a new user" do
#         user = Factory.attributes_for(:user)
#         room = Factory.attributes_for(:room) |> Factory.parametrize
#         text = "Hey!"

#         navigate_to rooms_path(RealtimeChat.Endpoint, :show, room)
#         find_element(:css, "#chat-input")
#           |> fill_field(text)
#         send_keys :enter

#         expect(visible_on_page?(text)).to eq true

#         navigate_to rooms_path(RealtimeChat.Endpoint, :show, room)
#         expect(visible_on_page?(text)).to eq true
#       end
#     end
#   end
# end
