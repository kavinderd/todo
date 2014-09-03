#TODO: Read PR article about require and require relative
require_relative "todo/version"
require_relative "todo/list"
require_relative 'todo/presenter'
require 'pry'
require 'pry-debugger'
module Todo

	class Application
	  
		def initialize()
			@list = Todo::List.new(persisted: persisted)
      @presenter = Todo::Presenter.new
		end

		def add(name:, **options)
			@list.add(name: name, priority: options[:priority], list: options[:list])
		end

		def remove(task_name)
			@list.remove(task_name)
		end

		def tasks(options={})
      @presenter.present(item: @list, info: :tasks, level: options[:level])
		end

		def lists
      @presenter.present(item: @list, info: :lists)
		end

    def load
    end

		def access_list(list_name)
			@list.access_list(list_name)
		end

	end
end
