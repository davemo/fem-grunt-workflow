# Grunt the JavaScript Task Runner

- pre-existing static assets
- npm init
- touch Gruntfile.js

- npm install grunt-cli -g
- npm install grunt
- npm install grunt-contrib-concat --save

# Stylesheet Preprocessors

- npm install grunt-contrib-watch  --save
- npm install grunt-contrib-less
- npm install grunt-contrib-copy --save
- npm install express --save-dev
- mkdir tasks
- touch tasks/server.js
- install the chrome live-reload extension
-- https://chrome.google.com/webstore/detail/livereload/jnihajbhpnppcggbcgedagnkighmdlei?hl=en

# Thinking about Dependency Management

## CoffeeScript

- npm install grunt-contrib-clean --save
- npm install grunt-contrib-uglify --save
- npm install grunt-open --save-dev
- npm install grunt-contrib-coffee --save

## Bower

- npm install -g bower
- touch .bowerrc
- bower init
- bower install angular#1.2.0-rc.3 --save
- bower install angular-route#1.2.0-rc.3 --save
- bower install base64js --save
- bower install jquery --save
- bower install underscore --save
- bower install https://github.com/searls/extend.js/releases/download/0.1.0/extend.js --save

# Precompiling Templates for MV*

## grunt-angular-templates

- npm install grunt-angular-templates --save

# Optimizing for Developer Happiness

## grunt-concat-sourcemap

- npm install grunt-concat-sourcemap --save

# Alternative Frameworks & Dependency Management Strategies

## Backbone, precompiling handlebars

- npm install grunt-contrib-handlebars --save

- rm -rf bower_modules
- bower install https://raw.github.com/testdouble/backbone-fixins/master/dist/backbone-fixins.js --save
- bower install backbone.stickit#0.6.2 --save
- bower install backbone#0.9.10 --save
- bower install underscore.string#2.3.0 --save
- bower install handlebars#1.0.0 --save
- bower install underscore#1.4.3 --save
- bower install jquery#1.8.2 --save
- bower install https://github.com/searls/extend.js/releases/download/0.1.0/extend.js --save
- bower install base64js --save

## CommonJS, A simple module format

- npm install grunt-browserify --save
- npm install coffeeify --save

## Yeoman

- cd yeoman-workflow
- npm install
- bower install
- grunt server

## Lineman

- cd lineman-workflow
- npm installl
- lineman

## Bonus: Grunt Contrib Imagemin

- cd grunt-workflow
- npm install grunt-contrib-imagemin --save
- grunt imagemin
