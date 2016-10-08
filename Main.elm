module Main exposing (..)

import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (..)
import Html.App as App
-- import VirtualDom exposing (..)

-- model

type alias Model =
  { firstName: String
  , lastName: String
  , email: String }

initModel : Model
initModel =
  { firstName = ""
  , lastName = ""
  , email = "" }


-- update

type Msg =
    UpdateFirstName String
  | UpdateLastName String
  | UpdateEmail String

update : Msg -> Model -> Model
update msg model =
  case msg of
    UpdateFirstName val ->
      { model
      | firstName = val }
    UpdateLastName val ->
      { model
      | lastName = val }
    UpdateEmail val ->
      { model
      | email = val }


-- view

view : Model -> Html Msg
view model =
  div []
    [ div []
      [ input [ type' "text", onInput UpdateFirstName ][]
      , input [ type' "text", onInput UpdateLastName ][]
      , input [ type' "text", onInput UpdateEmail ][]
      ]
    , div []
      [ p [][text (model.firstName)]
      , p [][text (model.lastName)]
      , p [][text (model.email)]
      ]
    ]

main =
  App.beginnerProgram
    { model = initModel
    , update = update
    , view = view }
