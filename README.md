# pfd
## *purely functional data structures in Elm*

This project reimplements in Elm the data structures presented in the book "Purely Functional Data Structures" by Professor Okasaki (1999). Okasaki first published this material in 1996 in his PhD dissertation at CMU. The book provides Standard ML and Haskell implementations.

Every popular algorithm textbook takes an unapologetically imperative stance. It was, and still is, the tradition in Computer Science (CS). For decades, functional programmers had to resort to imperative techniques that update the data structures, in place, thereby clobbering them. This approach is inelegant, indiscreet, inappropriate. Okasaki's work is the first, and to this day the only one, of its kind. It is a tour de force of functional thinking that draws upon a long mathematical tradition in CS. If you are a CS student or are starting out in functional programming (FP), this book should be on top of your reading list.

I chose [Elm](https://elm-lang.org), because it is a purely functional language. Elm is designed for web front-end (browser) development work. Its purpose is to eliminate the all-too-common error on the web, JavaScript's version of the "null pointer". Consequently, Elm ended up as a decent FP language with a superb type checker and a wealthy ecosystem. Moreover, Elm is a pleasant language in which to program, especially its type checker. The type checkers in most FP languages treat programmers with laconic disdain. Elm, however, encourages programmers to do better, and provides clear, cogent, courteous suggestions. This makes it a good candidate for those studying FP as their first FP language. I view Elm as a pragmatic language in which to teach CS students disciplined web development, after they have learned FP in Haskell, OCaml, or Standard ML. This project could be of use in that context.

Officially, Elm will not support back-end (server) development work. But there are [several community projects](https://discourse.elm-lang.org/t/how-to-write-backend-in-elm/4419) to remedy this "front-end" debility. There is also [Elchemy](https://wende.github.io/elchemy/), which is Elm for the [Erlang BEAM](https://www.erlang.org/blog/a-brief-beam-primer/), a VM with performance and resilience that had been honed over the past four decades in the telecommunications industry.

I could have used [PureScript](https://www.purescript.org), another purely functional web development language that is used for both front-end and back-end work. But PureScript is just a Webskell. So, Okasaki's original Haskell implementation could readily be adapted to PureScript, perhaps even through automation. And it would be just as pointless for me to use [OCaml](https://ocaml.org), another great FP language with long-established reputation. But OCaml is just ML with objects, so Okasaki's Standard ML implementation can be adapted to OCaml with minor syntactic tweaks.

Given Elm's primary purpose, it is not without shortcomings. For instance, it limits tuples to triples, and it does not allow inner (nested) functions. But these inconveniences are minor, and there are straightforward workarounds that do not detract from Elm's innate elegance.
