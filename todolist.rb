class User
  attr_accessor :full_name, :todo_lists
  def initialize(first_name, last_name)
    @full_name = "#{first_name} #{last_name}"
    @todo_hash = {}
  end
  def create_new_todo_list(todo_list_name)
    if !@todo_hash.keys.include?(todo_list_name)
      @todo_hash[todo_list_name] = TodoList.new(todo_list_name)
    else
      puts "----------------------------------"
      puts "Error #{todo_list_name} already exists"
    end
  end
    def list_all_todo_lists
    puts "-"*30
    puts
    puts "Listing all Todo Lists for user : #{@full_name}"
    puts
    puts "-"*30
      if @todo_hash.empty?
        puts "No Todo List associated with user"
      else
        @todo_hash.keys.each_with_index {|key, index| puts "#{index +1} -  #{key} "}
    end
  end
    def remove_todo_list(todo_list_name)
      if @todo_hash.keys.include?(todo_list_name)
        @todo_hash.delete(todo_list_name)
      else
        puts "Error creating TodoList specified doesn't exist"
      end
    end
  end

class TodoList
  attr_accessor :title, :list_items
    def initialize(todo_list_name)
      @title = todo_list_name
      @list_items = []

    end
    # helper method to check if Item exsists in todolist - used by other methods
    def included_in_todo_list?(item)
      item.is_a?(Item) && @list_items.include?(item) ? true : false
    end

    def name_todo_list(title)
      @title = title
    end

     def rename(title)
       @title = title
     end
     def add_item_to_todo_list(item)
       if item.is_a?(Item)
         if @list_items.include?(item)
           puts "Error Item already exists in todo list"
         else
            @list_items.push(item)
          end
       else
         puts "Not an item object Error, Only item objects can be inserted Please make sure you input an item object"
       end
      end
      def remove_item_from_todo_list(item)
         if included_in_todo_list?(item)
            @list_items.delete(item)
         else
           puts "Error, You are trying to remove an item that doesn't exist"
         end
      end
      # def change_completion_status(item, status)
      #   if included_in_todo_list?(item)
      #     self.list_items.map! {|item| item.status = status }
      #   else
      #     puts "Error, You are trying to remove an item that doesn't exist"
      #   end
      # end

      def move_item_to_top(item)
        if included_in_todo_list?(item)
          @list_items.insert(0, item)
          #added uniq method to not print the method moved to top twice - could be also avoided by adding an id instance variable 
          @list_items.uniq!
        else
          puts "Error Item doesn't exist"
        end
      end

      def print_completed_items
        completed_items = @list_items.select {|item| item.status == true}

        if completed_items.empty?
          puts "No completed items found"
        else
          header =  "Completed Items in the #{@title} Todo List"
          print_from_items_array_with_index(completed_items, header)
          puts
      end
    end

    # As per Reviewer suggestion extracting a method to print an array to avoid DRY - Thanks alot :)

    def print_from_items_array_with_index(arr, header)
      puts "-"*30
      puts
      puts "#{header}"
      puts
      puts "-"*30
      arr.each_with_index {|item, index| puts "#{item.print_item({index: index+1})}"}
    end

      def print_todo_list_items
        header =  "#{@title} Items"
        print_from_items_array_with_index(@list_items, header)
      end


end

class Item
    # methods and stuff go here
    attr_accessor :item_title, :status
    def initialize(item_name)
      @item_title = item_name
      @status = false

    end
    def change_completion_status(status)
      @status = status
    end
    def is_completed?
      #return true or false based on the status instance value
      @status
    end

    #made the index argument optional to allow the method to be used by the item class as well, if no index provided it will just print the item title and its staus with no index
    def print_item(options = {})
      index = options[:index] || nil
      message = index.nil? ? "- #{@item_title}            Completed:#{@status}" : "#{index} - #{@item_title}            Completed:#{@status}"
      print "#{message}"
    end

end
