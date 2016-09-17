module EventSourcing.Model exposing
  ( Model
  , initialModel
  , Event
  , textualEntityUpdatedEventData
  , numericEntityUpdatedEventData
  , nullEvent
  , invalidEvent
  , EventData
  )

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
  , data = Null
  }

invalidEvent : String -> Event
invalidEvent errorMessage =
  { eventId = ""
  , data = Invalid errorMessage
  }

type EventData
  = TextualEntityUpdated String
  | NumericEntityUpdated Int
  | Null
  | Invalid String

-- Follow http://package.elm-lang.org/help/design-guidelines#keep-tags-and-record-constructors-secret

textualEntityUpdatedEventData : String -> EventData
textualEntityUpdatedEventData text = TextualEntityUpdated text

numericEntityUpdatedEventData : Int -> EventData
numericEntityUpdatedEventData integer = NumericEntityUpdated integer

