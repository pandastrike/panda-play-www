import {gadget, vdom, styles, template} from "panda-play"
import {template as t} from "./template.coffee"
import {Tab} from "./tab"

gadget

  tag: "x-tabs"
  mixins: [ vdom, styles, template ]

  properties:
    tabs:
      get: ->
        for label in (@dom.querySelectorAll "label[slot]")
          new Tab label

  on:
    label:
      click: ({target}) ->
        for tab in @tabs
          if tab.dom.label == target
            tab.select()
          else
            tab.deselect()

  template: t

  ready: ->
    @render()
    @tabs[0].select()
