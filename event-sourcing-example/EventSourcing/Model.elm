module EventSourcing.Model exposing (..)

type alias Model =
  { json : String
  , event : Event
  }

initialModel : Model
initialModel =
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

invalidEvent : String -> Event
invalidEvent errorMessage =
  { eventId = ""
  , data = InvalidEventData errorMessage
  }

type EventData
  = TextualEntityUpdatedEventData String
  | NumericEntityUpdatedEventData Int
  | NullEventData
  | InvalidEventData String
