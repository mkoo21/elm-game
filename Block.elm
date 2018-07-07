module Block exposing (..)

import Svg exposing (rect, svg, text_)
import Svg.Attributes exposing (..)


blockSize : Int
blockSize =
    25


type alias Block =
    { color : String
    , x : Int
    , y : Int
    }



-- Model
-- Update
-- View


renderBlock : Block -> Svg.Svg msg
renderBlock block =
    rect
        [ width (toString blockSize)
        , height (toString blockSize)
        , x (toString (block.x * blockSize))
        , y
            (toString
                (block.y * blockSize)
            )
        , fill block.color
        ]
        []


main =
    svg
        [ width "400", height "900", viewBox "0 0 400 900" ]
        [ renderBlock (Block "rgb(255,0,0)" 2 2) ]
