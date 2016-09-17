# Elm JSON Decode Example

## Contents

* Contains examples of JSON Decoding in the Elm language
* Subdirectories contains complete Elm apps with different decoding examples
* DotsAndBoxes is an (incomplete) example following
  [this article](https://robots.thoughtbot.com/decoding-json-structures-with-elm).
* EventSourcing is an example of parsing JSON payloads similar to ones
  you might encounter when working on an app
  with [Event Sourcing](http://martinfowler.com/eaaDev/EventSourcing.html).

## Links

* https://robots.thoughtbot.com/decoding-json-structures-with-elm
* http://package.elm-lang.org/packages/elm-lang/core/4.0.5/Json-Decode
* http://package.elm-lang.org/packages/elm-community/json-extra
* http://noredink.github.io/json-to-elm/

`elm-package.json` entry to use json-extra package:

`"elm-community/json-extra": "1.1.0 <= v < 2.0.0"`

## Running

### Startup

* `cd` to an example subdirectory, e.g. `EventSourcing`
* `elm-reactor`
* Open `http://localhost:8000`

### Running Apps

* Navigate to `App.elm`

### Running Tests

* Navigate to `TestSuite.elm`
