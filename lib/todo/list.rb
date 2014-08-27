module Todo
	class List
		attr_reader :tasks
		def initialize
			@tasks = []
		end

		def << (item)
			@tasks << item
		end

		def all
			@tasks
		end

	end
end
