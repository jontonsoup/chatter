defmodule RealtimeChat.User do
  use RealtimeChat.Web, :model

  schema "users" do
    field :email, :string
    field :username, :string
    field :hash, :string
    field :recovery_hash, :string
    has_many :messages, RealtimeChat.Message

    timestamps
  end

  @required_fields ~w(email username)
  @optional_fields ~w(hash recovery_hash)

  @doc """
  Creates a changeset based on the `model` and `params`.

  If `params` are nil, an invalid changeset is returned
  with no validation performed.
  """
  def changeset(model, params \\ :empty) do
    model
    |> cast(params, @required_fields, @optional_fields)
  end
end
