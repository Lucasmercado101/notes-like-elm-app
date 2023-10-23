module Dog exposing (..)

import Html exposing (Html)
import Html.Attributes as Attr
import Svg exposing (..)
import Svg.Attributes as SvgAttr exposing (..)


dogSvg : Html a
dogSvg =
    svg
        [ SvgAttr.width "150px"
        , SvgAttr.height "158px"
        , SvgAttr.viewBox "0 0 100 100"
        , SvgAttr.version "1.1"
        , SvgAttr.id "svg5"
        , SvgAttr.xmlSpace "preserve"
        ]
        [ Svg.g
            [ SvgAttr.id "layer1"
            , SvgAttr.transform "translate(-20,-59)"
            ]
            [ Svg.path
                [ SvgAttr.style "fill:#fff;stroke-width:0.264583"
                , SvgAttr.d "m 64.160634,149.06267 c -2.26979,-0.20264 -6.79297,-1.18175 -9.67438,-2.09415 -5.91897,-1.87427 -10.16245,-4.47235 -14.813098,-9.06935 -2.95888,-2.92475 -5.860742,-6.92094 -6.21471,-8.55836 -0.102783,-0.47547 -0.657558,-1.3777 -1.232834,-2.00495 -1.061312,-1.1572 -1.799569,-2.5586 -1.799079,-3.4151 1.64e-4,-0.28841 0.49957,-0.75195 1.285933,-1.1936 2.000882,-1.12377 2.068158,-1.33897 0.583446,-1.8663 -0.969587,-0.34436 -1.356754,-0.64861 -1.613173,-1.26766 -0.326704,-0.78873 -0.299259,-0.85108 0.866286,-1.96794 0.988494,-0.94721 1.332391,-1.54669 1.923619,-3.35326 0.795202,-2.42984 3.010704,-7.35922 3.307593,-7.35922 0.103793,0 0.38496,0.51385 0.624811,1.14189 0.239852,0.62804 0.850016,1.54309 1.35592,2.03343 0.785426,0.76126 1.146014,0.90789 2.467846,1.0035 2.244,0.16232 3.85121,-0.71737 4.83602,-2.64693 0.99701,-1.95347 0.49963,-4.27982 -1.21771,-5.69539 -1.19327,-0.9836 -2.398042,-1.2512 -3.860317,-0.85745 -0.598926,0.16128 -1.150577,0.23161 -1.225888,0.1563 -0.07531,-0.0753 0.587393,-1.4256 1.472676,-3.000648 0.885282,-1.57504 1.773957,-3.33695 1.974829,-3.91535 0.2846,-0.8195 0.37449,-3.44628 0.4072,-11.899559 0.0536,-13.847095 0.33936,-16.014117 2.31706,-17.56978 1.56056,-1.227536 3.19943,-0.571855 6.09139,2.437057 6.28477,6.538912 15.44385,16.668883 15.44385,17.080942 0,0.19745 -0.40289,0.22862 -1.25677,0.0972 -0.69122,-0.10636 -2.70673,-0.19338 -4.4789,-0.19338 -4.88543,0 -4.63367,-0.33535 -5.76019,7.67292 -0.36847,2.61938 -0.85312,6.48531 -1.077,8.590968 -0.40196,3.78037 -0.68287,4.69207 -1.69475,5.5002 -0.22922,0.18306 -2.46086,1.7702 -4.95921,3.52697 -5.414064,3.80704 -7.393232,5.54147 -8.368862,7.33403 -0.994817,1.8278 -1.773063,5.04385 -1.773063,7.32706 0,1.59544 0.131501,2.16295 0.820851,3.54246 0.82826,1.6575 2.946861,3.73467 4.771564,4.67826 0.57604,0.29788 0.75224,0.53875 0.62844,0.85908 -0.40448,1.04661 -0.61655,2.92438 -0.42555,3.76796 0.69444,3.06699 3.92028,5.53252 7.24596,5.53813 2.50734,0.004 3.59478,-0.76669 6.46568,-4.58372 2.12776,-2.829 4.30265,-3.89531 9.26628,-4.54313 3.7216,-0.48571 3.92712,-0.54155 5.02757,-1.36599 1.24055,-0.92939 1.71491,-2.02025 1.69683,-3.90206 -0.0344,-3.58189 -1.11188,-5.48132 -5.86602,-10.34105 -3.97773,-4.06609 -5.92578,-6.53162 -6.3392,-8.02319 -0.14828,-0.53496 -0.40149,-1.96048 -0.5627,-3.16782 -0.96855,-7.25399 3.21699,-17.864398 8.25984,-20.938788 1.03823,-0.63296 2.1771,-0.67826 6.43349,-0.25592 2.03525,0.20195 3.14018,0.2067 3.62978,0.0156 0.38712,-0.15111 1.41179,-1.2045 2.27705,-2.340851 5.15857,-6.774801 11.321943,-12.598778 16.385823,-15.226015 3.004213,-1.659116 6.633103,1.421797 6.922943,3.177264 0.50566,1.181765 0.36307,3.632049 0.32232,8.26481 0.38448,7.338142 0.19627,12.023392 -0.71735,17.857422 -0.38741,2.473858 -0.70516,4.855108 -0.70612,5.291668 -0.001,0.4503 0.8595,2.57197 1.98867,4.90341 1.55449,3.2096 2.20071,4.27007 2.9507,4.84211 1.179,0.89927 1.32034,2.04491 0.33217,2.69238 -0.74233,0.4864 -2.42137,0.20997 -4.18273,-0.68861 -1.23786,-0.63151 -1.48041,-0.53546 -0.89686,0.35515 0.61065,0.93198 2.5667,2.25912 4.45766,3.02443 0.90581,0.3666 1.79575,0.78833 1.97766,0.93717 0.74007,0.60558 0.17366,2.14541 -1.4504,3.94305 -0.78327,0.86698 -0.96911,1.2906 -1.02161,2.32875 -0.15903,3.14498 -3.97243,8.68568 -8.814566,12.8072 -6.81861,5.80385 -14.48757,9.08712 -24.18114,10.35256 -2.81399,0.36734 -7.84456,0.47337 -10.63593,0.22416 z m 14.54669,-35.08203 c 1.87377,-1.06124 2.75492,-3.58904 1.97354,-5.66157 -0.38421,-1.01909 -1.78193,-2.42747 -2.86035,-2.88218 -2.47391,-1.04311 -5.50376,0.0768 -6.36621,2.35301 -1.64376,4.33835 3.20954,8.48084 7.25302,6.19074 z m 19.05765,-14.215248 c 0.6799,-1.10012 2.920706,-11.4612 3.563456,-16.476793 1.10679,-8.63664 0.77539,-11.412596 -2.314391,-11.412596 -2.04324,0 -3.326957,1.582275 -5.664066,4.112472 -2.286592,2.475506 -4.475468,5.751869 -6.2229,7.967762 0,0 -1.874047,2.713144 -2.658137,3.622688 3.010906,2.069998 6.124778,5.332477 6.124778,5.332477 1.37523,1.048636 3.18129,3.27773 4.2785,4.6419 1.89083,2.3509 2.51295,2.826628 2.89276,2.21209 z M 50.152734,84.204025 c -0.29351,-5.088469 -0.92544,-13.130362 -1.1006,-14.006152 -0.41105,-2.055226 -2.65522,-2.579467 -3.66405,-0.855924 -0.5246,0.896268 -0.54016,1.265161 -0.48396,11.473965 0.0319,5.801358 0.13285,10.783528 0.22425,11.071488 0.14222,0.4481 0.52914,0.15466 2.68433,-2.03585 l 2.51816,-2.55941 z m -0.90479,57.006915 c -1.17497,-0.4252 -2.8443,-1.84729 -3.37646,-2.87636 -0.91255,-1.76469 0.34154,-5.37805 2.37924,-6.85517 1.77985,-1.2902 3.02953,-1.25302 6.71831,0.19993 2.62546,1.03412 4.31201,1.25266 6.86763,0.88989 2.13982,-0.30375 2.96763,-0.20685 2.21368,0.25912 -0.19775,0.12222 -0.84187,0.29934 -1.43137,0.3936 -2.48509,0.39739 -5.55454,2.78108 -7.78015,6.04198 -1.46733,2.14988 -3.28302,2.78219 -5.59088,1.94701 z m -3.57182,-19.32793 c -2.6263,-0.967 -4.334817,-4.25705 -2.748299,-5.29234 0.327419,-0.21366 1.397089,-0.51604 2.377049,-0.67196 3.50197,-0.5572 7.87555,1.02636 7.87555,2.85153 0,0.4972 -1.74784,1.98133 -3.0427,2.58362 -1.76691,0.82187 -3.20378,0.99228 -4.4616,0.52915 z"
                , SvgAttr.id "path125"
                ]
                []
            ]
        ]
