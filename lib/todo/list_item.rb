module Todo
	class ListItem
	
		attr_reader :name, :priority
		def initialize(name:, priority: nil)
			@name = name
			@priority = priority
		end

		def details
			"#{name} | priority: #{priority}"
		end

		def to_h
			{
				name: name,
				priority: priority
			}
		end
	end
end
