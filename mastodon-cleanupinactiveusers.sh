#!/usr/bin/env bash
# AUTHOR - packetcat
# SQL query provided by djsundog
# PURPOSE - This script deletes inactive Mastodon users which meet certain inactivity conditions using tootctl.
# Modify the condition values and Mastodon installation directories as you need them
# The deletion line is commented out for safety reasons, verify you actually want to delete
# the listed users before removing the comment. Also, take a database backup before!

cd $HOME/live
# Example conditional - users who haven't signed in since 2019-12-31 and have 0 statuses/posts
for user in `psql mastodon_production -tq -c "SELECT a.username FROM accounts a, account_stats s WHERE a.id in (select account_id from users where last_sign_in_at < '2019-12-31'::date) AND a.id = s.account_id AND s.statuses_count = 0;"`; do
  echo "deleting ${user}"
  #RAILS_ENV=production bin/tootctl accounts delete ${user}
done
