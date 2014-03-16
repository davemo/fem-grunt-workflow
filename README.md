fem-grunt-workflow
==================

A custom app workflow to teach people how to use Grunt.js

## Getting Started

Pre-requisites:

1. [Node.JS](http://www.nodejs.org)
2. NPM (which comes with Node)
3. some kind of text editor, I use [Sublime Text](http://www.sublimetext.com/2), feel free to use what you feel most comfortable with :)
4. git installed on your machine (if you are on Linux or Mac, this should be fairly straightforward, Windows users you should install http://msysgit.github.io/)
5. (optional) I use a number of aliases in my shell configuration to make working with git easier, feel free to yoink them into yours if you want to: https://gist.github.com/davemo/5329141#file-gitconfig
6. (optional) [git-crawl](https://github.com/magnusstahre/git-stuff): I'll be using this to "crawl" through a commit history for the project we are working on, this makes it much easier to move through commits than having to manually stash and checkout
7. (optional) [rowanj's fork of GitX for OSX](http://rowanj.github.io/gitx/), is a nice Git GUI client, but totally optional; if you have another Git GUI client feel free to use that. (Windows users, https://code.google.com/p/gitextensions/ looks about equivalent).

Alternatively, if you don't want to work on your own machine and would prefer to use a virtualized environment, you can signup for a free account on Nitrous.io, I tried it out the other day and it should work fine for the things we are going to be working on. This environment will come pre-installed with numbers 1 through 4 in the list above.

## Crawling with `next`, `prev` aliases

Put these aliases in your path for easy crawling :)

```shell
$ cat ~/bin/next 
#!/usr/bin/env bash
git crawl pdc
```

```shell
$ cat ~/bin/prev
#!/usr/bin/env bash
git co HEAD^1
```
