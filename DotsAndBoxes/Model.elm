module Model exposing (..)

type alias Model =
  { json : String
  , lobby : Lobby
  }

model : Model
model =
  { json = "{\n  \"name\": \"Awesome place to meet\"}"
  , lobby = nullLobby
  }

type alias Lobby =
  { name: String }

nullLobby : Lobby
nullLobby = { name = "" }
