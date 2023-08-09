module Heap.BinoHeap exposing (Heap, del, empty, ins, isEmpty, merge, min, size)

{-| Binomial Heap

BinoHeap is a collection, represented by a list, of heap-ordered binomial trees
in which no two trees have the same rank.
See 3.2 Binomial Heaps p.20 and Figure 3.4 Binomial heaps p.24.

A binomial tree is defined by rank:

  - rank 0: singleton node
  - rank r + 1: a pair of binomial trees of rank r linked by making one tree the leftmost child of the other
    Figure 3.3 Binomial trees of ranks 0-3 p.21.

-}

import List exposing (foldl, reverse)



-- Author: Amen Zwa, Esq.
-- Copyright 2023 sOnit, Inc.


type Tree a
    = Node Int a (Heap a) -- rank : Int, data : a, collection : Heap a


type alias Heap a =
    List (Tree a)


empty : Heap a
empty =
    []


ins : comparable -> Heap comparable -> Heap comparable
ins x h =
    insTree (Node 0 x []) h


merge : List (Tree comparable) -> List (Tree comparable) -> List (Tree comparable)
merge h i =
    case ( h, i ) of
        ( _, [] ) ->
            h

        ( [], _ ) ->
            i

        ( (t :: ts) as ht, (u :: us) as it ) ->
            if rank t < rank u then
                t :: merge ts it

            else if rank u < rank t then
                u :: merge h us

            else
                insTree (link t u) (merge ts us)


min : Heap comparable -> comparable
min h =
    let
        ( t, _ ) =
            rmMinTree h
    in
    root t


del : Heap comparable -> List (Tree comparable)
del h =
    let
        ( Node _ _ ts, us ) =
            rmMinTree h
    in
    merge (reverse ts) us


size : Heap a -> Int
size =
    foldl (\(Node _ _ c) acc -> acc + 1 + size c) 0


isEmpty : Heap a -> Bool
isEmpty h =
    h == []


rank : Tree a -> Int
rank (Node r _ _) =
    r


root : Tree a -> a
root (Node _ x _) =
    x


link : Tree comparable -> Tree comparable -> Tree comparable
link ((Node r x tc) as t) ((Node _ y uc) as u) =
    if x <= y then
        Node (r + 1) x (u :: tc)

    else
        Node (r + 1) y (t :: uc)


insTree : Tree comparable -> Heap comparable -> Heap comparable
insTree t h =
    case h of
        [] ->
            [ t ]

        (u :: i) as ts ->
            if rank t < rank u then
                t :: ts

            else
                insTree (link t u) i


rmMinTree : Heap comparable -> ( Tree comparable, Heap comparable )
rmMinTree h =
    case h of
        [] ->
            -- unhandled case; force ⊥ to avoid having to return Result
            rmMinTree []

        [ t ] ->
            ( t, [] )

        t :: ts ->
            let
                ( u, us ) =
                    rmMinTree ts
            in
            if root t <= root u then
                ( t, ts )

            else
                ( u, t :: us )