import "./components/x-tabs/index.coffee"
import "./components/x-editor/index.coffee"
import "./components/x-markdown/index.coffee"
import {$} from "./helpers"
import {gadget} from "panda-play"

$.ready ->

  console.log "document ready"

  editor = await gadget $ "x-editor"
  markdown = await gadget $ "x-markdown"

  editor.pipe markdown

  editor.value = """
    # Chapter 1

    It was a dark and stormy night.

    ![](https://pearlsofprofundity.files.wordpress.com/2013/03/snoopy-dark-and-gloomy-night-4.jpg)
    """
