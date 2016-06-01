class User
  attr_accessor :full_name, :todo_lists
  def initialize(first_name, last_name)
    @full_name = "#{first_name} #{last_name}"
    @todo_lists = []
  end
  def create_new_todo_list(todo_list_name)
    if !@todo_lists.include?(todo_list_name)
      @todo_lists.push(TodoList.new(todo_list_name))
    else
      puts "Error Todo List already exists"
    end
  end
    def list_all_todo_lists
      if @todo_lists.empty?
        puts "No Todo List associated with user"
      else
        @todo_lists.each_with_index {|todo, index| puts "#{index + 1} - todo.title"}
    end
  end
    def remove_todo_list(todo_list)
      if @todo_lists.include?(todo_list) && @todo_lists.is_a?(TodoList)
        @todo_lists.delete(todo_list)
      else
        puts "Error TodoList specified doesn't exist"
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
        else
          puts "Error Item doesn't exist"
        end
      end

      def print_completed_items
        completed_items = @list_items.select {|item| item.status == true}

        if completed_items.empty?
          puts "No completed items found"
        else
          puts "-"*30
          puts
          puts "Completed Items in the #{@title} Todo List"
          puts
          puts "-"*30
          puts "#{completed_items.each_with_index{|item, index| puts "#{index + 1} - #{item.item_title}"}}"
          puts
      end
    end

      def print_todo_list_items
        puts "-"*30
        puts
        puts "#{@title} Items"
        puts
        puts "-"*30
        @list_items.each_with_index {|item, index| puts "#{index+1} - #{item.item_title}            Completed: #{item.status} "}
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

end
