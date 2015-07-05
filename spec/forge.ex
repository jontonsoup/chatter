defmodule RealtimeChat.Forge do
  use Blacksmith

  @save_one_function &Blacksmith.Config.save/2
  @save_all_function &Blacksmith.Config.save_all/2

  register :user,
  __struct__: RealtimeChat.User,
  name: Faker.Name.first_name,
  email: Sequence.next(:email, &"test#{&1}@example.com"),
  username: Sequence.next(:username, &"username#{&1}"),
  password: Sequence.next(:pass, &"pass#{&1}")
end
