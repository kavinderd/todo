require "bundler/gem_tasks"
require 'rake/testtask'
require 'fakefs/safe'

Rake::TestTask.new do |t|
  FakeFS do
	  t.libs << "test"
	  t.test_files = FileList['test/*_test.rb', 'test/**/*_test.rb']
  end
end


