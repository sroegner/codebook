# Testing codebook

One personal comment first: getting testing to work (not so much writing test) meant considerable effort, which is why it took me so long to come up with some tests. I do not consider the redmine plugin framework considerably test-friendly.

## Here are some steps necessary to run a test:

* if not in trunk, change the gem dependencies in config/environments/test.rb, change the shoulda reference to
 > config.gem "shoulda"
* install gems
  * gem install cucumber cucumber-rails
  * gem install rspec rspec-rails
  * gem install shoulda
  * gem install edavis10-object_daddy mocha
  * gem install ruby-debug
  * gem install jeweler
  * gem install faker
  * gem install factory_girl
