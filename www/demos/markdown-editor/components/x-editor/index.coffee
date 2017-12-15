import {gadget, zen} from "panda-play"
import {template} from "./template.coffee"

gadget
  tag: "x-editor"
  mixins: zen
  template: template

  on:
    textarea:
      keyup: ({target}) -> @value = target.value
