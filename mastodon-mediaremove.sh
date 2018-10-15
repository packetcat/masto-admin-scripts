#!/usr/bin/env bash

cd /home/mastodon/live
RAILS_ENV=production bundle exec /home/mastodon/live/bin/tootctl media remove
