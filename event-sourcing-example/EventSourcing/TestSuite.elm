module EventSourcing.TestSuite exposing (..)

import EventSourcing.Model exposing (..)
import EventSourcing.Decode exposing (decodeEvent)
import String
import Expect
import Test exposing (..)
import Test.Runner.Html


main : Program Never
main =
    [ testTextualEntityParsing
    , testNumericEntityParsing
    ]
        |> concat
        |> Test.Runner.Html.run


textualEntityUpdatedJson : String
textualEntityUpdatedJson =
    """{
  "eventId": "abc123",
  "eventType": "TextualEntityUpdated",
  "data": {
    "entityId": "321cba",
    "text": "my text"
  }
}
"""


numericEntityUpdatedJson : String
numericEntityUpdatedJson =
    """{
  "eventId": "def456",
  "eventType": "NumericEntityUpdated",
  "data": {
    "entityId": "654fed",
    "integer": 42
  }
}
"""


testTextualEntityParsing : Test
testTextualEntityParsing =
    describe "TextualEntity"
        [ test "parses" <|
            \() ->
                decodeEvent textualEntityUpdatedJson
                    |> Expect.equal
                        { eventId = "abc123"
                        , data = textualEntityUpdatedEventData "321cba" "my text"
                        }
        ]


testNumericEntityParsing : Test
testNumericEntityParsing =
    describe "NumericEntity"
        [ test "parses" <|
            \() ->
                decodeEvent numericEntityUpdatedJson
                    |> Expect.equal
                        { eventId = "def456"
                        , data = numericEntityUpdatedEventData "654fed" 42
                        }
        ]
