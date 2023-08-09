module RbtSetTests exposing (..)

-- Author: Amen Zwa, Esq.
-- Copyright 2023 sOnit, Inc.

import Expect
import List exposing (length)
import Set.RbtSet exposing (..)
import Test exposing (..)



-- RbtSet


suite : Test
suite =
    describe "RbtSet module"
        [ test "prohibits insertion of duplicate elements" <|
            \_ ->
                let
                    s =
                        ins 1 empty |> ins 2 |> ins 2 |> ins 3
                in
                Expect.equal (size s) 3
        , test "returns size" <|
            \_ ->
                let
                    n =
                        ins 1 empty |> ins 2 |> ins 3 |> size
                in
                Expect.equal n 3
        , test "checks for emptiness" <|
            \_ ->
                let
                    s =
                        empty
                in
                Expect.equal (isEmpty s) True
        , test "checks for membership" <|
            \_ ->
                let
                    s =
                        ins 1 empty |> ins 2 |> ins 3
                in
                Expect.equal (mbr 2 s) True
        , test "assert depth of node" <|
            -- depth(n) <= 2 * floor(lg(n + 1); see Exercise 3.8 p.25
            \_ ->
                let
                    s =
                        ins 1 empty |> ins 2 |> ins 3

                    n =
                        toFloat (size s)
                in
                Expect.equal ((depth s |> length) <= 2 * (logBase 2.0 (n + 1.0) |> floor)) True
        ]
