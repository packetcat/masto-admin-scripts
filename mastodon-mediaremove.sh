#!/usr/bin/env bash

export PATH="$HOME/.rbenv/bin:$PATH"
eval "$(rbenv init -)"
cd /home/mastodon/live
RAILS_ENV=production /home/mastodon/.rbenv/shims/bundle exec /home/mastodon/live/bin/tootctl media remove
