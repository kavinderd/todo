#TODO: Read PR article about require and require relative

require_relative "todo/version"
require_relative "todo/version"
require_relative "todo/list"
require_relative 'todo/presenter'
module Todo

	class Application
	  
		def initialize(persistent: false)
      @list = init_list(persistent) 
      @presenter = Todo::Presenter.new
		end

		def add(name:, **options)
			@list.add(name: name, priority: options[:priority], list: options[:list])
		end

    def finish(task_name, **options)
      if options[:list]
        access_list(options[:list]).finish(task_name)
      else
        @list.finish(task_name)
      end
    end

		def remove(task_name)
			@list.remove(task_name)
		end

		def tasks(options={})
      item = options[:list] ? access_list(options[:list]) : @list
      return "no such list"  unless item
      @presenter.present(item: item, info: :tasks, level: options[:level])
		end

		def lists
      @presenter.present(item: @list, info: :lists)
		end

		def access_list(list_name)
			@list.access_list(list_name)
		end
    
    private

    def init_list(persistent)
      if persistent
        Todo::List.load
      else
        Todo::List.new
      end
    end

	end
end
