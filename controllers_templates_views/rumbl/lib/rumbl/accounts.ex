defmodule Rumbl.Accounts do
  @moduledoc """
  The Accounts context.
  """

  alias Rumbl.Accounts.User

  def list_users() do
    [
      %User{id: "1", name: "Jose", username: "josevalim"},
      %User{id: "2", name: "Bruce", username: "redrapids"},
      %User{id: "3", name: "Chris", username: "chrismccord"}
    ]
  end

  def get_user(id) do
    Enum.find(list_users(), &(&1.id == id))
  end

  def get_user_by(params) do
    list_users()
    |> Enum.find(&Enum.all?(params, fn {key, val} -> Map.get(&1, key) == val end))
  end
end
