module Todo
	class List
		attr_reader :tasks
		def initialize
			@tasks = []
		end

		def << (item)
			@tasks << item
		end

		def remove(item)
			@tasks.delete_if{|t| t == item}
			all
		end

		def all
			@tasks
		end

	end
end
