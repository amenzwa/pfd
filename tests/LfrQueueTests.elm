module LfrQueueTests exposing (..)

-- Author: Amen Zwa, Esq.
-- Copyright 2023 sOnit, Inc.

import Expect
import Queue.LfrQueue exposing (..)
import Test exposing (..)



-- LfrQeueue


suite : Test
suite =
    describe "LfrQeueue module"
        [ test "enqueues elements" <|
            \_ ->
                let
                    s =
                        enq 1 empty |> enq 2 |> enq 3
                in
                Expect.equal (size s) 3
        , test "peeks the next element to be dequeued" <|
            \_ ->
                case enq 1 empty |> enq 2 |> enq 3 |> peek of
                    Nothing ->
                        -- impossible case; force failure
                        Expect.equal 0 -1

                    Just x ->
                        Expect.equal x 1
        , test "dequeues the first-enqueued element" <|
            \_ ->
                let
                    s =
                        enq 1 empty |> enq 2 |> enq 3 |> deq
                in
                Expect.equal (size s) 2
        , test "returns size" <|
            \_ ->
                let
                    n =
                        enq 1 empty |> enq 2 |> enq 3 |> size
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
