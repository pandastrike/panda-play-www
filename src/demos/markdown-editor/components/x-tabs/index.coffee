import {Gadget, mixin, events, tag, properties, habanera, matches} from "panda-play"

class extends Gadget

  mixin @, [

    tag "x-tabs"

    habanera

    properties
      selected: get: -> @root.querySelectorAll ".selected"

      tabs:
        get: ->
          for tab in @root.querySelectorAll "label"
            label: tab
            contentId: "##{tab.getAttribute('for')}"

    events
      label:
        click: ({target}) ->
          return unless (target.matches "label") && (!target.classList.contains "selected")
          @select target

  ]

  select: (el) ->
    @deselect() # deselect any active tabs and content areas first
    for tab in @tabs
      if el == tab.label
        tab.label.classList.add "selected"
        (@root.querySelector tab.contentId).classList.add "selected"

  deselect: ->
    @deselectAll @selected

  deselectAll: (ex) ->
    for e in ex
      e.classList.remove "selected"

