module Heap.LeftHeap exposing (Heap, del, empty, ins, isEmpty, merge, min, rSpine, size)

{-| Leftist Heap

LeftHeap is a heap-ordered binary tree that satisfies the leftist property: rank l >= rank r.
See 3.1 Leftist Heaps p.17 and Figure 3.2 Leftist heaps p.20.

-}

-- Author: Amen Zwa, Esq.
-- Copyright 2023 sOnit, Inc.


type Heap a
    = E
    | T Int a (Heap a) (Heap a) -- rank : Int, data : a, l : Heap a, r : Heap a


empty : Heap a
empty =
    E


ins : comparable -> Heap comparable -> Heap comparable
ins x h =
    merge (T 1 x E E) h


merge : Heap comparable -> Heap comparable -> Heap comparable
merge h i =
    case ( h, i ) of
        ( _, E ) ->
            h

        ( E, _ ) ->
            i

        ( (T _ x hl hr) as ht, (T _ y il ir) as it ) ->
            let
                rank h_ =
                    case h_ of
                        E ->
                            0

                        T r _ _ _ ->
                            r

                makeT x_ l r =
                    if rank l >= rank r then
                        -- ensure leftist property
                        T (rank r + 1) x_ l r

                    else
                        T (rank l + 1) x_ r l
            in
            if x <= y then
                makeT x hl (merge hr it)

            else
                makeT y il (merge ht ir)


min : Heap a -> Maybe a
min h =
    case h of
        E ->
            Nothing

        T _ x _ _ ->
            Just x


del : Heap comparable -> Result String (Heap comparable)
del h =
    case h of
        E ->
            Err "heap is empty"

        T _ _ l r ->
            Ok (merge l r)


size : Heap a -> Int
size h =
    case h of
        E ->
            0

        T _ _ l r ->
            1 + size l + size r


isEmpty : Heap a -> Bool
isEmpty h =
    h == E


rSpine : Heap a -> List a
rSpine h =
    -- See p.18 for the definition of the right spine.
    case h of
        E ->
            []

        T _ x _ r ->
            x :: rSpine r
