# pfd
## *purely functional data structures in Elm*

This project reimplements in Elm the data structures presented in the book [*Purely Functional Data Structures*](https://www.amazon.com/Purely-Functional-Data-Structures-Okasaki/dp/0521663504) by Professor Okasaki (1999). Okasaki first published this material in 1996 in his [PhD dissertation](https://www.cs.cmu.edu/~rwh/students/okasaki.pdf) at CMU. The book provides Standard ML and Haskell implementations.

Every popular algorithm textbook takes an unapologetically imperative stance. It was, and still is, the tradition in Computer Science (CS). For decades, functional programmers had to resort to imperative techniques that update the data structures, in place, thereby clobbering them. This approach is incongruous, inelegant, indiscreet. But it is the standard practice. Indeed, I published an earlier project, called [*CLRS*](https://github.com/amenzwa/clrs), that implements standard, imperative algorithms presented in the well known textbook [*Introduction to Algorithms*](https://www.amazon.com/Introduction-Algorithms-fourth-Thomas-Cormen/dp/026204630X) by Professors Cormen, Leiserson, Rivest, and Stein (CLRS 4ed 2022; formerly CLR 1ed 1990).

Okasaki's work, however, is unique; it is the first, and to this day the only one, of its kind. It is a tour de force of functional thinking that draws from the shared mathematical tradition that underlies all branches of CS. If you are a CS student or are starting out in functional programming (FP), this book should be on top of your reading list. Even if you find no use in this project, you should buy that book and read it, cover to cover.

I chose [Elm](https://elm-lang.org), because it is a purely functional language. Elm is designed for web front-end (browser) development work. Its purpose is to eliminate the all-too-common error on the web today: JavaScript's version of the [null pointer](https://en.wikipedia.org/wiki/Null_pointer) problem. Consequently, Elm ended up as a decent FP language with a superb type checker and a wealthy ecosystem. Moreover, Elm is a pleasant language in which to program. Its type checker is singularly effective, especially when refactoring. Type checkers in FP languages treat programmers with a laconic disdain. Elm's type checker, however, encourages programmers to do better, and provides clear, cogent, constructive critiques. This makes Elm a good candidate in which to study FP, perhaps even as the first programming language.

Be that as it may, I view Elm as a pragmatic language in which to teach CS students disciplined web development, after they have learned FP in Haskell, OCaml, or Standard ML. This project could be of use for that purpose.

Officially, Elm will not support back-end (server) development work. But there are [several community projects](https://discourse.elm-lang.org/t/how-to-write-backend-in-elm/4419) to remedy this "front-end" debility. There is also [Elchemy](https://wende.github.io/elchemy/), which is Elm for the [Erlang BEAM](https://www.erlang.org/blog/a-brief-beam-primer/), a VM with performance and resilience that had been honed over the past four decades in the telecommunications industry.

I could have used [PureScript](https://www.purescript.org), another purely functional web development language that is used for both front-end and back-end work. But PureScript is just a Webskell. So, Okasaki's original Haskell implementation could readily be adapted to PureScript, perhaps even through automation. And it would be just as pointless for me to use [OCaml](https://ocaml.org), another great FP language with long-established reputation. But OCaml is just ML with objects, so Okasaki's Standard ML implementation can be adapted to OCaml with minor syntactic tweaks.

Lastly, this is an ongoing project. The initial commit, in mid 2023, includes a few traditional data structures, like binary search tree, sets, stacks, heaps, and the like, but in their pure functional form, along with the tests. The code, as well this document, will eventually contain detailed commentaries that further explanation some of the trickier concepts and techniques in the book.

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

# ORGANISATION

The Elm implementations are organised as follows under the `~/pdf/src/` source directory:

- `Heap`
  - `BinoHeap.elm`—3.2 Binomial Heaps p.20
    - `BinoHeap` is a heap represented with a binomial tree. A binomial tree is defined as follows: a binomial tree of rank $0$ is a single node; a binomial tree of rank $r + 1$ is formed by linking two binomial trees of rank $r$, making one tree the left-most child of the other.
  - `LeftHeap.elm`—3.1 Leftist Heaps p.17
    - `LeftHeap` is a heap-ordered binary tree that satisfied the *leftist property*: the rank of any left child is at least as large as the rank of its right sibling.
  - `PairHeap.elm`—5.5 Pairing Heaps p.52
    - `PairHeap` is a pairing heap. It is named after the pair-wise merging of the subtrees during the delete operation.
  - `SplayHeap.elm`—5.4 Splay Heaps p.46
    - `SplayHeap` is a heap represented with a splay tree.
- `Queue`
  - `LfrQueue.elm`—5.2 Queues p.42
    - `LfrQueue` is a FIFO queue represented with a pair of lists, front and rear.
- `Set`
  - `BstSet.elm`—2.2 Binary Search Trees p.11
    - `BstSet` is a set represented with an ordinary binary search tree.
  - `RbtSet.elm`—3.3 Red-Black Trees p.24
    - `RbtSet` is a set represented with a red-black tree, a type of balanced binary search tree.
- `Stack`
  - `LStack.elm`—2.1 Lists p.7
    - `LStack` is a LIFO stack represented with the Elm built-in list.

# STUDY

When you study Okasaki's PFD, and indeed any mathematical inclined textbook, read it in at least three passes: scan, dive, and climb.

First, *scan* the chapter. Pick up some key terms and concepts. Take in the figures. Do not worry about understanding every concept you encounter; just collect the key phrases.

Next, reread the chapter, but this time, *dive* deeply. Fill out those terms and concepts you picked up in your initial scan. Do not stop until you have grasped all the concepts presented in the chapter. Typically, the concepts presented in a chapter rely on those presented in the earlier chapters and, sometimes, reference those yet to be presented. If you have not read the earlier chapters, at least read deeply the cited section, and follow it up the citation chain, thoroughly. Once you have thoroughly studied the concepts and the dependant ones, take a break.

Upon your return to studying, review the material once more at a very high level, before moving on to other topics. This *climb* is similar to scan, but this time, you are skimming the cloud tops with a full knowledge of the material; you are no longer wandering and probing about in the dark.

There are possible paths of study. You can read the whole of PFD, cover to cover, before you read the Elm code provided in this project, or read one chapter at a time, studying the Standard ML code in the book, then read the equivalent Elm code given here. Choose the approach that works for you.

I have documented every module with detailed citations to PFD, chapters, figures, page numbers. There are line-comments, too, citing to specific pages form whence the idea or the algorithm came. In the tests, I have included not just API call tests but also tests that check the validity of various properties of the data structures during computation. The sources for these checks are the mathematical properties given in proofs, remarks, and exercises in the book.

# CAUTION

Given Elm's front-end focus, it is not without shortcomings, when misused, as it were, in the back-end context, as we do here in this project.

For instance, Elm limits tuples to triples. While this restriction can be justified on philosophical grounds, it is not a practicable choice. It is true that tuples should only be used to represent small product types, like *Complex*, and *Point*. But in FP, pattern matching against tuples is common as clay and, if used judiciously, is a powerful, convenient technique. Clearly, no one should use 10- or 20-tuples. But forcibly limiting it to a triple is unkind.

And Elm does not allow inner (nested) functions. Again, this is an oft-used technique in FP. It is used to avoid polluting the top-level namespace with tonnes of little utility functions that are used only in one function. The lack of inner functions is unwholesome.

Another irksome trait of Elm is its lack of the $\bot$ crash facility, as in Standard ML `raise` or Haskell `error`, thus mandating the use of `Result`, everywhere. This, however, makes sense in the front-end context, since the user should never see a crash. But in the education or demonstration back-context like this project, it is mighty inconvenient. So, to simulate a $\bot$ crash, I force an infinite recursion, thereby inducing a [stack overflow](https://en.wikipedia.org/wiki/Stack_overflow) crash. The absence of a $\bot$ crasher is unhelpful.

Elm's community-standard formatter tends to spread the code out vertically, instead of horizontally. Often, a variable would show up on a line, all by its lonesome. But it is the format upon which the Elm community has settled. They justify it as a means to enable everyone to read anyone else's code. This is one of those weak-kneed arguments clung to by every strong-arm majority. In any case, we play by their rules, on their court. The community prides itself on this and other intolerant conduct, which is unfortunate.

But these amount to mere inconveniences, and there are workarounds that do not detract from Elm's innate elegance. I hope young CS students and IT practitioners would at least give Elm a chance. It can expand their perspectives. That this generation has free access to solid tools, like Elm and other open-source software, is indeed fortunate.
