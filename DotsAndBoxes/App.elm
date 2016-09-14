module DotsAndBoxes.Model exposing (Lobby, nullLobby)

import Html exposing (Html, button, div, text, textarea)
import Html.App as App
import Html.Events exposing (onClick, onInput)

-- Based on https://robots.thoughtbot.com/decoding-json-structures-with-elm

main =
  App.beginnerProgram { model = model, view = view, update = update }


-- MODEL

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

-- UPDATE

type Msg = UpdateJson String | Parse

update : Msg -> Model -> Model
update msg model =
  case msg of
    UpdateJson newJson ->
      { model | json = newJson }
    Parse ->
      model

-- VIEW

view : Model -> Html Msg
view model =
  div []
    [ div [] [ textarea [ onInput UpdateJson ] [ text model.json ]]
    , button [ onClick Parse ] [ text "parse" ]
    , div [] [ text (toString model.lobby) ]
    ]


