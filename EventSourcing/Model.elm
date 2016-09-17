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
  "eventType": "TextualEntityUpdated",
  "data": "my text"
}
"""


type alias Event =
  { data : EventData
  }

nullEvent : Event
nullEvent =
  { data = NullEventData
  }

type EventData
  = TextualEntityUpdatedEventData String
  | NumericEntityUpdatedEventData Int
  | NullEventData
  | InvalidEventData String
