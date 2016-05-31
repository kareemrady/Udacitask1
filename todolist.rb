class TodoList
  attr_accessor :title, :list_items
    def initialize(todo_list_name)
      @title = todo_list_name
      @list_items = []

    end
    # helper method to check if Item exsists in todolist - used by other methods
    def included_in_todo_list?(item)
      @list_items.is_a?(Item) && @list_items.include?(item) ? true : false
    end

    def name_todo_list(title)
      @title = title
    end

     def rename_todo_list(title)
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
         if @list_items.included_in_todo_list?(item)
           @list_items.delete(item)
         else
           puts "Error, You are trying to remove an item that doesn't exist"
         end
      end
      def change_completion_status(item, status)
        if @list_items.included_in_todo_list?(item)
          @list_items.map! {|item| item.status = status }
        else
          puts "Error, You are trying to remove an item that doesn't exist"
        end
      end
      def print_todo_list_items
        puts "-"*30
        puts
        puts "#{self.title} Items"
        puts
        puts "-"*30
        self.list_items.each_with_index {|item, index| puts "#{index+1} - #{item.item_title}            Completed: #{item.status} "}
      end


end

class Item
    # methods and stuff go here
    attr_accessor :item_title, :status, :id
    def initialize(item_name)
      @item_title = item_name
      @status = false

    end

end
