defmodule RealtimeChat.RoomChannel do
  use RealtimeChat.Web, :channel

  import RealtimeChat.Message
  import RealtimeChat.Room

  alias RealtimeChat.Message
  alias RealtimeChat.Room

  def join("rooms:" <> room_id, payload, socket) do
    if authorized?(payload) do
      {:ok, socket}
    else
      {:error, %{reason: "unauthorized"}}
    end
  end

  def join("rooms:lobby", payload, socket) do
    if authorized?(payload) do
      {:ok, socket}
    else
      {:error, %{reason: "unauthorized"}}
    end
  end

  def handle_in("new_msg", %{"body" => body, "user_id" => user_id, "room_id" => room_id}, socket) do
    user = Repo.get!(User, user_id)
    room = Repo.get!(Room, room_id)
    Repo.insert! %Message{text: body, user_id: user_id, room_id: room.id}

    broadcast! socket, "new_msg", %{body: body}
    {:noreply, socket}
  end

  def handle_out("new_msg", payload, socket) do
    push socket, "new_msg", payload
    {:noreply, socket}
  end

  # Add authorization logic here as required.
  defp authorized?(_payload) do
    true
  end
end
