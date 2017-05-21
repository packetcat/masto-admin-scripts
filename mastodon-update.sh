#!/usr/bin/env bash
# Author - staticsafe
# Purpose - Does all the things needed to do an update of Mastodon
export PATH="$HOME/.rbenv/bin:$PATH"
eval "$(rbenv init -)"
MASTODON_INSTALL_DIR=/home/mastodon/live
RAILS_ENV=production

cd $MASTODON_INSTALL_DIR
git pull
git checkout $(git tag | tail -n 1)
bundle exec rails db:migrate
yarn install --pure-lockfile
bundle exec rails assets:precompile
echo "Mastodon update complete, restart Mastodon to put the update in effect."
