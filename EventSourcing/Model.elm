module Model exposing (..)

type alias Model =
  { json : String
  , event : Event
  }

model : Model
model =
  { json = sampleJson
  , event = nullEvent
  }

sampleJson : String
sampleJson = """{
  "eventId": "abc123",
  "eventType": "TextualEntityUpdated",
  "data": "my text"
}
"""


type alias Event =
  { eventId : String
  , data : EventData
  }

nullEvent : Event
nullEvent =
  { eventId = ""
  , data = NullEventData
  }

type EventData
  = TextualEntityUpdatedEventData String
  | NumericEntityUpdatedEventData Int
  | NullEventData
  | InvalidEventData String
