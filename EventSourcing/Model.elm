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
  { eventType : String
  , data : String
  }

nullEvent : Event
nullEvent =
  { eventType = ""
  , data = ""
  }
