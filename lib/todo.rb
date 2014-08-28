#TODO: Read PR article about require and require relative
require_relative "todo/version"
require_relative "todo/list"
require 'pry'
require 'pry-debugger'
module Todo

	class Application
	  
		def initialize()
			@list = Todo::List.new()
		end

		def add(name:, **options)
			@list.add(name: name, priority: options[:priority])
		end

		def remove(task_name)
			@list.remove(task_name)
		end

		def tasks(options={})
			@list.all(options)
		end

	end
end
