# defmodule RealtimeChat.ExampleControllerSpec do

#   use ESpec.Phoenix, controller: RealtimeChat.PostsController

#   describe "index" do
#     let :examples do
#       [
#         %RealtimeChat.Example{title: "Example 1"},
#         %RealtimeChat.Example{title: "Example 2"},
#       ]
#     end

#     before do
#       allow(RealtimeChat.Repo).to accept(:all, fn -> examples end)
#     end

#     subject do: action :index

#     it do: should be_successfull
#     it do: should have_in_assigns(:examples, examples)
    
#   end
# end
