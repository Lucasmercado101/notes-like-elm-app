module Page.EditNote exposing (..)

import Api exposing (SyncableID)
import Browser.Navigation as Nav
import Css exposing (alignItems, backgroundColor, border3, borderBottom3, borderLeft3, borderRight3, borderTop3, center, color, cursor, displayFlex, fontSize, height, hover, justifyContent, padding, paddingBottom, paddingTop, pct, pointer, px, solid, spaceBetween, width)
import CssHelpers exposing (black, col, delaGothicOne, error, padX, publicSans, row, secondary, white)
import DataTypes exposing (Label, Note)
import Helpers exposing (listFirst, sameId)
import Html.Styled exposing (Html, div, p, text)
import Html.Styled.Attributes exposing (css, title)
import Html.Styled.Events exposing (onClick)
import Material.Icons as Filled
import Material.Icons.Outlined as Outlined
import Material.Icons.Types exposing (Coloring(..))
import OfflineQueue exposing (Action(..))
import Random
import Route
import Svg.Styled


pureNoSignal : Model -> ( Model, Cmd msg, Maybe Signal )
pureNoSignal m =
    ( m, Cmd.none, Nothing )


pureWithSignal : Signal -> Model -> ( Model, Cmd msg, Maybe Signal )
pureWithSignal s m =
    ( m, Cmd.none, Just s )


subscriptions : Model -> Sub Msg
subscriptions model =
    Sub.none


type alias Model =
    { noteId : SyncableID

    -- global data
    , key : Nav.Key
    , seeds : List Random.Seed
    , notes : List Note
    , labels : List Label
    }


init :
    { notes : List Note
    , labels : List Label
    , noteId : SyncableID
    , seeds : List Random.Seed
    , key : Nav.Key
    }
    -> Model
init { notes, labels, noteId, seeds, key } =
    { notes = notes
    , labels = labels
    , noteId = noteId
    , seeds = seeds
    , key = key
    }



-- UPDATE


type Msg
    = NoOp
    | FinishEditing
    | ChangePin Bool


type Signal
    = OfflineQueueAction OfflineQueue.Action


update : Msg -> Model -> ( Model, Cmd Msg, Maybe Signal )
update msg model =
    let
        maybeNote =
            listFirst (.id >> sameId model.noteId) model.notes
    in
    case maybeNote of
        Nothing ->
            -- TODO: what now?
            model |> pureNoSignal

        Just note ->
            case msg of
                NoOp ->
                    model |> pureNoSignal

                FinishEditing ->
                    ( model, Route.replaceUrl model.key Route.Home, Nothing )

                ChangePin newVal ->
                    ( { model
                        | notes =
                            model.notes
                                |> List.map
                                    (\e ->
                                        if sameId e.id note.id then
                                            { e | pinned = newVal }

                                        else
                                            e
                                    )
                      }
                    , Cmd.none
                    , Just (OfflineQueueAction (QToggleNotePin note.id newVal))
                    )



-- VIEW


view : Model -> Html Msg
view model =
    let
        note =
            listFirst (.id >> sameId model.noteId) model.notes
    in
    case note of
        Nothing ->
            -- TODO: empty state when no note or just redirect?
            div [] [ text "Note Not found" ]

        Just val ->
            let
                topActions =
                    row [ css [ justifyContent spaceBetween, alignItems center, backgroundColor white, borderBottom3 (px 3) solid black ] ]
                        [ div
                            [ css
                                [ if val.pinned then
                                    hover [ color black, backgroundColor white ]

                                  else
                                    hover [ backgroundColor black, color white ]
                                , cursor pointer
                                , displayFlex
                                , justifyContent center
                                , alignItems center
                                , paddingTop (px 8)
                                , paddingBottom (px 6)
                                , padX (px 8)
                                , borderRight3 (px 2) solid black
                                , if val.pinned then
                                    Css.batch [ backgroundColor black, color white ]

                                  else
                                    Css.batch []
                                ]
                            , title
                                (if val.pinned then
                                    "Unpin"

                                 else
                                    "pin"
                                )
                            , onClick (ChangePin (not val.pinned))
                            ]
                            [ Filled.push_pin 32 Inherit |> Svg.Styled.fromUnstyled ]
                        , p [ css [ delaGothicOne, fontSize (px 24) ] ] [ text "Editing Note" ]
                        , div
                            [ css [ cursor pointer, displayFlex, justifyContent center, alignItems center, paddingTop (px 8), paddingBottom (px 6), padX (px 8), backgroundColor error, borderLeft3 (px 2) solid black, color white ]
                            , onClick FinishEditing
                            ]
                            [ Filled.close 32 Inherit |> Svg.Styled.fromUnstyled ]
                        ]

                bottomActions =
                    row [ css [ justifyContent spaceBetween, backgroundColor white, borderTop3 (px 3) solid black ] ]
                        [ div [ css [ cursor pointer, displayFlex, color white, justifyContent center, alignItems center, backgroundColor error, paddingTop (px 8), paddingBottom (px 6), padX (px 8), borderRight3 (px 2) solid black ] ] [ Filled.delete 28 Inherit |> Svg.Styled.fromUnstyled ]
                        , div [ css [ cursor pointer, displayFlex, justifyContent center, alignItems center, paddingTop (px 8), paddingBottom (px 6), padX (px 8), borderLeft3 (px 2) solid black ] ] [ Filled.label 28 Inherit |> Svg.Styled.fromUnstyled ]
                        ]
            in
            -- TODO: add max title and content length
            row [ css [ height (pct 100), justifyContent center, alignItems center ] ]
                [ div
                    [ css
                        [ -- TODO: a better width
                          width (px 400)
                        ]
                    ]
                    [ col [ css [ backgroundColor secondary, border3 (px 3) solid black ] ]
                        [ topActions
                        , p [ css [ delaGothicOne, fontSize (px 24), padding (px 16) ] ]
                            [ text
                                (case val.title of
                                    Just t ->
                                        t

                                    Nothing ->
                                        ""
                                )
                            ]
                        , p [ css [ publicSans, padding (px 16) ] ] [ text val.content ]
                        , bottomActions
                        ]
                    ]
                ]
