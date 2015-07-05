defmodule RealtimeChat.UserSpec do
  use ESpec.Phoenix, model: RealtimeChat.User, async: true

  alias RealtimeChat.User

  context "changesets" do
    it "is valid" do
      user = Forge.user

      result = Ecto.Changeset.change(user)

      expect(result).to be_valid
    end
  end
end
