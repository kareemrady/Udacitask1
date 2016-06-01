require_relative 'todolist.rb'

# Creates a new todo list
my_todo_list = TodoList.new("Kareem's Todo List")

# Add four new items
item1 = Item.new("Walk the Dog")
item2 = Item.new("Go to the Gym")
item3 = Item.new("Clean the Car")
item4 = Item.new("Finish Udacity assignment")
my_todo_list.add_item_to_todo_list(item1)
my_todo_list.add_item_to_todo_list(item2)
my_todo_list.add_item_to_todo_list(item3)
my_todo_list.add_item_to_todo_list(item4)

# Print the list
my_todo_list.print_todo_list_items

# Delete the first item
my_todo_list.remove_item_from_todo_list(item1)
# Print the list
my_todo_list.print_todo_list_items
# Delete the second item
my_todo_list.remove_item_from_todo_list(item2)
# Print the list
my_todo_list.print_todo_list_items
# Update the completion status of the first item to complete
my_todo_list.list_items[0].change_completion_status(true)
# Print the list
my_todo_list.print_todo_list_items
# Update the title of the list
my_todo_list.rename("Kareem's todo list afternoon")
# Print the list

#testing new features
my_todo_list.print_todo_list_items
my_todo_list.print_completed_items
my_todo_list.move_item_to_top(item4)
my_todo_list.print_todo_list_items

#testing creating a new user
kareem = User.new("Kareem", "Rady")
kareem.create_new_todo_list("Tomorrow's TodoList")
kareem.list_all_todo_lists
kareem.create_new_todo_list("June's TodoList")
kareem.create_new_todo_list("July's TodoList")
#testing error of creating a list that already exists
kareem.create_new_todo_list("July's TodoList")
kareem.list_all_todo_lists
kareem.remove_todo_list("July's TodoList")
kareem.list_all_todo_lists

#testing item_is_completed? for Item Class
puts
puts "Testing is Item's is Completed method"
puts "#{item3.item_title}  Completion Status is #{item3.is_completed?}"
