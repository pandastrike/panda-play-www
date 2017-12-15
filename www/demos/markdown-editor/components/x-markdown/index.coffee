import {gadget, zen, property} from "panda-play"
import {template} from "./template.coffee"
import MarkdownParser from "markdown-it"

gadget
  tag: "x-markdown"
  mixins: zen
  template: template

  properties:
    output:
      get: do ->
        md = new MarkdownParser
          linkify: true
          typographer: true
          quotes: '“”‘’'
        -> md.render @value if @value?
