module Decode exposing (decodeEvent)

import Model exposing (..)

import Json.Encode as Json
import Json.Decode.Extra exposing ((|:))
import Json.Decode exposing (Decoder, decodeString, succeed, fail, string, int, object1, object2, andThen, (:=))

-- If json is coming from a port, take a Json.Decode.Value instead of String and use decodeValue instead of decodeString
decodeEvent : String -> Event
decodeEvent eventPayload =
  case decodeString eventDecoder eventPayload of
    Ok event -> event
    Err errorMessage -> { eventId = "", data = InvalidEventData errorMessage }

eventDecoder : Decoder Event
eventDecoder =
  object2 Event
    ( "eventId" := string )
    eventDataDecoder

eventDataDecoder : Decoder EventData
eventDataDecoder =
  ("eventType" := string) `andThen` decodeEventData

decodeEventData :  String -> Decoder EventData
decodeEventData eventType =
  case eventType of
    "TextualEntityUpdated" ->
      textualEntityUpdatedEventDataDecoder
    "NumericEntityUpdated" ->
      numericEntityUpdatedEventDataDecoder
    _ ->
      fail ("Invalid eventType: '" ++ eventType ++ "'")

textualEntityUpdatedEventDataDecoder : Decoder EventData
textualEntityUpdatedEventDataDecoder =
  object1 TextualEntityUpdatedEventData ( "data" := string )

numericEntityUpdatedEventDataDecoder : Decoder EventData
numericEntityUpdatedEventDataDecoder =
  object1 NumericEntityUpdatedEventData ( "data" := int )
