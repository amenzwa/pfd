# pfd
## *purely functional data structures in Elm*

This project reimplements in Elm the data structures presented in the book [*Purely Functional Data Structures*](https://www.amazon.com/Purely-Functional-Data-Structures-Okasaki/dp/0521663504) by Professor Okasaki (1999). Okasaki first published this material in 1996 in his PhD dissertation at CMU. The book provides Standard ML and Haskell implementations. Whether you use this project or not, get that book and read it, cover to cover.

Every popular algorithm textbook takes an unapologetically imperative stance. It was, and still is, the tradition in Computer Science (CS). For decades, functional programmers had to resort to imperative techniques that update the data structures, in place, thereby clobbering them. This approach is inelegant, indiscreet, inappropriate. Okasaki's work is the first, and to this day the only one, of its kind. It is a tour de force of functional thinking that draws upon a long mathematical tradition in CS. If you are a CS student or are starting out in functional programming (FP), this book should be on top of your reading list.

I chose [Elm](https://elm-lang.org), because it is a purely functional language. Elm is designed for web front-end (browser) development work. Its purpose is to eliminate the all-too-common error on the web, JavaScript's version of the "null pointer". Consequently, Elm ended up as a decent FP language with a superb type checker and a wealthy ecosystem. Moreover, Elm is a pleasant language in which to program, especially its type checker. The type checkers in most FP languages treat programmers with laconic disdain. Elm, however, encourages programmers to do better, and provides clear, cogent, courteous suggestions. This makes it a good candidate for those studying FP as their first FP language. I view Elm as a pragmatic language in which to teach CS students disciplined web development, after they have learned FP in Haskell, OCaml, or Standard ML. This project could be of use in that context.

Officially, Elm will not support back-end (server) development work. But there are [several community projects](https://discourse.elm-lang.org/t/how-to-write-backend-in-elm/4419) to remedy this "front-end" debility. There is also [Elchemy](https://wende.github.io/elchemy/), which is Elm for the [Erlang BEAM](https://www.erlang.org/blog/a-brief-beam-primer/), a VM with performance and resilience that had been honed over the past four decades in the telecommunications industry.

I could have used [PureScript](https://www.purescript.org), another purely functional web development language that is used for both front-end and back-end work. But PureScript is just a Webskell. So, Okasaki's original Haskell implementation could readily be adapted to PureScript, perhaps even through automation. And it would be just as pointless for me to use [OCaml](https://ocaml.org), another great FP language with long-established reputation. But OCaml is just ML with objects, so Okasaki's Standard ML implementation can be adapted to OCaml with minor syntactic tweaks.

Given Elm's primary purpose, it is not without shortcomings. For instance, it limits tuples to triples, and it does not allow inner (nested) functions. But these inconveniences are minor, and there are straightforward workarounds that do not detract from Elm's innate elegance.

# INSTALLATION

First, install Elm by following the official [installation instructions](https://guide.elm-lang.org/install/elm.html). And because Elm is technically a web framework, we need to install Node. The easiest way to install Node is through NPM. So, follow the official [installation instructions](https://docs.npmjs.com/downloading-and-installing-node-js-and-npm) for NPM. Also install VSCode, again by following the official [installation guidelines](https://code.visualstudio.com/docs/setup/setup-overview), along with the [*Elm tooling*](https://marketplace.visualstudio.com/items?itemName=Elmtooling.elm-ls-vscode) VSCode plugin. Do not use the older *Elm Language Support* plugin.

Next, type in the following commands at a terminal in a directory under which you wish to clone this project. On macOS, we could go to `~/Documents/`.

```bash
$ cd ~/Documents
$ git clone git@github.com:amenzwa/pfd.git
```

Although the Elm compiler cannot produce a terminal-friendly, command-line application, we have something that suits our purpose well: the `elm-test` framework. We install it as follows, after having installed Elm and NPM.

```bash
$ cd ~/Documents/pfd
$ npm install -g elm-test elm-format elm-review
```

The above command installs `elm-review` that helps improve your Elm code and `elm-format` that formats your Elm code in accordance with the strict, community standards. After you have modified a piece of Elm code, always reformat either using VSCode or `elm-format` from a terminal.

Once all those bits have been installed, we can run the PFD tests, from the top directory of the project.

```bash
$ elm-test
```

