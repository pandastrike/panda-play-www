
class Panels

  constructor: (panels) ->
    @panels = for panel in panels
      new Panels.Panel panel

  class Panel

    constructor: (panel) ->
      @panel = panel
      @name = "name"

export {Panels}
