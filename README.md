# Enumerator is an Enumerable 💃

Examples from the talk I gave in RUG::B (Ruby Users Group Berlin) July 2015. There was a camera so I guess there will be a video at some point, I'll add it here.

Browse the examples in the `examples/` directory. You can also download and run them, they all work.

## Slides

Here are the slides, in case they are useful.

[![Slides](https://speakerd.s3.amazonaws.com/presentations/c6d36f8ae98a423684adb58518f029ea/slide_1.jpg)](https://speakerdeck.com/porras/enumerator-is-an-enumerable)

## The GIF

The animated gif with Nadine Angerer and Jennifer Cramer was ruined by the export so here it is:

![Don't leave me hanging, Nadine Angerer](http://cl.ly/image/2z2G0o0u1833/adpYN6Q_460sv.gif)

## The No-Enumerator Edition

In case you were wondering what's possible with `Enumerator` that is not possible with `#each` (see the latest slides), the answer is nothing. In this branch, the following examples are rewritten *without* `Enumerator`:

* Fibonacci
* Clock
* Mixtape
