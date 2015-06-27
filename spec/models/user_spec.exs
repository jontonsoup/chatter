defmodule RealtimeChat.UserSpec do
  use ESpec.Phoenix, model: RealtimeChat.User, async: true

  alias RealtimeChat.User
  alias RealtimeChat.Factory

  context "changesets" do
    it "is valid" do
      user = Factory.attributes_for(:user)

      result = User.changeset(%User{}, user)

      expect(result).to be_valid
    end
  end
end
