#!/bin/bash
cd /var/www/projects/love_kitchen && bundle exec unicorn -c /var/www/projects/love_kitchen/config/unicorn.conf.rb -D -E production