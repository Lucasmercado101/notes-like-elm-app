module Api exposing (..)

import Http exposing (riskyRequest)
import Json.Decode as JD exposing (Decoder, field, int, list, map2, map4, map6, maybe, string)
import Json.Encode as JE
import Time exposing (Posix)


riskyGet : Http.Body -> Http.Expect msg -> Cmd msg
riskyGet body expect =
    riskyRequest
        { url = baseUrl ++ "login"
        , headers = []
        , method = "GET"

        -- TODO: timeout?
        , timeout = Nothing
        , tracker = Nothing
        , body = body
        , expect = expect
        }


type alias ID =
    Int


baseUrl : String
baseUrl =
    "http://localhost:4000/"


logIn : String -> String -> (Result Http.Error () -> msg) -> Cmd msg
logIn email password msg =
    riskyRequest
        { url = baseUrl ++ "login"
        , headers = []
        , method = "POST"

        -- TODO: timeout?
        , timeout = Nothing
        , tracker = Nothing
        , body =
            Http.jsonBody
                (JE.object
                    [ ( "email", JE.string email )
                    , ( "password", JE.string password )
                    ]
                )
        , expect = Http.expectWhatever msg
        }


type alias FullSyncResponse =
    ( List Note, List Label )


fullSync : (Result Http.Error FullSyncResponse -> msg) -> Cmd msg
fullSync msg =
    riskyGet Http.emptyBody (Http.expectJson msg fullSyncDecoder)


fullSyncDecoder : Decoder FullSyncResponse
fullSyncDecoder =
    map2 (\a b -> ( a, b ))
        (field "notes" (list noteDecoder))
        (field "labels" (list labelDecoder))


type alias Note =
    { id : ID
    , title : Maybe String
    , content : String
    , createdAt : Posix
    , updatedAt : Posix
    , labels : List ID
    }


type alias Label =
    { id : ID
    , name : String
    , createdAt : Posix
    , updatedAt : Posix
    }


noteDecoder : Decoder Note
noteDecoder =
    map6 Note
        (field "id" int)
        (field "title" (maybe string))
        (field "content" string)
        (field "createdAt" posixTime)
        (field "updatedAt" posixTime)
        (field "labels" (list int))


labelDecoder : Decoder Label
labelDecoder =
    map4 Label
        (field "id" int)
        (field "name" string)
        (field "createdAt" posixTime)
        (field "updatedAt" posixTime)


posixTime : Decoder Posix
posixTime =
    int |> JD.map Time.millisToPosix
