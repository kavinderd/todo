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

		def add(task_name)
			@list << task_name
		end

		def remove(task_name)
			@list.remove(task_name)
		end

		def tasks
			@list.all
		end

	end
end
