fs = require "fs"
gulp = require "gulp"
del = require "del"
pug = require "gulp-pug"
stylus = require "gulp-stylus"
minify = require "gulp-minify"
inlinesource = require "gulp-inline-source"
webserver = require "gulp-webserver"
webpack = require "webpack"
path = require "path"

gulp.task "inline", ->
  options =
    compress: false

  gulp.src './build/index.html'
    .pipe inlinesource options
    .pipe gulp.dest './dist'

gulp.task "minify", ->
  gulp.src "./build/*.js"
    .pipe minify {
      noSource: true
      ext:
        min: ".js"
    }
    .pipe gulp.dest "./build"

gulp.task "js", ->
  new Promise (yay, nay) ->
    webpack
      entry: "./src/demos/markdown-editor/index.coffee"
      mode: "development"
      devtool: "inline-source-map"
      output:
        path: path.resolve "build"
        filename: "index.js"
        devtoolModuleFilenameTemplate: (info, args...) ->
          {namespace, resourcePath} = info
          "webpack://#{namespace}/#{resourcePath}"
      module:
        rules: [
          test: /\.coffee$/
          use: [ 'coffee-loader' ]
        ,
          test: /\.js$/
          use: [ "source-map-loader" ]
          enforce: "pre"
        ,
          test: /\.styl$/
          exclude: /styles/
          use: [ "raw-loader", "stylus-loader" ]
        ,
          test: /\.pug$/
          use: [ "pug-loader" ]
        ]
      resolve:
        modules: [
          path.resolve "node_modules"
        ]
        extensions: [ ".js", ".json", ".coffee" ]
      plugins: [

      ]
      (error, result) ->
        console.error result.toString colors: true
        if error? || result.hasErrors()
          nay error
        else
          fs.writeFileSync "webpack-stats.json",
            JSON.stringify result.toJson()
          yay()

gulp.task "server", ->
  gulp
  .src "build"
  .pipe webserver
      # livereload: true
      port: 8000
      extensions: [ "html" ]
      fallback: "/index.html"

gulp.task "clean", ->
  del "build"

gulp.task "html", ->
  gulp
  .src [ "src/**/*.pug" ]
  .pipe pug {}
  .pipe gulp.dest "build"

gulp.task "css", ->
  gulp
  .src "src/**/*.styl"
  .pipe stylus {compress: true}
  .pipe gulp.dest "build"

gulp.task "images", ->
  gulp
  .src [ "src/images/**/*" ]
  .pipe gulp.dest "build/images"


gulp.task "build",
  gulp.series "clean",
    (gulp.parallel "html", "css", "js", "images")

gulp.task "watch", ->
  gulp.watch [ "src/**/*"],
    gulp.task "build"

gulp.task "default",
  gulp.series "build",
    gulp.parallel "watch", "server"

