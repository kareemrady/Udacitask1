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

# Print the list

# Delete the second item

# Print the list

# Update the completion status of the first item to complete

# Print the list

# Update the title of the list

# Print the list
