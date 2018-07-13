module Tetromino exposing (..)

import List
import Svg exposing (svg)
import Svg.Attributes exposing (..)
import Block exposing (block)
import Colors exposing (red, blue, green, yellow, purple, sky, orange)


type alias Point =
    { x : Float
    , y : Float
    }


type alias Shape =
    List Point


type alias Tetromino =
    { shape : Shape
    , color : String
    , width : Int
    , height : Int
    , center : Point

    --, orientation : Int
    --, isCurrent : Bool
    }


tetromino : Tetromino -> List (Svg.Svg msg)
tetromino piece =
    let
        renderBlock ( x, y ) =
            block piece.color x y
    in
        List.map renderBlock piece.shape


ipiece =
    tetromino
        { shape =
            [ { x = 0, y = 0 }
            , { x = 0, y = 1 }
            , { x = 0, y = 2 }
            , { x = 0, y = 3 }
            ]
        , color = sky
        , width = 1
        , height = 4
        , center = { x = 0.5, y = 2 }
        }


opiece =
    tetromino
        { shape =
            [ { x = 0, y = 0 }
            , { x = 0, y = 1 }
            , { x = 1, y = 0 }
            , { x = 1, y = 1 }
            ]
        , color = yellow
        , width = 2
        , height = 2
        , center = { x = 1, y = 1 }
        }


tpiece =
    tetromino
        { shape =
            [ { x = 0, y = 1 }
            , { x = 1, y = 0 }
            , { x = 1, y = 1 }
            , { x = 2, y = 1 }
            ]
        , color = purple
        , width = 3
        , height = 2
        , center = { x = 1.5, y = 1.0 }
        }


jpiece =
    tetromino
        { shape =
            [ { x = 0, y = 0 }
            , { x = 0, y = 1 }
            , { x = 0, y = 2 }
            , { x = 1, y = 0 }
            ]
        , color = blue
        , width = 2
        , height = 3
        , center = { x = 1.0, y = 1.5 }
        }


lpiece =
    tetromino
        { shape =
            [ { x = 1, y = 0 }
            , { x = 1, y = 1 }
            , { x = 1, y = 2 }
            , { x = 0, y = 0 }
            ]
        , color = orange
        , width = 2
        , height = 3
        , center = { x = 1.0, y = 1.5 }
        }


spiece =
    tetromino
        { shape =
            [ { x = 1, y = 0 }
            , { x = 0, y = 1 }
            , { x = 1, y = 1 }
            , { x = 2, y = 0 }
            ]
        , color = green
        , width = 3
        , height = 2
        , center = { x = 1.5, y = 1.0 }
        }


zpiece =
    tetromino
        { shape =
            [ { x = 0, y = 0 }
            , { x = 1, y = 0 }
            , { x = 1, y = 1 }
            , { x = 2, y = 1 }
            ]
        , color = red
        , width = 3
        , height = 2
        , center = { x = 1.5, y = 1.0 }
        }



-- Rotation matrix: [[0, -1], [1, 0]]
--rotateClockwise : Point -> Point
--rotateClockwise =


main =
    svg
        [ width "400", height "900", viewBox "0 0 400 900" ]
        spiece
