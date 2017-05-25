# embrasure/srcclr

[![CircleCI](https://circleci.com/gh/embrasure/srcclr/tree/master.svg?style=svg)](https://circleci.com/gh/embrasure/srcclr/tree/master) 
[![](https://imagelayers.io/badge/embrasure/srcclr:latest.svg)](https://imagelayers.io/?images=embrasure/srcclr:latest 'Get your own badge on imagelayers.io') 
[![license](https://img.shields.io/badge/license-MIT-blue.svg?style=plastic)]()

## About srcclr | Sourceclear

A utility Docker container for running the Sourceclear agent.

It's slightly opinionated in that it assumes your repo is at github.com.

## Install

`$ docker pull embrasure/srcclr`

For ease of use, it is recommended that you configure an alias for the one or more of the following commands:

```shell
$ alias srcclr='docker run -it --rm --env-file srcclr.env embrasure/srcclr'
$ alias srcclr-s='docker run -d --env-file srcclr.env embrasure/srcclr server'
```

If you wish for this alias to persist on reboot, you can append this line to your `~/.bashrc` (or similiar file):

```shell
$ alias srcclr >> ~/.bashrc
$ alias srcclr-s >> ~/.bashrc
```

## Usage

###### displaying help

`$ docker run -it --rm --env-file srcclr.env embrasure/srcclr --help`

###### running a scan of a repo

`$ docker run -it --rm --env-file srcclr.env embrasure/srcclr scan --url <GITHUB_URL>`

###### running the agent in server mode

`$ docker run -d --env-file srcclr.env embrasure/srcclr server`


## Environment Variables:

You will want to create a file to hold your environment variables so you don't have to pass them in on the command line on every execution.  In the examples above, we've named that file "srcclr.env".  The following two variables must be set:

GITHUBTOKEN -  Must be set to your personal github token you setup for sourceclear.

SRCCLRTOKEN - Must be set to your sourceclear API token.  Note that is not the activation token, it's the actual authorized token for the API.
