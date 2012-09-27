taskiq
============

taskiq allows you to run any rake task in the background using sidekiq. 


Install
-------

    # Gemfile
    gem 'taskiq', :git => 'git://github.com/matteodepalo/taskiq.git'

 
    # Rakefile (at the end)
    require 'tasks/taskiq' 

Usage
-----

Add delay: to the start of any rake task e.g.

    $ rake delay:db:seed

rake db:seed will now be run in the background as a sidekiq job