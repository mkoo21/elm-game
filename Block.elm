module Block exposing (..)

import Svg exposing (rect, svg, text_)
import Svg.Attributes exposing (..)
import Colors exposing (red, blue, green, yellow, purple, sky, orange)


blockSize : Float
blockSize =
    25


block : String -> Float -> Float -> Svg.Svg msg
block color a b =
    rect
        [ width (toString blockSize)
        , height (toString blockSize)
        , x (toString (a * blockSize))
        , y
            (toString
                (b * blockSize)
            )
        , fill color
        , stroke "rgb(0,0,0)"
        , strokeWidth "2"
        ]
        []


main =
    svg
        [ width "400", height "900", viewBox "0 0 400 900" ]
        [ block red 1 1
        , block blue 2 2
        , block green 3 3
        , block yellow 4 4
        , block purple 5 5
        , block sky 6 6
        , block orange 7 7
        ]
