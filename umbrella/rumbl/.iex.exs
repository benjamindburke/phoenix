import Ecto.Query

# available in IEx as Repo
#
# examples:
#
#   Repo.all from c in Category, order_by: c.name, select: {c.name, c.id}
#   Repo.one from u in User, where: u.username == ^"test_user"
alias Rumbl.Repo

# alias common business logic structs for easy querying

# `as: Category` is implicit because of Elixir's aliasing rules and can be removed,
# but this shows we can rename a business struct (database table) to anything we want including namespacing
alias Rumbl.Multimedia.Category, as: Category

# `as: Video` is implicit because of Elixir's aliasing rules and can be removed,
# but this shows we can rename a business struct (database table) to anything we want including namespacing
alias Rumbl.Multimedia.Video, as: Video

# `as: User` is implicit because of Elixir's aliasing rules and can be removed,
# but this shows we can rename a business struct (database table) to anything we want including namespacing
alias Rumbl.Accounts.User, as: User

IEx.configure(colors: [enabled: true])
