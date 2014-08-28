require_relative "list_item"
module Todo
	class List
		attr_reader :tasks
		def initialize
			@tasks = []
		end

		def add(name:,**options)
			list_item= Todo::ListItem.new(name: name, priority: options[:priority])
			@tasks << list_item
		end

		def remove(name)
			@tasks.delete_if{|t| t.name == name}
			all
		end

		def all(options={})
			return @tasks.map{|t| t.details} if options[:verbose]
			@tasks.map{|t| t.name}
		end

	end
end
