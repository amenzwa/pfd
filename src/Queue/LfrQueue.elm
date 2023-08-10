module Queue.LfrQueue exposing (Queue, deq, empty, enq, isEmpty, peek, size)

{-| Front-Rear List Queue

LfrQueue is a FIFO queue represented with a pair of lists, front and rear.
It is one of the fastest queue implementations known.
Invariants:

  - f is [] iff r is []

See 5.2 Queues p.42 and Figure 5.2 A common implementation of purely functional queues p.43.

-}

-- Author: Amen Zwa, Esq.
-- Copyright 2023 sOnit, Inc.

import List exposing (length, reverse)


type alias Queue a =
    -- f : List a, r : List a
    ( List a, List a )


empty : Queue a
empty =
    ( [], [] )


enq : a -> Queue a -> Queue a
enq x ( f, r ) =
    checkf ( f, x :: f )


peek : Queue a -> Maybe a
peek q =
    case q of
        ( [], _ ) ->
            Nothing

        ( x :: _, _ ) ->
            Just x


deq : Queue a -> Queue a
deq q =
    case q of
        ( [], _ ) ->
            -- force ⊥
            deq empty

        ( _ :: f, r ) ->
            checkf ( f, r )


size : Queue a -> Int
size s =
    case s of
        ( [], _ ) ->
            0

        ( f, [] ) ->
            length f

        ( f, r ) ->
            length f + length r


isEmpty : Queue a -> Bool
isEmpty s =
    s == empty


checkf : Queue a -> Queue a
checkf q =
    case q of
        ( [], r ) ->
            ( reverse r, [] )

        _ ->
            q
