# ubysseybot

ubysseybot is a chat bot built on the [Hubot][hubot] framework for our [Slack][slack] deployed on [Google App Engine][gae]

Made with ❤️ by [The Ubyssey][ubyssey], the University of British Columbia's student newspaper since 1918.

[hubot]: https://hubot.github.com/
[slack]: http://slack.com/
[gae]: https://cloud.google.com/appengine/
[ubyssey]: https://www.ubyssey.ca/

![demo](https://i.imgur.com/Baq8jD6.gif)


### Installation

    git clone https://github.com/ubyssey/ubysseybot
    cd ubysseybot
    npm install

### Running locally

You can start ubysseybot locally by running:

    bin/hubot

You'll see some start up output and a prompt:

    [Sat Feb 28 2015 12:38:27 GMT+0000 (GMT)] INFO Using default redis on localhost:6379
    ubysseybot>

Then you can interact with ubysseybot by typing `ubysseybot help`.

    ubysseybot> ubysseybot help
    ubysseybot animate me <query> - The same thing as `image me`, except adds [snip]
    ubysseybot help - Displays all of the help commands that ubysseybot knows about.
    ...

### Running locally on Slack

You will need a slack app token for your specific slack team.
Check out the [documentation from Slack][hubot-slack-doc]

    HUBOT_SLACK_TOKEN=xxxx-your-token-xxxx ./bin/hubot -a slack

[hubot-slack-doc]: https://slackapi.github.io/hubot-slack/

### Deployment

We use [Google App Engine][gae] for most of our deployment including this slack bot.

Check out the [official Node.js documentation][gae-node]

We recommend [this article][gae-variable] as a strategy to store private tokens on GAE.

[gae-node]: https://cloud.google.com/appengine/docs/flexible/nodejs/
[gae-variable]: http://gunargessner.com/gcloud-env-vars/

### License
GNU General Public License v3.0
