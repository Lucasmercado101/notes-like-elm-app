port module Ports exposing (..)


port updateLastSyncedAt : Int -> Cmd msg


port receiveRandomValues : (List Int -> msg) -> Sub msg


port requestRandomValues : () -> Cmd msg


port backOnline : (() -> msg) -> Sub msg


isNowOnline : msg -> Sub msg
isNowOnline msg =
    backOnline (always msg)


isNowOffline : msg -> Sub msg
isNowOffline msg =
    backOnline (always msg)


port goneOffline : (() -> msg) -> Sub msg
