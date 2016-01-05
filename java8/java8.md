Java 8 resources
===========

The best tutorial I've found so far is the repo at https://github.com/winterbe/java8-tutorial


Streams and Lambda expressions are pretty cool new features in Java 8.  Time to learn all of the available methods in the [Stream interface](http://docs.oracle.com/javase/8/docs/api/java/util/stream/Stream.html "Official Stream documentation")!

Including:
* count()
* distinct()
* filter(Predicate<? super T> predicate)
* flatMap(Function<? super T,? extends Stream<? extends R>> mapper)
* forEach(Consumer<? super T> action)
* map(Function<? super T,? extends R> mapper)
* reduce(BinaryOperator<T> accumulator)

Oracle has a bunch of great starter articles on the [Oracle Tech Network](http://www.oracle.com/technetwork/articles/java/index.html "Articles About Java Technology")

Some useful ones include:
* [Processing Data with Java SE 8 Streams, Part 1](http://www.oracle.com/technetwork/articles/java/ma14-java-se-8-streams-2177646.html)
* [Processing Data with Java SE 8 Streams, Part 2](http://www.oracle.com/technetwork/articles/java/architect-streams-pt2-2227132.html)
* [Lambda expressions quick-start guide](http://www.oracle.com/webfolder/technetwork/tutorials/obe/java/Lambda-QuickStart/index.html#)
* [Mary Had a Little Lambda](http://www.oracle.com/technetwork/articles/java/rich-client-lambdas-2227138.html)

Other sites with various examples include:
* [10 examples of lambda expressions](http://javarevisited.blogspot.sg/2014/02/10-example-of-lambda-expressions-in-java8.html)
* [Replace loops with streams](http://www.deadcoderising.com/java-8-no-more-loops/)
* [Maurice Naftalin's Lambda FAQ](http://www.lambdafaq.org/) - All about Lambdas and friends

Also the [Basic Java tutorials](https://docs.oracle.com/javase/tutorial/index.html "Oracle's Java Tutorial index") are always useful.  Commit it all to memory!

### Books to Read
* https://www.manning.com/books/java-8-in-action
* http://shop.oreilly.com/product/9781783558483.do
* http://www.amazon.com/Mastering-Lambdas-Programming-Multicore-Oracle/dp/0071829628
