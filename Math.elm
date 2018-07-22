module Math exposing (..)

import Basics exposing (..)
import List exposing (sum, map2)


type alias Point =
    { x : Float
    , y : Float
    }



-- Apply binary operation op pointwise to points a, b
-- Returns "a op b" where op is expressed as an infix
-- e.g. Hadamard product of two point vectors is point_binop a b (*)


binop a b op =
    { x = op a.x b.x
    , y = op a.y b.y
    }


dot : Point -> ( Float, Float ) -> Float
dot a b =
    let
        ( v1, v2 ) =
            b
    in
        (a.x * v1) + (a.y * v2)



-- rotation matrix is [[0, -1], [1, 0]]
-- you then need a -1 x adjustment to account for non-rotation of the starting point


rotateClockwise : Point -> Point -> Point
rotateClockwise center p =
    let
        relToCenter =
            binop p center (-)

        rotated =
            { x = dot relToCenter ( 0, -1 )
            , y = dot relToCenter ( 1, 0 )
            }

        adjustRef =
            binop rotated { x = -1, y = 0 } (+)

        addBackCenter =
            binop adjustRef center (+)
    in
        addBackCenter



-- rotation matrix is [[0, 1], [-1, 0]]


rotateCounterclockwise : Point -> Point -> Point
rotateCounterclockwise center p =
    let
        relToCenter =
            binop p center (-)

        rotated =
            { x = dot relToCenter ( 0, 1 )
            , y = dot relToCenter ( -1, 0 )
            }

        adjustRef =
            binop rotated { x = 0, y = -1 } (+)

        addBackCenter =
            binop adjustRef center (+)
    in
        addBackCenter
