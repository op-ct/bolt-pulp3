#!/opt/puppetlabs/bolt/bin/rake -f
Rake::TaskManager.record_task_metadata = true

require 'rake/clean'
CLEAN.include( Dir['????????-????-????-????-????????????'].reject{|x| x.strip !~ /^[\h-]{36}$/ } )
CLEAN.include( '_download_path' )
CLEAN.include( 'gem.deps.rb.lock' )
CLOBBER << 'output'
CLOBBER << 'logs'
CLOBBER << 'downloads'

task :default do
  Rake::application.options.show_tasks = :tasks
  Rake::application.options.show_task_pattern = //
  Rake::application.display_tasks_and_comments
end

