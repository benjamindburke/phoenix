alias Rumbl.Multimedia

~w(
  Action
  Drama
  Romance
  Comedy
  Sci-fi
)
|> Enum.each(&Multimedia.create_category!/1)
