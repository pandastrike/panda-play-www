import "./components/x-tabs/index.coffee"
import "./components/x-editor/index.coffee"
import "./components/x-markdown/index.coffee"
import {$} from "./helpers"

$.ready ->

  editor = ($ "x-editor").gadget
  markdown = ($ "x-markdown").gadget

  editor.pipe markdown

  editor.value = """
    # Chapter 1

    It was a dark and stormy night.

    ![](https://pearlsofprofundity.files.wordpress.com/2013/03/snoopy-dark-and-gloomy-night-4.jpg)
    """
