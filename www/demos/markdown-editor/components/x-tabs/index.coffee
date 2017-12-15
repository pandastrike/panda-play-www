import {gadget, zen} from "panda-play"
import {template} from "./template.coffee"
import {Tab} from "./tab"

gadget

  tag: "x-tabs"
  mixins: zen

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

  template: template

  ready: ->
    @tabs[0].select()
