module EventSourcing.Decode exposing (decodeEvent)

import EventSourcing.Model exposing
  ( Event
  , textualEntityUpdatedEventData
  , numericEntityUpdatedEventData
  , invalidEvent
  , EventData
  , TextualEntityUpdatedEventData
  )


import Json.Encode as Json
import Json.Decode.Extra exposing ((|:))
import Json.Decode exposing (Decoder, decodeString, succeed, fail, string, int, object1, object2, at, andThen, (:=))

-- If json is coming from a port, take a Json.Decode.Value instead of String and use decodeValue instead of decodeString
decodeEvent : String -> Event
decodeEvent eventPayload =
  case decodeString eventDecoder eventPayload of
    Ok event -> event
    Err errorMessage -> invalidEvent errorMessage

eventDecoder : Decoder Event
eventDecoder =
  object2 Event
    ( "eventId" := string )
    eventDataDecoder

eventDataDecoder : Decoder EventData
eventDataDecoder =
  ("eventType" := string) `andThen` decodeEventData

decodeEventData : String -> Decoder EventData
decodeEventData eventType =
 at ["data"] <| eventDataDecoderForEventType eventType

eventDataDecoderForEventType : String -> Decoder EventData
eventDataDecoderForEventType eventType =
  case eventType of
    "TextualEntityUpdated" ->
      textualEntityUpdatedEventDataDecoder
    "NumericEntityUpdated" ->
      numericEntityUpdatedEventDataDecoder
    _ ->
      fail ("Invalid eventType: '" ++ eventType ++ "'")

-- Note that this uses the standard Elm Json.Decode library approach using `object2` and `:=`
textualEntityUpdatedEventDataDecoder : Decoder EventData
textualEntityUpdatedEventDataDecoder =
  object2 textualEntityUpdatedEventData ( "entityId" := string ) ( "text" := string )

-- Note that this uses the elm-community/json-extra Json.Decode.Extra library approach using `succeed` and `|=`
numericEntityUpdatedEventDataDecoder : Decoder EventData
numericEntityUpdatedEventDataDecoder =
  succeed numericEntityUpdatedEventData
  |: ( "entityId" := string )
  |: ( "integer" := int )
