ESpec.start

 ESpec.configure fn(config) ->
   config.before fn ->
     Ecto.Adapters.SQL.restart_test_transaction(RealtimeChat.Repo, [])
   end

   config.finally fn(__) ->
   end
 end
