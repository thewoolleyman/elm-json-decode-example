module EventSourcing.App exposing (main)

import EventSourcing.Model exposing (Model, initialModel)
import EventSourcing.Decode exposing (decodeEvent)
import Html exposing (Html, button, div, text, textarea)
import Html.App as App
import Html.Attributes exposing (rows, cols, style)
import Html.Events exposing (onClick, onInput)
import Json.Encode exposing (object, string)


-- Exploring how to parse a sample of Event Sourcing event payload input


main =
    App.beginnerProgram { model = initialModel, view = view, update = update }



-- UPDATE


type Msg
    = UpdateJson String
    | Parse


update : Msg -> Model -> Model
update msg model =
    case msg of
        UpdateJson newJson ->
            { model | json = newJson }

        Parse ->
            { model | event = decodeEvent model.jsonx }



-- VIEW


view : Model -> Html Msg
view model =
    div [ style [ ( "margin", "10%" ) ] ]
        [ div [ style [ ( "font-weight", "bold" ) ] ] [ text "Input JSON:" ]
        , div [] [ textarea [ rows 20, cols 100, onInput UpdateJson ] [ text model.json ] ]
        , button [ onClick Parse ] [ text "parse" ]
        , div [ style [ ( "font-weight", "bold" ), ( "margin-top", "10px" ) ] ] [ text "Parsed Elm Record:" ]
        , div [] [ text (toString model.event) ]
        , div []
        ]
