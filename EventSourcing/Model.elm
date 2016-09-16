module Model exposing (..)

type alias Model =
  { json : String
  , event : Event
  }

model : Model
model =
  { json = "{\n  \"eventType\": \"TextualEntityUpdated\"\n}"
  , event = nullEvent
  }

type alias Event =
  { eventType: String }

nullEvent : Event
nullEvent = { eventType = "" }
