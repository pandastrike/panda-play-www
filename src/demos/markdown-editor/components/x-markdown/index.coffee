import {Gadget, mixin, tag, render, bebop, property} from "panda-play"
import template from "./template.pug"
import MarkdownParser from "markdown-it"

markdown = property
  output:
    get: do ->
      md = new MarkdownParser
        linkify: true
        typographer: true
        quotes: '“”‘’'
      -> md.render @value if @value?

mixin class extends Gadget, [
  tag "x-markdown"
  bebop, markdown
  render template
]