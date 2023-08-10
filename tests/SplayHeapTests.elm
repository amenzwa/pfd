module SplayHeapTests exposing (..)

-- Author: Amen Zwa, Esq.
-- Copyright 2023 sOnit, Inc.

import Expect
import Heap.SplayHeap exposing (..)
import Test exposing (..)



-- BinoHeap


suite : Test
suite =
    describe "BinoHeap module"
        [ test "inserts elements" <|
            \_ ->
                let
                    h =
                        ins 7 empty |> ins 3 |> ins 6 |> ins 0 |> ins 8 |> ins 4 |> ins 2 |> ins 1 |> ins 5 |> ins 9
                in
                Expect.equal (size h) 10
        , test "merges two heaps" <|
            \_ ->
                let
                    h =
                        ins 7 empty |> ins 3 |> ins 6 |> ins 0 |> ins 8

                    i =
                        ins 4 empty |> ins 2 |> ins 1 |> ins 5 |> ins 9

                    hi =
                        merge h i
                in
                Expect.equal (size hi) 10
        , test "finds the minimum element" <|
            \_ ->
                let
                    h =
                        ins 7 empty |> ins 3 |> ins 6 |> ins 0 |> ins 8 |> ins 4 |> ins 2 |> ins 1 |> ins 5 |> ins 9
                in
                Expect.equal (Heap.SplayHeap.min h) 0
        , test "deletes the minimum element" <|
            \_ ->
                let
                    h =
                        ins 7 empty |> ins 3 |> ins 6 |> ins 0 |> ins 8 |> ins 4 |> ins 2 |> ins 1 |> ins 5 |> ins 9

                    i =
                        del h
                in
                Expect.equal (size i == size h) False
        , test "returns size" <|
            \_ ->
                let
                    n =
                        ins 7 empty |> ins 3 |> ins 6 |> ins 0 |> ins 8 |> ins 4 |> ins 2 |> ins 1 |> ins 5 |> ins 9 |> size
                in
                Expect.equal n 10
        , test "checks for emptiness" <|
            \_ ->
                let
                    h =
                        empty
                in
                Expect.equal (isEmpty h) True
        ]
