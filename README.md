# TodoMVC mobile app

This is a prototype of classic TodoMVC app with evernote-style server sync and phonegap integaration.
It runs on backbone.js, Marionette and require.js.

## Installation
----

1) Clone this repo:

    git clone git@github.com:ikido/jasper-prototype.git

2) Switch into project dir

    cd jasper-prototype    

3) Install dependensies

    bundle install

4) Start middleman

    middleman

5) Go to http://localhost:4567/index_dev.html_ to see it in action

6) Go to http://localhost:4567/jasmine to run jasmine tests

## Config
----

You can configure settings by editing config.rb file. Be carefull though,
all variables not prefixed with 'jasper_' will affect middleman's behaviour,
so make sure you know what you are doing. Here is a list of current config
variables with their defaults

** Api server url **

    set :jasper_api_server, 'http://jasper-server.dev'

## Project build
----

Since we are running automated project build node.js will be required to run r.js command line optimizer. All project build steps are written and documented in /build.rb 

1) Get latest XCode from the App store, it's free download

2) Install homebrew

    ruby <(curl -fsSkL raw.github.com/mxcl/homebrew/go)
    brew doctor

3) Install node.js

    brew install node

4) Switch into project dir

    cd jasper-prototype

5) Run project build script

    ./build.sh
    
6) Check project files in ./phonegap-build
