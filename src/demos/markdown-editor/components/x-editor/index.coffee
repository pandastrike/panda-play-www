import {Gadget, mixin, events, tag, render, property, bebop, shadow} from "panda-play"
import template from "./template.pug"

mixin class extends Gadget, [
  tag "x-editor"
  bebop, shadow
  render template

  events
    textarea:
      keyup: ({target}) -> @value = target.value
]
