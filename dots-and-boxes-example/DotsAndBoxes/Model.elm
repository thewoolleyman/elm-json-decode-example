module DotsAndBoxes.Model exposing (Model, model, Lobby, nullLobby)

type alias Model =
  { json : String
  , lobby : Lobby
  }

model : Model
model =
  { json = "{\n  \"name\": \"Awesome place to meet\"\n}"
  , lobby = nullLobby
  }

type alias Lobby =
  { name: String }

nullLobby : Lobby
nullLobby = { name = "" }
