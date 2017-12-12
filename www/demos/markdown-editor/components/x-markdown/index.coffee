import {gadget} from "panda-play"
import {template} from "./template.coffee"
import MarkdownParser from "markdown-it"

gadget

  name: "x-markdown"

  observe:
    value: ""

  properties:
    output:
      get: do ->
        md = new MarkdownParser
          linkify: true
          typographer: true
          quotes: '“”‘’'
        -> md.render @value if @value?

  template: template
