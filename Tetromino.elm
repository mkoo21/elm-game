module Tetromino exposing (..)

import List
import Svg exposing (svg)
import Svg.Attributes exposing (..)
import Block exposing (block)
import Colors exposing (red, blue, green, yellow, purple, sky, orange)


type alias Shape =
    List ( Int, Int )


type alias Tetromino =
    { shape : Shape
    , color : String

    --, orientation : Int
    --, isCurrent : Bool
    }


tetromino : Shape -> String -> List (Svg.Svg msg)
tetromino shape color =
    let
        renderBlock ( x, y ) =
            block color x y
    in
        List.map renderBlock shape


ipiece =
    tetromino [ ( 0, 0 ), ( 0, 1 ), ( 0, 2 ), ( 0, 3 ) ] sky


opiece =
    tetromino [ ( 0, 0 ), ( 0, 1 ), ( 1, 0 ), ( 1, 1 ) ] yellow


tpiece =
    tetromino [ ( 0, 1 ), ( 1, 0 ), ( 1, 1 ), ( 2, 1 ) ] purple


jpiece =
    tetromino [ ( 0, 0 ), ( 0, 1 ), ( 0, 2 ), ( 1, 0 ) ] blue


lpiece =
    tetromino [ ( 1, 0 ), ( 1, 1 ), ( 1, 2 ), ( 0, 0 ) ] orange


spiece =
    tetromino [ ( 1, 0 ), ( 0, 1 ), ( 1, 1 ), ( 2, 0 ) ] green


zpiece =
    tetromino [ ( 0, 0 ), ( 1, 0 ), ( 1, 1 ), ( 2, 1 ) ] red


main =
    svg
        [ width "400", height "900", viewBox "0 0 400 900" ]
        spiece
