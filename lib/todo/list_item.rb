module Todo
	class ListItem
	
		attr_reader :name, :priority
		def initialize(name:, priority: nil)
			@name = name
			@priority = priority
      @finished = false
		end

		def details
      n = "#{name}"
      priority = @priority ? "priority: #{priority}" : nil
      finished = @finished ? "----FINISHED----" : nil
      [n, priority, finished].delete_if { |i| i.nil? }.join(" | ")
		end

		def to_h
			{
				name: name,
				priority: priority,
        finished: @finished
			}
		end

    def finished?
      @finished
    end

    def finish!
      @finished = true
    end
	end
end
