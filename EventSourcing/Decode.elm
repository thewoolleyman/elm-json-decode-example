module Decode exposing (decodeEvent)

import Model exposing (..)

import Json.Encode as Json
import Json.Decode.Extra exposing ((|:))
import Json.Decode exposing (Decoder, decodeString, succeed, fail, string, object1, andThen, (:=))

-- If json is coming from a port, take a Json.Decode.Value instead of String and use decodeValue instead of decodeString
decodeEvent : String -> Event
decodeEvent payload =
  case decodeString eventData payload of
    Ok eventData -> { data = eventData }
    Err errorMessage -> { data = InvalidEventType errorMessage }

eventData : Decoder EventData
eventData =
    ("eventType" := string) `andThen` decodeData

decodeData :  String -> Decoder EventData
decodeData eventType =
  case eventType of
    "TextualEntityUpdated" ->
      object1 TextualEntityUpdatedData ( "data" := string )
    _ ->
      fail ("Invalid eventType: '" ++ eventType ++ "'")

