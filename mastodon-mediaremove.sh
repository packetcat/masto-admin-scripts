#!/usr/bin/env bash

/home/mastodon/.rbenv/shims/bundle
cd /home/mastodon/live
RAILS_ENV=production /home/mastodon/.rbenv/shims/bundle exec /home/mastodon/live/bin/tootctl media remove
