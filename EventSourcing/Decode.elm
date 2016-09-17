module Decode exposing (decodeEvent)

import Model exposing (..)

import Json.Encode as Json
import Json.Decode.Extra exposing ((|:))
import Json.Decode exposing (Decoder, decodeString, succeed, fail, string, object1, andThen, (:=))

-- If json is coming from a port, take a Json.Decode.Value instead of String and use decodeValue instead of decodeString
decodeEvent : String -> Event
decodeEvent eventPayload =
  case decodeString eventDataDecoder eventPayload of
    Ok eventData -> { data = eventData }
    Err errorMessage -> { data = InvalidEventData errorMessage }

eventDataDecoder : Decoder EventData
eventDataDecoder =
    ("eventType" := string) `andThen` decodeEventData

decodeEventData :  String -> Decoder EventData
decodeEventData eventType =
  case eventType of
    "TextualEntityUpdated" ->
      object1 TextualEntityUpdatedEventData ( "data" := string )
    _ ->
      fail ("Invalid eventType: '" ++ eventType ++ "'")
