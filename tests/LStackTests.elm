module LStackTests exposing (..)

-- Author: Amen Zwa, Esq.
-- Copyright 2023 sOnit, Inc.

import Expect
import Stack.LStack exposing (..)
import Test exposing (..)



-- LStack


suite : Test
suite =
    describe "LStack module"
        [ test "pushes elements onto the stack" <|
            \_ ->
                let
                    s =
                        push 0 empty |> push 1 |> push 2
                in
                Expect.equal (size s) 3
        , test "peeks the next element to be popped" <|
            \_ ->
                case push 0 empty |> push 1 |> push 2 |> peek of
                    Nothing ->
                        Expect.equal 0 -1

                    Just x ->
                        Expect.equal x 2
        , test "pops the last element off the stack" <|
            \_ ->
                case push 0 empty |> push 1 |> push 2 |> pop of
                    Err _ ->
                        Expect.equal 0 -1

                    Ok s ->
                        Expect.equal (size s) 2
        , test "returns size" <|
            \_ ->
                let
                    n =
                        push 0 empty |> push 1 |> push 2 |> size
                in
                Expect.equal n 3
        , test "checks for emptiness" <|
            \_ ->
                let
                    s =
                        empty
                in
                Expect.equal (isEmpty s) True
        ]
