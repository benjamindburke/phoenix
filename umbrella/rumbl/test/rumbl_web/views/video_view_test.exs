defmodule RumblWeb.VideoViewTest do
  use RumblWeb.ConnCase, async: true
  import Phoenix.View

  alias Rumbl.Multimedia.{
    Category,
    Video
  }

  test "renders index.html", %{conn: conn} do
    videos = [
      %Video{id: "1", title: "dogs"},
      %Video{id: "2", title: "cats"}
    ]

    content =
      render_to_string(
        RumblWeb.VideoView,
        "index.html",
        conn: conn,
        videos: videos
      )

    assert String.contains?(content, "Listing Videos")

    videos
    |> Enum.map(&assert(String.contains?(content, &1.title)))
  end

  test "renders new.html", %{conn: conn} do
    changeset = Rumbl.Multimedia.change_video(%Video{})
    categories = [%Category{id: 123, name: "cats"}]

    content =
      render_to_string(RumblWeb.VideoView, "new.html",
        conn: conn,
        changeset: changeset,
        categories: categories
      )

    assert String.contains?(content, "New Video")
  end
end
