module Model exposing (Model, model)

type alias Model =
  { json : String
  , lobby : Lobby
  }

model : Model
model =
  { json = "{\n}"
  , lobby = nullLobby
  }

type alias Lobby =
  { name: String }

nullLobby : Lobby
nullLobby = { name = "" }
