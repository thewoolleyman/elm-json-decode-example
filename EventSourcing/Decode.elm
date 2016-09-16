module Decode exposing (decodeEvent)

import Model exposing (Event, nullEvent)

import Json.Encode as Json
import Json.Decode.Extra exposing ((|:))
import Json.Decode exposing (Decoder, decodeString, succeed, string, (:=))

-- If json is coming from a port, take a Json.Decode.Value instead of String and use decodeValue instead of decodeString
decodeEvent : String -> Event
decodeEvent payload =
  case decodeString event payload of
    Ok val -> val
    Err message -> nullEvent

event : Decoder Event
event =
  succeed Event
    |: ("eventType" := string)
