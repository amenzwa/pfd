module Heap.PairHeap exposing (Heap, del, empty, ins, isEmpty, merge, min, size)

{-| Pairing Heap

PairHeap is a heap-ordered multi-way tree.
PairHeap is almost as fast as SplayHeap when the merge operation is not used,
and is much faster if the merge operation is used.
See 5.5 Paring Heaps p.52 and Figure 5.6 Pairing heaps p.54.

-}

-- Author: Amen Zwa, Esq.
-- Copyright 2023 sOnit, Inc.

import List exposing (foldl)


type Heap a
    = E
    | T a (List (Heap a)) -- data : a, multiway : List (Heap a)


empty : Heap a
empty =
    E


ins : comparable -> Heap comparable -> Heap comparable
ins x h =
    merge (T x []) h


merge : Heap comparable -> Heap comparable -> Heap comparable
merge h i =
    case ( h, i ) of
        ( _, E ) ->
            h

        ( E, _ ) ->
            i

        ( (T x t) as l, (T y u) as r ) ->
            if x <= y then
                T x (r :: t)

            else
                T y (l :: u)


min : Heap a -> a
min h =
    case h of
        E ->
            -- induce ⊥
            identity min empty

        T x _ ->
            x


del : Heap comparable -> Heap comparable
del h =
    case h of
        E ->
            -- induce ⊥
            identity del empty

        T _ t ->
            let
                mergePair h_ =
                    case h_ of
                        [] ->
                            E

                        [ t_ ] ->
                            t_

                        t_ :: u :: v ->
                            merge (merge t_ u) (mergePair v)
            in
            mergePair t


size : Heap a -> Int
size h =
    case h of
        E ->
            0

        T _ t ->
            1 + foldl (\u acc -> acc + size u) 0 t


isEmpty : Heap a -> Bool
isEmpty h =
    h == E
