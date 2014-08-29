require_relative "list_item"
module Todo
	class List
		attr_reader :tasks, :lists, :name
		def initialize(list_name=nil)
			@tasks = []
			@name = list_name
			@lists = []
		end

		def add(name:,**options)
			if options[:list]
				add_to_list(name, options)
			else
				add_task(name, options)
			end
		end

		def remove(name)
			@tasks.delete_if{|t| t.name == name}
			all
		end

		def all(options={})
			return @tasks.map{|t| t.details} if options[:verbose]
			@tasks.map{|t| t.name}
		end

		def lists
			@lists.map{ |l| l.name } 
		end

		def access_list(list_name)
			list_with_name(list_name)
		end

		private

		def create_or_find(list_name)
			list = list_with_name(list_name)
			if list
				list
			else
				list = Todo::List.new(list_name)
				@lists << list
				list
			end
		end
		
		def list_with_name(list_name)
			index = @lists.find_index{ |l| l.name == list_name }
			index ? @lists[index] : index
		end

		def add_task(name, options)
		  @tasks << Todo::ListItem.new(name: name, priority: options[:priority])
		end

		def add_to_list(name, options)
			list = create_or_find(options[:list])
			options.delete(:list)
			list.add(name: name, priority: options[:priority])	
		end

	end
end
