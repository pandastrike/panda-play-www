import {Gadget, mixin, events, tag, property, method, habanera, matches} from "panda-play"

mixin class extends Gadget, [

  tag "x-tabs"
  habanera

  property
    tabs:
      get: ->
        for tab in @root.querySelectorAll "label"
          label: tab
          id: tab.id

    selected:
      get: -> @root.querySelectorAll ".selected"

  method
    select: (el) ->
      @deselect() # deselect any active tabs and content areas first
      for tab in @tabs
        if el == tab.label
          tab.label.classList.add "selected"
          @select_all @root.querySelectorAll ".#{tab.id}"

    select_all: (ex) ->
      for e in ex
        e.classList.add "selected"

    deselect_all: (ex) ->
      for e in ex
        e.classList.remove "selected"

    deselect: ->
      @deselect_all @selected

  events
    label:
      click: ({target}) ->
        return unless (target.matches "label") && (!target.classList.contains "selected")
        @select target

]
