module Model exposing (..)

type alias Model =
  { json : String
  , event : Event
  }

model : Model
model =
  { json = "{\n  \"eventType\": \"TextualEntityUpdated\",\n  \"data\": \"my text\"\n}"
  , event = nullEvent
  }

type alias Event =
  { data : EventData
  }

nullEvent : Event
nullEvent =
  { data = NullEventData
  }

type EventData
  = TextualEntityUpdatedEventData String
  | NullEventData
  | InvalidEventData String
