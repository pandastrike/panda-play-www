# Play

Play is a lightweight library for building native Web Components. You can use it
to build modern user interfaces in your web apps.

## Gadgets

At the core of Play are **Gadgets**.

Gadgets are fully encapsulated Web Components. You create a Gadget by composing
the base `Gadget` class with any number of **mixins** that add behavior and
features. This compositional approach allows a great deal of flexibility. 

Play comes with several mixins baked in but you can also create your own.

Here's an example in CoffeeScript (*[why CoffeeScript?][why_coffeescript]*) of composing a new Gadget that will render
the obligatory "Hello, World!":

[why_coffeescript]:https://www.pandastrike.com/posts/20150203-youre-welcome-javascript/

```coffee
import {Gadget, bebop, shadow, template, events} from "panda-play"

class extends Gadget

  mixin @, [

    tag "x-greeting"

    # bebop preset gives us VDOM + automatic rendering
    # shadow give us Shadow DOM support
    bebop, shadow

    template ({value}) -> "<h1>#{value}, World!</h1>"

    events
      h1:
        click: ({target}) -> @value = "Goodbye"

  ]
```

## Mixins

Mixins are functions that take a `type` (a class that extends the base `Gadget`
class), add properties and methods to it, and return the type, allowing us to
compose multiple mixins together to arrive at the feature set we desire for our
new Gadget.

This mixin-based composition lets us avoid the [fragile base class
problem][elliott].

Play ships with several built in mixins as well as presets (pre
mixed-combinations that you can include). You can write your own mixins and
fully customize your Gadget making toolbelt, too.

[elliott]:https://medium.com/@_ericelliott/why-composition-is-immune-to-fragile-base-class-problem-8dfc6a5272aa

## Full Feature List

- Fully encapsulated native Web Components
- Virtual DOM, with diff-based updates
- Selector-based event handlers instead of inline
- Arbitrary template functions—use template literals, JSX, Pug, …
- Or use VHTML and generate VDOM directly
- Observable properties generate change events and re-render
- Component-targetable CSS from client document
- Pipe operator to wire components together
- Delegation pattern—Gadgets are handles to DOM elements

## Demo

[Try it out!](https://play.pandastrike.com/demos/markdown-editor)

## Installation

Bundle using your favorite bundler:

```
npm i -S panda-play
```
