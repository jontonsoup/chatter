defmodule RealtimeChat.Message do
  use RealtimeChat.Web, :model

  schema "messages" do
    field :text, :string
    belongs_to :user, RealtimeChat.User
    belongs_to :room, RealtimeChat.Room

    timestamps
  end

  @required_fields ~w(text user_id room_id)
  @optional_fields ~w()

  @doc """
  Creates a changeset based on the `model` and `params`.

  If no params are provided, an invalid changeset is returned
  with no validation performed.
  """
  def changeset(model, params \\ :empty) do
    model
    |> cast(params, @required_fields, @optional_fields)
  end
end
