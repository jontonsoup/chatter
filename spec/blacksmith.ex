defmodule Blacksmith.Config do
  def save(repo, model) do
    repo |> save( model )
  end

  def save_all(repo, list_of_models) do
    repo |> save_all( list_of_models )
  end
end
