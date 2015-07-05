defmodule RealtimeChat.RoomsController do
  use RealtimeChat.Web, :controller

  alias RealtimeChat.Room

  plug :scrub_params, "room" when action in [:create, :update]

  def index(conn, _params) do
    rooms = Repo.all(Room)
    render(conn, "index.html", rooms: rooms)
  end

  def new(conn, _params) do
    changeset = Room.changeset(%Room{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"room" => room_params}) do
    changeset = Room.changeset(%Room{}, room_params)

    if changeset.valid? do
      Repo.insert!(changeset)

      conn
      |> put_flash(:info, "Room created successfully.")
      |> redirect(to: rooms_path(conn, :index))
    else
      render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    room = Repo.get from(r in Room, preload: [:messages]), id
    user = get_session conn, :current_user
    render(conn, "show.html", room: room, current_user: user)
  end

  def edit(conn, %{"id" => id}) do
    room = Repo.get!(Room, id)
    changeset = Room.changeset(room)
    render(conn, "edit.html", room: room, changeset: changeset)
  end

  def update(conn, %{"id" => id, "room" => room_params}) do
    room = Repo.get!(Room, id)
    changeset = Room.changeset(room, room_params)

    if changeset.valid? do
      Repo.update!(changeset)

      conn
      |> put_flash(:info, "Room updated successfully.")
      |> redirect(to: rooms_path(conn, :index))
    else
      render(conn, "edit.html", room: room, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    room = Repo.get!(Room, id)
    Repo.delete!(room)

    conn
    |> put_flash(:info, "Room deleted successfully.")
    |> redirect(to: rooms_path(conn, :index))
  end
end
