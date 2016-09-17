module TestSuite exposing (..)

import String
import Expect
import Test exposing (..)
import Test.Runner.Html

import Model exposing (..)
import Decode exposing (decodeEvent)


main : Program Never
main =
    [ testTextualEntityParsing
    ]
        |> concat
        |> Test.Runner.Html.run

textualEntityUpdatedJson : String
textualEntityUpdatedJson = """{
  "eventType": "TextualEntityUpdated",
  "data": "my text"
}
"""


testTextualEntityParsing : Test
testTextualEntityParsing =
    describe "TextualEntity"
        [ test "parses" <|
            \() ->
                decodeEvent textualEntityUpdatedJson
                    |> Expect.equal
                      {
                        data = TextualEntityUpdatedEventData "my text"
                      }
        ]
