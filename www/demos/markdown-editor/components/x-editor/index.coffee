import {gadget} from "panda-play"
import {template} from "./template.coffee"

gadget

  name: "x-editor"

  observe:
    value: ""

  events:
    textarea:
      keyup: ({target}) -> @value = target.value

  template: template
