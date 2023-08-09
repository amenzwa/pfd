module Stack.LStack exposing (Stack, empty, isEmpty, peek, pop, push, size)

{-| List Stack

LStack is a LIFO stack represented by a list.
See Figure 2.2 Implementation of stacks using the built-in type of lists p.8.

-}

-- Author: Amen Zwa, Esq.
-- Copyright 2023 sOnit, Inc.

import List exposing (..)


type alias Stack a =
    List a


empty : Stack a
empty =
    []


push : a -> Stack a -> Stack a
push x s =
    x :: s


peek : Stack a -> Maybe a
peek s =
    case s of
        [] ->
            Nothing

        x :: _ ->
            Just x


pop : Stack a -> Result String (Stack a)
pop s =
    case s of
        [] ->
            Err "stack is empty"

        _ :: xs ->
            Ok xs


size : Stack a -> Int
size =
    length


isEmpty : Stack a -> Bool
isEmpty s =
    s == []
