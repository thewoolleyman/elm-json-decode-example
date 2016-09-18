module EventSourcing.Model exposing
  ( Model
  , initialModel
  , Event
  , textualEntityUpdatedEventData
  , numericEntityUpdatedEventData
  , nullEvent
  , invalidEvent
  , EventData
  , TextualEntityUpdatedEventData
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
  "data": {
    "entityId": "321cba",
    "text": "my text"
  }
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
  = TextualEntityUpdated String String
  | NumericEntityUpdated String Int
  | Null
  | Invalid String

-- Follow http://package.elm-lang.org/help/design-guidelines#keep-tags-and-record-constructors-secret

type alias TextualEntityUpdatedEventData =
  { entityId : String
  , text : String
  }

type alias NumericEntityUpdatedEventData =
  { entityId : String
  , integer : Int
  }

textualEntityUpdatedEventData : String -> String -> EventData
textualEntityUpdatedEventData entityId text = TextualEntityUpdated entityId text

numericEntityUpdatedEventData : String -> Int -> EventData
numericEntityUpdatedEventData entityId integer = NumericEntityUpdated entityId integer

