defmodule Rumbl.Accounts do
  @moduledoc """
  The Accounts context.
  """
  alias Rumbl.Repo
  alias Rumbl.Accounts.User

  @doc """
  Get all users from the database.
  """
  def list_users, do: Repo.all(User)

  @doc """
  Get a user from the database from the primary key :id bigint.
  """
  def get_user(id), do: Repo.get(User, id)

  @doc """
  Get a user from the database from the primary key :id bigint.
  Throws the error Ecto.NotFoundError when there are no results.
  """
  def get_user!(id), do: Repo.get!(User, id)

  @doc """
  Get a user that matches all parameters in the params. Supported `params` types are Map and Keyword.
  """
  def get_user_by(params), do: Repo.get_by(User, params)

  @doc """
  Apply an Ecto.Changeset to a user.
  """
  def change_registration(%User{} = user, params) do
    User.registration_changeset(user, params)
  end

  def register_user(attrs \\ %{}) do
    %User{}
    |> User.registration_changeset(attrs)
    |> Repo.insert()
  end
end
