# Description:
#   GitHub related commands
#
# Configuration:
#   HUBOT_GITHUB_USERNAME
#   HUBOT_GITHUB_PASSWORD
#   HUBOT_GITHUB_ORGANIZATION
#   HUBOT_GITHUB_REPO
#
# Commands:
#   hubot github issue create "<title>" "<description>"
#
# Author:
#   Atsushi (atsushi@ubyssey.ca)

# TODO: Make new bot only account
# TODO: Add screen shot
# TODO: Notify webdev slack channel
# TODO: Add LICENSE

config = require('dotenv').config()
GitHubApi = require('github')

module.exports = (robot) ->

  user = process.env.HUBOT_GITHUB_USERNAME
  pass = process.env.HUBOT_GITHUB_PASSWORD
  org = process.env.HUBOT_GITHUB_ORGANIZATION
  repo = process.env.HUBOT_GITHUB_REPO

  log = (data) ->
    # Need to use this line to print the data on log
    console.log require('util').inspect data

  github = () ->
    gh = new GitHubApi()
    gh.authenticate type: 'basic', username: user, password: pass
    gh

  # using '[\s\S]' to match multiline (instead of just '.')
  robot.respond /github issue create "(.+)" "([\s\S]+)"/i, (res) ->
    creator = res.message.user.name
    title = res.match[1]
    desc = "#{res.match[2]}\n\n(Submitted by #{creator})"

    github().issues.create user: user, owner: org, repo: repo, title: title, body: desc, (err, data) ->
      if not err
        res.send "Created new issue in #{org}/#{repo}.\n#{data.data.html_url}"
      else
        log(err)
        res.send "Hmm something went wrong while creating the issue :/"


  # Simpler alias for "github issue create
  robot.respond /issue "(.+)" "([\s\S]+)"/i, (res) ->
    creator = res.message.user.name
    title = res.match[1]
    desc = "#{res.match[2]}\n\n(Submitted by #{creator})"

    github().issues.create user: user, owner: org, repo: repo, title: title, body: desc, (err, data) ->
      if not err
        res.send "Created new issue in #{org}/#{repo}.\n#{data.data.html_url}"
      else
        res.send "Hmm something went wrong while creating the issue :/"

