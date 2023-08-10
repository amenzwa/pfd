module BstSetTests exposing (..)

-- Author: Amen Zwa, Esq.
-- Copyright 2023 sOnit, Inc.

import Expect
import Set.RbtSet exposing (..)
import Test exposing (..)



suite : Test
suite =
    describe "BstSet module"
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
        ]
