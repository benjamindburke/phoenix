defmodule RumblWeb.SessionController do
  use RumblWeb, :controller

  alias Rumbl.Accounts

  def new(conn, _) do
    render(conn, "new.html")
  end

  def create(conn, %{"session" => %{"username" => username, "password" => pass}}) do
    case Accounts.authenticate_by_username_and_pass(username, pass) do
      {:ok, user} ->
        conn
        |> RumblWeb.Auth.login(user)
        |> put_flash(:info, "Welcome back!")
        |> redirect(to: Routes.page_path(conn, :index))

      {:error, _reason} ->
        conn
        # we definitely could report a more useful error message like "Invalid username"
        # but this approach may raise privacy issues as anyone might be able to tell whether an email is registered
        |> put_flash(:error, "Invalid username/password combination")
        |> render("new.html")
    end
  end
end
