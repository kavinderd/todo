require_relative "list_item"
require 'yaml'
module Todo
	class List
		attr_reader :tasks, :lists, :name
		def initialize(list_name=nil, persistent:false)
			@tasks = []
			@name = list_name || 'undefined'
			@lists = []
      @persistent = persistent
		end

		def add(name:,**options)
			if options[:list]
				add_to_list(name, options)
			else
				add_task(name, options)
			end
      update
		end

		def remove(name)
			@tasks.delete_if{|t| t.name == name}
      update
			all
		end

		def all(options={})
			@tasks
		end

		def lists
			@lists.map{ |l| l.name } 
		end

		def access_list(list_name)
			list_with_name(list_name)
		end

		def to_h
			{
        name:  name,
				tasks: @tasks.map{ |t| t.to_h },
				lists: @lists.map{ |l| l.to_h }
			}
		end

		def type
			"list"
		end

    def self.load
      if File.exists?('undefined.txt')
        YAML.load(File.open("undefined.txt")) 
      else
        self.new(persistent: true)
      end
    end

		private
    
    def update
      save if @persistent
    end
   
    def save
      return unless @name == "undefined"
      File.open("undefined.txt", "w") do |f|
        f.write YAML.dump(self)
      end
    end

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
