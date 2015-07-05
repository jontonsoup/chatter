defmodule RealtimeChat.Repo.Migrations.CreateRooms do
  use Ecto.Migration

  def change do
    create table(:rooms) do
      add :topic, :string

      timestamps
    end

  end
end
