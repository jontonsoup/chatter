defmodule RealtimeChat.Repo.Migrations.CreateMessage do
  use Ecto.Migration

  def change do
    create table(:messages) do
      add :text, :string
      add :user_id, :integer
      add :room_id, :integer

      timestamps
    end

  end
end
