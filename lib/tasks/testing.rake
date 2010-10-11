begin
  require 'cucumber/rake/task'
rescue LoadError
  warn "couldn't load cucumber, skipping"
end

begin
  require 'spec/rake/spectask'
rescue LoadError
  warn "couldn't load rspec, skipping"
end
$LOAD_PATH.unshift("lib")

PLUGIN = "codebook"
ENV['RAILS_ENV'] = "test"

FEATURE_DIR = File.join(File.expand_path(File.join(__FILE__, '../../../../')), PLUGIN, 'features')
SPEC_DIR    = File.join(FEATURE_DIR, '..', 'spec')

namespace :test do
  namespace :codebook do
        
    Cucumber::Rake::Task.new(:cucumber, "Run the cucumber features of the #{PLUGIN} plugin") do |t|
      t.cucumber_opts = ['--format', (ENV['CUCUMBER_FORMAT'] || 'progress'),
                         '-r', File.join(FEATURE_DIR, 'step_definitions'),
                         '-r', File.join(FEATURE_DIR, 'support'),
                         FEATURE_DIR]
    end

    namespace :spec do

      Spec::Rake::SpecTask.new(:views) do |t|      
        puts "Loading specs for '#{t.name}' from #{SPEC_DIR}/#{t.name}/*/*_spec.rb"
        t.warning = false
        t.rcov = false
        t.spec_files = "#{SPEC_DIR}/#{t.name}/*/*_spec.rb"
        t.spec_opts = []
      end

    end
  end
end  


