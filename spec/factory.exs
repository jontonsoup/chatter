defmodule RealtimeChat.Factory do
  use FactoryGirlElixir.Factory

  factory :user do
    field :email, &("bob#{&1}@example.com")
    field :username, &("foo#{&1}@example.com")
    field :password, "secret"
  end

  factory :assets do
    field :name, "bob"
  end
end
