import {properties} from "fairmont-helpers"

# A few classes to allow us to nagivate from a label
# to tab content or to the corresponding slots
#
# tab
#   name: logical reference we use to map to the slot
#   label: what do we display on the tab
#   dom:
#     name: see above
#     label: the label element (as opposed to text)
#     tabs: this tab's parent
#     shadow: this tab's parent's shadow root
#     content: tab content
#     slots:
#       name: see above
#       label: the slot element for the label
#       content: the slot element for the content
#
class Tab

  constructor: (label) ->
    @name = (label.getAttribute "slot").replace "-label", ""
    @label = label.textContent
    @dom = new Tab.DOM @name, label

  select: ->
    for node in [ @dom.tab, @dom.label, @dom.content ]
      node.classList.add "selected"

  deselect: ->
    for node in [ @dom.tab, @dom.label, @dom.content ]
      node.classList.remove "selected"

  class @DOM

    properties @::,
      tabs: get: -> @label.parentNode
      shadow: get: -> @tabs.shadowRoot
      content: get: -> @query "[slot='#{@name}-content']"
      tab: get: -> @slots.content.parentNode

    constructor: (@name, @label) ->
      @slots = new Tab.DOM.Slots @name, @

    query: (s) -> @tabs.querySelector s


    class @Slots

      properties @::,
        label: get: -> @query "#{@name}-label"
        content: get: -> @query "#{@name}-content"

      constructor: (@name, @dom) ->

      query: (name) -> @dom.shadow.querySelector "slot[name='#{name}']"

export {Tab}
