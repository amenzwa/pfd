module Heap.SplayHeap exposing (Heap, del, empty, ins, isEmpty, merge, min, size)

{-| Splay Heap

SplayHeap is a heap represented with a splay tree.
Unlike red-black tree, splay tree does not explicitly maintain the balancing information.
SplayHeap is fast, so long as the O(n) merge operation is not called.
See 5.4 Splay Heaps p.46 and Figure 5.5 Implementation of heaps using splay trees p.50.

-}

-- Author: Amen Zwa, Esq.
-- Copyright 2023 sOnit, Inc.


type Heap a
    = E
    | T a (Heap a) (Heap a) -- data : a, l : Heap a, r : Heap a


empty : Heap a
empty =
    E


ins : comparable -> Heap comparable -> Heap comparable
ins x h =
    let
        ( l, r ) =
            part x h
    in
    T x l r


merge : Heap comparable -> Heap comparable -> Heap comparable
merge h i =
    case ( h, i ) of
        ( E, _ ) ->
            i

        ( T x l r, _ ) ->
            let
                ( il, ir ) =
                    part x i
            in
            T x (merge il l) (merge ir r)


min : Heap a -> a
min h =
    case h of
        E ->
            -- force ⊥
            min empty

        T x E _ ->
            x

        T _ l _ ->
            min l


del : Heap a -> Heap a
del h =
    case h of
        E ->
            -- force ⊥
            del empty

        T _ E r ->
            r

        T y (T _ E lr) r ->
            T y lr r

        T y (T x ll lr) r ->
            T x (del ll) (T y lr r)


size : Heap a -> Int
size h =
    case h of
        E ->
            0

        T _ l r ->
            1 + size l + size r


isEmpty : Heap a -> Bool
isEmpty h =
    h == E


part : comparable -> Heap comparable -> ( Heap comparable, Heap comparable )
part p h =
    case ( p, h ) of
        ( _, E ) ->
            ( E, E )

        ( _, T x l r ) ->
            if x <= p then
                case r of
                    E ->
                        ( h, E )

                    T y rl rr ->
                        if y <= p then
                            let
                                ( less, more ) =
                                    part p rr
                            in
                            ( T y (T x l rl) less, more )

                        else
                            let
                                ( less, more ) =
                                    part p rl
                            in
                            ( T x l less, T y more rr )

            else
                case l of
                    E ->
                        ( E, h )

                    T y ll lr ->
                        if y <= p then
                            let
                                ( less, more ) =
                                    part p lr
                            in
                            ( T y ll less, T x more r )

                        else
                            let
                                ( less, more ) =
                                    part p ll
                            in
                            ( less, T y more (T x lr r) )
