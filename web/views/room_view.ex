defmodule RealtimeChat.RoomView do
  use RealtimeChat.Web, :view

  def render("index.json", %{rooms: rooms}) do
    %{data: render_many(rooms, "room.json")}
  end

  def render("show.json", %{room: room}) do
    %{data: render_one(room, "room.json")}
  end

  def render("room.json", %{room: room}) do
    %{id: room.id, topic: room.topic}
  end
end
