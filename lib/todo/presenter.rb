module Todo
  class Presenter

    def present(item:,**options)
      @presentable = item
      @level = options[:level] ||=  :basic 
      @info = options.fetch(:info)	
      @exclude = options[:exclude]
      print send("render_#{@presentable.type}_#{@info}_#{@level}", @presentable)
    end	

    private

    #LIST PRESENTATION
    def render_list_lists_basic(presentable)
      lists = presentable.to_h[:lists] 
      output = "Lists\n"
      lists.each_with_index do |t, i|
        order = i + 1
        output << "#{order}. #{t[:name]}\n"
      end 
      output
    end

    def render_list_lists_verbose(presentable)
      lists = presentable.to_h[:lists]
      output = "Lists\n"
      lists.each_with_index do |t, i|
        order = i + 1
        output << "#{order}. #{t[:name]} | tasks: #{t[:tasks].count}\n"
      end
      output
    end

    #TASK PRESENTATION
    def render_list_tasks_basic(presentable)
      tasks = presentable_tasks
      output = "Tasks\n"
      tasks.each_with_index do |t,i|
        order = i + 1
        output << "#{order}. #{t[:name]}\n"
      end
      output
    end

    def render_list_tasks_verbose(presentable)
      tasks = presentable_tasks
      output = "Tasks\n"
      tasks.each_with_index do |t, i|
        order = i + 1
        substring = "#{order}. #{t.delete(:name)} "
        substring << "| ---- FINISHED ----" if t.delete(:finished)
        t.each do |key, value|
          if value
            substring << "| #{key}: #{value}"
          end
        end
        substring << "\n"
        output << substring
      end 
      output
    end
    
    def presentable_tasks
      @data = @presentable.to_h[:tasks]
      @data = @data.select { |item| item[:finished] == false } if @exclude == :finished
      @data = @data.select { |item| item[:finished] == true  } if @exclude == :open
      @data
    end
  end
end
