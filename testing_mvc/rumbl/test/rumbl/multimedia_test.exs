defmodule Rumbl.MultimediaTest do
  use Rumbl.DataCase, async: true

  alias Rumbl.Multimedia
  alias Rumbl.Multimedia.Category

  describe "categories" do
    @test_categories String.codepoints("abcdef")

    test "list_alphabetical_categories/0" do
      @test_categories
      |> Enum.each(&Multimedia.create_category!/1)

      alpha_names =
        Multimedia.list_alphabetical_categories()
        |> Enum.map(&(&1.name))

      assert alpha_names == @test_categories
    end
  end
end
