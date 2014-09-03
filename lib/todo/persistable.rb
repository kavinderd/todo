module Todo
  module Persistable
    #MAKE THIS DB PATH THE HOME DIRECTORY
    DB_PATH ="db/#{ENVIRONMENT}"
    def setup(db_path: DB_PATH)
      @db = db_path
    end

    def save
      File.open("lists/#{name}.txt", "w") do |f|
        f.write("#{name}\n")
        tasks.map { |t| t.to_s }.each do |t|
          f.write(t)
        end  
        f.write("Lists")
        lists.each do |l|
          f.write("#{l.name}\n")
        end
      end
    end
 
  end
end

