# pfd
## *purely functional data structures in Elm*

[TOC]

This project reimplements in Elm the data structures presented in the book [*Purely Functional Data Structures*](https://www.amazon.com/Purely-Functional-Data-Structures-Okasaki/dp/0521663504) by Professor Okasaki (1999). Okasaki first published this material in 1996 in his [PhD dissertation](https://www.cs.cmu.edu/~rwh/students/okasaki.pdf) at CMU. The book provides Standard ML and Haskell implementations.

Every popular algorithm textbook takes an unapologetically imperative stance. It was, and still is, the tradition in Computer Science (CS). For decades, functional programmers had to resort to imperative techniques that update the data structures, in place, thereby clobbering them. This approach is incongruous, inelegant, indiscreet. But it is the standard practice. Indeed, I published an earlier project, called [*CLRS*](https://github.com/amenzwa/clrs), that implements standard, imperative algorithms presented in the well known textbook [*Introduction to Algorithms*](https://www.amazon.com/Introduction-Algorithms-fourth-Thomas-Cormen/dp/026204630X) by Professors Cormen, Leiserson, Rivest, and Stein (CLRS 4ed 2022; formerly CLR 1ed 1990).

Okasaki's monograph, however, is unique; it is the first, and to this day the only one, of its kind. It is a tour de force of functional thinking that draws from the shared mathematical tradition that underlies all branches of CS. If you are a CS student or are starting out in functional programming (FP), this book should be on top of your reading list. Even if you find no use in this project, you should buy that book and read it, cover to cover.

I chose [Elm](https://elm-lang.org), because it is a purely functional language. Elm is designed for web front-end (browser) development work. Its purpose is to eliminate the all-too-common error on the web today: JavaScript's version of the [null pointer](https://en.wikipedia.org/wiki/Null_pointer) problem. Consequently, Elm ended up as a decent FP language with a superb type checker and a wealthy ecosystem. Moreover, Elm is a pleasant language in which to program. Its type checker is singularly effective, especially when refactoring. Type checkers in FP languages treat programmers with a laconic disdain. Elm's type checker, however, encourages programmers to do better, and provides clear, cogent, constructive critiques. This makes Elm a good candidate in which to study FP, perhaps even as the first programming language.

Be that as it may, I view Elm as a pragmatic language in which to teach CS students disciplined web development, after they have learned FP in Haskell, OCaml, or Standard ML. This project could be of use for that purpose. The primary audience of this project, therefore, is the CS students studying FP and data structures. The secondary audience is Elm users who need purely functional data structures.

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

When you study Okasaki's PFD, and indeed any mathematically inclined textbook, read it in at least three passes: scan, dive, and climb.

First, *scan* the chapter. Pick up some key terms and concepts. Take in the figures. Do not worry about understanding every concept you encounter; just collect the key phrases.

Next, reread the chapter, but this time, *dive* deeply. Fill out those terms and concepts you picked up in your initial scan. Do not stop until you have grasped all the concepts presented in the chapter. Typically, the concepts presented in a chapter rely on those presented in the earlier chapters and, sometimes, reference those yet to be presented. If you have not read the earlier chapters, at least read deeply the cited section, and follow it up the citation chain, thoroughly. Once you have thoroughly studied the concepts and the dependant ones, take a break.

Upon your return to studying, review the material once more at a very high level, before moving on to other topics. This *climb* is similar to scan, but this time, you are skimming the cloud tops with a full knowledge of the material; you are no longer wandering and probing about in the dark.

There are two ways to study this monograph. You can read the whole of PFD, cover to cover, before you read the Elm code provided in this project, or read one chapter at a time, studying the Standard ML code in the book, then read the equivalent Elm code given here. Choose the approach that works for you.

I have documented every module with detailed citations to PFD, chapters, figures, page numbers. There are line-comments, too, citing to specific pages form whence the idea or the algorithm came. In the tests, I have included not just API call tests but also tests that check the validity of various properties of the data structures during computation. The sources for these checks are the mathematical properties given in theorems, lemmas, remarks, and exercises in the book.

# CAUTION

## *syntax and semantics*

In CS, we teach FP to undergraduate students, because its semantics serves as a base upon which to construct higher learning. In IT, we use FP, because these languages have cute syntax. Therein lies the dangers.

Object-oriented (OO) languages has been well entrenched in IT since the early 1980s. Objects and business models fit like hand and glove. Then, why did IT folks begin flirting with FP, starting around 2010s?

In the 1980s, IT began adopting OO, en masse, as a means to reign in the 1970s procedural programming (PP) paradigm's laissez-faire attitude toward mutation. OO's obsession with hiding mutations was just the right technique to civilise single-threaded PP programmes of the era. But this characteristic now prevents programmes from being able to exploit the power of cheap, multi-core CPUs. In the 2010s, the industry started looking to shared, immutable data as the necessary ingredient for multi-core exploitation, and OO's hidden mutation is now seen as the bottleneck. FP thus offers the salvation.

[CS academics has been advising the IT industry](https://dl.acm.org/doi/pdf/10.1145/359576.359579) to mature from PP into FP, since the late 1970s, but to no avail. Only now, when the IT industry is drowning in inter-mutating objects, do the practitioners begin to appreciate FP's innate powers. It was not long ago that the industry tried to make a massive shift from OO to FP.

But old habits die hard. Many 1980s PP programmers began transitioning to OO, when C++ arrived on the scene. They all wrote C-style PP semantics code in C++-style OO syntax. C++, a hybrid PP-OO language, was immense popularity, due to it being the superset of C, and because most everyone in IT was then a C coder. C++ did more harm than good to the efforts of those who are trying to embrace OO, because it makes it too easy to fall back on the bad, old PP ways.

Likewise, today's OO programmers are trying to adopt FP, but they keep writing OO semantics code in FP syntax. All popular, new languages that came out since 2010s have been OO-FP hybrids. And using these languages to adopt FP suffers from the same issues of the C-to-C++ transition of the 1980s.

The arrival of Java in the mid 1990s helped complete the transition from PP to OO. Pure FP languages, like Haskell, Agda, Idris—and Elm—offer a disciplined way to transition from OO to FP. But it is plain to see that IT, as a whole, has shunned these paradigmatically pure FP languages, and have clung on to OO-FP hybrids. I do not believe this is an effective way forward.

PP has its value. Most embedded software targeting tiny MCUs are best implemented in plain C. OO has its value. It is impedance matched to small-scale business applications and simulation software. FP has its value. Its mathematical nature and its innate immutability is perfect for scientific and technical computing, which are intensely mathematical and rely on parallel processing. So, be open to all that is available to you. But at the same time, when you are working with FP, shed your OO and PP propensities. Shun `ref`, `for`, `class`, and other indicia of the imperative paradigm, at least while you are learning to think functionally.

When learning a programming language, do not focus on the *syntax*: do not object to it, do not be enthusiastic about it. The purpose of syntax is only to provide programer comfort. The real reason why we write programmes is to convey the *semantics* of the problem being solved to the machine, and more importantly, to other programmers who have to maintain our code. So, learn the language's semantics, idioms, libraries, and local cultural norms. For these reasons, I reject the notion that new language should copy the syntax of established languages. But to each his own.

Do not learn a new language just because everyone else is using it; learn it because it will expand your mind effectively and solve your problems efficiently. On the other hand, an experienced programmer acquainted with all the major paradigms still requires at least a couple of years of sustained use to become proficient in a large, modern language. But one thing is clear. Elm is a tiny language equipped with many tried-and-true FP facilities. It can be learned in a couple of days, and it can be used in JavaScript web applications. You choose your poison.

## *laziness in all its glory*

Most programmers today are aware of the existence of laziness, but they are not familiar with the technical details. This is because all popular modern languages are OO-FP hybrids with a serious leaning toward the imperative. The imperative paradigm does not countenance laziness.

If a language incrementally evaluates expressions only when their values become necessary, and only up to the point to make progress with the current computation, then memoise the computed values for subsequent reuse, the language is said to use the *lazy evaluation* strategy. It is an optimal implementation of the $\lambda$-calculus notion of *normal-order reduction*. Laziness must not be confused with *delayed computation*, which is a computation suspended at the present moment. When the computation is eventually resumed, it monolithically evaluates the entire expression in one go, and the results are not memoised.

So, both lazy evaluation and delayed computation perform the work at some future time. Lazy evaluation proceeds incrementally and caches the results for later reuse, whereas delayed computation does not cache the results and completes the task monolithically.

Languages that use *call-by-value* parameter passing mechanism are said to be eager languages, whereas those that use *call-by-need* parameter passing mechanism are said to be lazy languages. When a function is invoked with call-by-value semantics, it is passed arguments that have been fully evaluated. When a function is invoked with call-by-need semantics, its arguments are passed unevaluated, and they are evaluated only when the function needs them, and only up to a point when those needs have been satisfied. Moreover, the evaluated results are cached by the language, so those computations occur only once. So, a lazy language pays for computational efficiency with extra use of space.

Note that eagerness and laziness are language-wide strategies used in evaluating expressions. But call-by-value and call-by-need apply only in the context of function calls. It just happens so that languages that use eager evaluation strategy also use call-by-value parameter passing and those that use lazy evaluation strategy also use call-by-need parameter passing, because such pairings are natural.

Anyway, I just wanted to clarify the terms, because CS folks tend to bandy about these terms and IT folks tend to conflate them. Now, onward to a more pressing issue.

There is a fundamental conflict between the amortisation algorithmic analysis technique and purely functional data structures. See Chapter 6 p.57. Traditional algorithms analysis is imperative by design. It assumes the ephemeral (mutable) nature of data structures and relies on the mutator being a single thread of computation. But purely function data structures are by nature perennial (immutable), which is also called persistent. Any alteration to an existing data structure produces a new copy thereof. And being read-only data structures, they are designed for simultaneous use by multiple threads of computation. Persistence thus breaks amortisation and invalidates the theoretical performance guarantees attached to amortised data structures. It turns out that lazy evaluation is the necessary mediator that restores peace between these two waring factions. See §6.2.2 p.59.

It is no surprise, then, that more than a third of Okasaki's book is devoted to lazy data structures. But like all modern programming languages, Elm lacks built-in lazy evaluation mechanisms. Indeed, Standard ML does not have built-in lazy evaluation mechanisms either. But there are non-standards-compliant lazy extensions to the language. Okasaki used one such extension to implement the amortised, lazy data structures.

Elm has no lazy extensions at the language level. There was a [built-in Elm lazy facility](https://github.com/elm-lang/lazy), but it has been deprecated as of Elm 0.19.1, the latest version at the start of this project. As is the wont of the Elm community, there is [a revival](https://github.com/eeue56/elm-lazy) of the Elm lazy facility.

I have not decided how best to incorporate laziness into this project, mainly because I have been lazy.

## *features or the lack thereof*

Elm has *parametric polymorphism* in its algebraic data types, but it does not have *ad hoc polymorphism*, neither C++-style function overloading nor Haskell-style type classes. In earlier versions, Elm supported operator overloading, but it was removed in v0.19. Given the narrow scope and small size of this project, however, Elm's lack of ad hoc polymorphism is not an infirmity.

Likewise, Elm 0.19 limits tuples to triples. While this restriction can be justified on philosophical grounds, it is not a practicable choice. It is true that tuples should only be used to represent small product types, like *Complex*, and *Point*. But in FP, pattern matching against tuples is common as clay and, if used judiciously, is a powerful, convenient technique. Clearly, no one should use 10- or 20-tuples. But forcibly limiting it to a triple is unkind.

Another irksome trait of Elm is its lack of the $\bot$ crash facility, as in Standard ML `raise` or Haskell `error`, thus mandating the use of `Result`, everywhere. This, however, makes sense in the front-end context, since the user should never see a crash. But in the education or demonstration back-end context like this project, it is mighty inconvenient. So, to simulate a $\bot$ crash, I force an infinite recursion, thereby inducing a [stack overflow](https://en.wikipedia.org/wiki/Stack_overflow) crash. The absence of a $\bot$ crasher is unfortunate.

Elm's community-standard formatter tends to spread the code out vertically, instead of horizontally. Often, a variable would show up on a line, all by its lonesome. And double-blank lines are injected just about everywhere. Given that computer monitors are wider than they are tall, this indiscriminate use of the vertical real estate is wasteful, and it diminishes the amount of information that the programmer can absorb in one glance. But it is the format upon which the Elm community has settled. They justify it as a means to enable everyone to read anyone else's code. In the days of advanced code formatters, this is one of those weak-kneed arguments proffered by a strong-armed majority. In any case, we play by their rules, on their court. The community prides itself on this and other compliant conduct which, at times, can be unhelpful.

### CORRECTIONS

In the initial release, I made a wrong claim that Elm does not support inner functions. Eniac314 on GitHub pointed out my mistake. To prevent propagating this mistake, I have taken out that erroneous complaint from this document. And have refactored the auxiliary functions in my code to use the inner functions, as suggested by Eniac314.

Another error on my part was to assume that I could induce a $\bot$ by simply inducing an infinite recursion. But as pointed out by Leonardo Taglialegne on GitHub, the Elm complier optimises this tail recursion, thus preventing the intended stack overflow crash. I have followed his suggestion to inject the `identity` call to the left of the infinite recursive call, thereby circumventing the compiler's tail-call optimisation.

# CONCLUSION

Elm's limitations enumerated above amount to mere inconveniences when it is used in a limited way on a small scale, like a class project or a self-study project. And there are adequate workarounds that do not detract from Elm's innate elegance and its suitability to FP studies. I hope young CS students and junior IT practitioners would at least have a glance at Elm. That this generation has access to free, abundant, solid tools, like Elm and other open-source software, is indeed fortunate.

## *sources for courses*

If you intend to study Okasaki's PFD as the source material, you must already have taken at least the introductory courses on discrete structures (mathematics), data structures (imperative), algorithms (imperative), programming languages (all paradigms) and functional programming (declarative).

Indeed, you should study other foundational CS topics—formal languages, computability theory, complexity theory, category theory, compiler theory, etc.—either in a classroom setting or in a bedroom setting. Although these topics are inessential in the practice of modern, mundane IT, they are the indispensable foundations of CS, and your possessing such knowledge will only help, not hurt, your future career, be it in academia or in industry. Here are some of the source materials I recommend:

### THEORY

- [*Discrete Mathematics with Applications*](https://www.amazon.com/Discrete-Mathematics-Applications-Susanna-Epp-ebook/dp/B07M87BWRC?ref_=ast_author_mpb), Epp
- [*Introduction to Algorithms*](https://www.amazon.com/Introduction-Algorithms-fourth-Thomas-Cormen/dp/026204630X/ref=sr_1_5?crid=125FU08JBU5XX&keywords=algorithms&qid=1691778898&sprefix=algorithms%2Caps%2C87&sr=8-5), Cormen
- [*Automata, Formal Languages, and Turing Machines*](https://www.amazon.com/Automata-Formal-Languages-Turing-Machines-ebook/dp/B08K4D7Y7W/ref=sr_1_3?crid=1RD7N391HF2VR&keywords=formal+languages&qid=1691778815&sprefix=formal+languages%2Caps%2C130&sr=8-3), Sermutlu
- [*The P v. NP Problem*](https://web.archive.org/web/20101212035424/http://www.claymath.org/millennium/P_vs_NP/Official_Problem_Description.pdf), Cook
- [*Category Theory for Programmers*](https://github.com/hmemcpy/milewski-ctfp-pdf), Milewski

### PRACTICE

- [*Compilers: Principles, Techniques, and Tools*](https://www.amazon.com/Compilers-Principles-Techniques-Tools-2nd/dp/0321486811), Aho
- [*An Introduction to Functional Programming Through Lambda Calculus*](https://www.amazon.com/Introduction-Functional-Programming-Calculus-Mathematics-ebook/dp/B00CWR4USM/ref=sr_1_2?crid=ICQLIZA1AAHZ&keywords=lambda+calculus&qid=1691779183&s=digital-text&sprefix=lambda+calculus%2Cdigital-text%2C71&sr=1-2), Michaelson
- [*Introduction to Functional Programming*](https://www.amazon.com/Introduction-Functional-Programming-International-1988-03-01/dp/B019TLUARI), Bird
- [*Can Programming Be Liberated from the von Neumann Style? A Functional Style and Its Algebra of Programs*](https://dl.acm.org/doi/pdf/10.1145/359576.359579), Backus
- [*A tutorial on the universality and expressiveness of fold*](https://www.cs.nott.ac.uk/~pszgmh/fold.pdf), Hutton
- [*Why Functional Programming Matters*](https://www.cs.kent.ac.uk/people/staff/dat/miranda/whyfp90.pdf), Hughes
