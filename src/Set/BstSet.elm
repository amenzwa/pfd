module Set.BstSet exposing (Set, empty, ins, isEmpty, mbr, size)

{-| Binary Search Tree Set

BstSet is a set represented with a binary search tree.
See 2.2 Binary Search Trees p.11 and Figure 2.9 Implementations of binary search trees as a Standard ML functor p.14.

-}

-- Author: Amen Zwa, Esq.
-- Copyright 2023 sOnit, Inc.


type Set a
    = E
    | T a (Set a) (Set a) -- data : a, l : Set a, r : Set a


empty : Set a
empty =
    E


mbr : comparable -> Set comparable -> Bool
mbr x s =
    case s of
        E ->
            False

        T y l r ->
            if x == y then
                True

            else if x < y then
                mbr x l

            else
                mbr x r


ins : comparable -> Set comparable -> Set comparable
ins x s =
    case s of
        E ->
            T x E E

        T y l r ->
            if x == y then
                -- prohibit duplicate elements
                s

            else if x < y then
                T y (ins x l) r

            else
                T y l (ins x r)


size : Set a -> Int
size s =
    case s of
        E ->
            0

        T _ l r ->
            1 + size l + size r


isEmpty : Set a -> Bool
isEmpty s =
    s == E
