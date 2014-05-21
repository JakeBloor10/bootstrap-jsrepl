# Atlas JSREPL Theme

This project shows how to create a basic [Bootstrap](http://getbootstrap.com/) theme for Atlas.


## Local Development

This theme has a simple sinatra app so that you can develop and test your theme locally, which is *wayyyy* better than continually pushing the theme to Atlas for builds.  It uses [Rack::Directory](http://www.ruby-doc.org/gems/docs/e/edgar-rack-1.2.1/Rack/Directory.html) to serve static files from the _theme_ directory, and them mounts the test app as the root ("/").  To start the app, you'll need Ruby 1.9.3 and Bundler.)  Once you have these installed, do this:

```
$ cd bootstrap-basic
$ bundle install
$ shotgun
```

You can then view the static site at _localhost:9393_.  The cool thing is that this will update as you make changes to the file so that you can see the results in real time.

There is sample content in the *sample-content.html* and a sample TOC in *sample-toc.html*.


## Including this theme in your project

The first step in including this theme in your project is pretty simple:

* Clone this repo in the root directory of your project


## Publishing your project on github pages

For now, the simplest way to publish a project is to do it as a static site on [github pages](https://pages.github.com/). Here's what you need to do:

* Create a new repo on GitHub where you plan to publish the site
* Add a remote in your local atlas repo to your new github repo
* switch to the "gh-pages" branch in your project
* use the [atlas gem](http://rubygems.org/gems/atlas-api) to build the project
* add and commit the new files
* Push your gh-pages branch to your the gh-pages branch on github


## Including live code with jsrepl

[replit](http://replit.github.io/jsrepl/) is an awesome project that allows you to run certain languages directly in the browser via javascript.  (To really blow your mind, the project compiles a language like Python into JavaScript.)  Here are some special steps you need to take to use it in your Atlas project.  

### Download and unzip the jsrepl language bundle

The first step is to add jsrepl to your /theme/html/javascripts directory.  


```
$ cd <your project home>
$ cd theme/html/javascripts/
$ wget https://s3.amazonaws.com/orm-atlas-media/jsrepl.zip
$ unzip jsrepl.zip
$ rm jsrepl.zip
```

### gitignore the 100MB jsrepl directory in your master branch 

This file is about 100MB, so we only want to make sure it is included in the HTML build, and does not become part of your project.  To do this, add the following line to your .gitignore file in master:

```
/theme/html/javascripts/
```

### Remove the gitignore in your gh-pages branch

When you're ready to publish the project, you need to make sure that the jsrepl files are actually uploaded to github so that they can served as a static site.  To do this, just remove the "/theme/html/javascripts/" line from your .gitignore file in your gh-pages branch, and then add and commit the files.  This will ensure that the files are deployed to the website, but will not become part of your project.

