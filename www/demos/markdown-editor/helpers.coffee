$ = (selector) ->
  document.querySelector selector

$.ready = (f) ->
  document.addEventListener "DOMContentLoaded", f

export {$}
