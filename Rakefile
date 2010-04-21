#!/usr/bin/env ruby
require 'redmine_plugin_support'

Dir[File.expand_path(File.dirname(__FILE__)) + "/lib/tasks/**/*.rake"].sort.each { |ext| load ext }

RedminePluginSupport::Base.setup do |plugin|
  plugin.project_name = 'codebook'
  plugin.default_task = [:spec, :features]
  plugin.tasks = [:doc, :release, :clean, :test, :db, :spec]
  plugin.redmine_root = File.expand_path(File.dirname(__FILE__) + '/../../../')
end

begin
  require 'jeweler'
  Jeweler::Tasks.new do |gemspec|
    gemspec.name = "redmine_codebook_plugin"
    gemspec.summary = "Share code snippets and gists in redmine"
    gemspec.description = "A handy extension to share pieces of code among teams"
    gemspec.email = "steffen@sroegner.org"
    gemspec.homepage = "http://github.com/sroegner/codebook"
    gemspec.authors = ["Steffen Roegner"]
  end
rescue LoadError
  puts "Jeweler not available. Install it with: gem install jeweler"
end

