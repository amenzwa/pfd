module Set.RbtSet exposing (Set, depth, empty, ins, isEmpty, mbr, size)

{-| Red-Black Tree Set

RbtSet is a set represented with a red-black tree.
A red-black tree is a balanced binary search tree that guarantees O(lg n) time for all operations.
See 3.3 Red-Black Trees p.24 and Figure 3.6 Red-black trees p.28.

-}

-- Author: Amen Zwa, Esq.
-- Copyright 2023 sOnit, Inc.

import List exposing (concat)


type Color
    = Red
    | Blk


type Set a
    = E
    | T Color a (Set a) (Set a) -- color: Color, data : a, l : Set a, r : Set a


empty : Set a
empty =
    E


mbr : comparable -> Set comparable -> Bool
mbr x s =
    case s of
        E ->
            False

        T _ y l r ->
            if x == y then
                True

            else if x < y then
                mbr x l

            else
                mbr x r


ins : comparable -> Set comparable -> Set comparable
ins x s =
    case insTree x s of
        E ->
            -- impossible case; force ⊥
            ins x s

        T _ y l r ->
            -- force root to be Black; see p.26
            T Blk y l r


size : Set a -> Int
size s =
    case s of
        E ->
            0

        T _ _ l r ->
            1 + size l + size r


isEmpty : Set a -> Bool
isEmpty s =
    s == E


depth : Set a -> List a
depth s =
    case s of
        E ->
            []

        T _ x l r ->
            x :: concat [ depth l, depth r ]


insTree : comparable -> Set comparable -> Set comparable
insTree x t =
    -- Elm has no nested functions, so place this function at the top level
    case t of
        E ->
            -- color new tree Red; see p.25
            T Red x E E

        (T c y l r) as s ->
            if x == y then
                s

            else if x < y then
                balance c y (ins x l) r

            else
                balance c y l (ins x r)


balance : Color -> a -> Set a -> Set a -> Set a
balance color data left right =
    case ( color, data, ( left, right ) ) of
        -- Elm tuples are limited to 3 elements
        ( Blk, z, ( T Red y (T Red x a b) c, d ) ) ->
            T Red y (T Blk x a b) (T Blk z c d)

        ( Blk, z, ( T Red x a (T Red y b c), d ) ) ->
            T Red y (T Blk x a b) (T Blk z c d)

        ( Blk, x, ( a, T Red z (T Red y b c) d ) ) ->
            T Red y (T Blk x a b) (T Blk z c d)

        ( Blk, x, ( a, T Red y b (T Red z c d) ) ) ->
            T Red y (T Blk x a b) (T Blk z c d)

        _ ->
            T color data left right
