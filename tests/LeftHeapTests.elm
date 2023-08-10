module LeftHeapTests exposing (..)

-- Author: Amen Zwa, Esq.
-- Copyright 2023 sOnit, Inc.

import Expect
import Heap.LeftHeap exposing (..)
import List exposing (length)
import Test exposing (..)



suite : Test
suite =
    describe "LeftHeap module"
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
                case Heap.LeftHeap.min h of
                    Nothing ->
                        Expect.equal 0 -1

                    Just x ->
                        Expect.equal x 0
        , test "deletes the minimum element" <|
            \_ ->
                case ins 7 empty |> ins 3 |> ins 6 |> ins 0 |> ins 8 |> ins 4 |> ins 2 |> ins 1 |> ins 5 |> ins 9 |> del of
                    Err _ ->
                        Expect.equal 0 -1

                    Ok h ->
                        Expect.equal (size h) 9
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
        , test "assert right spine length" <|
            -- rSpine(h) <= floor(lg(n + 1)); see Exercise 3.1 p.18
            \_ ->
                let
                    h =
                        ins 7 empty |> ins 3 |> ins 6 |> ins 0 |> ins 8 |> ins 4 |> ins 2 |> ins 1 |> ins 5 |> ins 9

                    n =
                        toFloat (size h)
                in
                Expect.equal ((rSpine h |> length) <= (logBase 2.0 (n + 1.0) |> floor)) True
        ]
