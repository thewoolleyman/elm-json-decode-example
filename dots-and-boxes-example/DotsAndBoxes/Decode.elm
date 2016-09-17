module DotsAndBoxes.Decode exposing (decodeLobby)

import DotsAndBoxes.Model exposing (Lobby, nullLobby)

import Json.Encode as Json
import Json.Decode.Extra exposing ((|:))
import Json.Decode exposing (Decoder, decodeString, succeed, string, (:=))

-- If json is coming from a port, take a Json.Decode.Value instead of String and use decodeValue instead of decodeString
decodeLobby : String -> Lobby
decodeLobby payload =
  case decodeString lobby payload of
    Ok val -> val
    Err message -> nullLobby

lobby : Decoder Lobby
lobby =
  succeed Lobby
    |: ("name" := string)
