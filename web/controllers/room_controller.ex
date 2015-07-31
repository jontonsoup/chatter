defmodule RealtimeChat.RoomController do
  use RealtimeChat.Web, :controller

  alias RealtimeChat.Room

  plug :scrub_params, "room" when action in [:create, :update]

  def index(conn, _params) do
    rooms = Repo.all(Room)
    render(conn, "index.json", rooms: rooms)
  end

  def create(conn, %{"room" => room_params}) do
    changeset = Room.changeset(%Room{}, room_params)

    if changeset.valid? do
      room = Repo.insert!(changeset)
      render(conn, "show.json", room: room)
    else
      conn
      |> put_status(:unprocessable_entity)
      |> render(RealtimeChat.ChangesetView, "error.json", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    room = Repo.get!(Room, id)
    render conn, "show.json", room: room
  end

  def update(conn, %{"id" => id, "room" => room_params}) do
    room = Repo.get!(Room, id)
    changeset = Room.changeset(room, room_params)

    if changeset.valid? do
      room = Repo.update!(changeset)
      render(conn, "show.json", room: room)
    else
      conn
      |> put_status(:unprocessable_entity)
      |> render(RealtimeChat.ChangesetView, "error.json", changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    room = Repo.get!(Room, id)

    room = Repo.delete!(room)
    render(conn, "show.json", room: room)
  end
end
