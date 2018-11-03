import "./components/x-tabs/index.coffee"
import "./components/x-editor/index.coffee"
import "./components/x-markdown/index.coffee"
import {gadget, $} from "panda-play"
import {ready} from "./helpers.coffee"

ready ->

  xtabs = await $ "x-tabs"

  # Select thefirst tab at start
  xtabs.select xtabs.tabs[0].label

  editor = await $ "x-editor"
  markdown = await $ "x-markdown"

  editor.pipe markdown

  editor.value = """
    # Chapter 1

    It was a dark and stormy night.

    ![](https://pearlsofprofundity.files.wordpress.com/2013/03/snoopy-dark-and-gloomy-night-4.jpg)
    """
