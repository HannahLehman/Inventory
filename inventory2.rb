
class Beans 
	attr_accessor :type, :qty
	def initialize(type, qty)
		@type = type.capitalize
		@qty = qty
	end

	def list
		# Method to list the current inventory count.
		puts "We have #{qty} #{type} Jelly Beans today."
	end

end

# Create items to call .list on.
a =	Beans.new("berry", 23)

b = Beans.new("coconut", 34)

c = Beans.new("licorice", 1)

d = Beans.new("peach", 99)


@beans = [a, b, c, d]

# List all items by type and qty.
def list_current
count = 0
	@beans.each do |i|
		puts "Item #{count +1}:"
		i.list 
		count += 1
	end
end

# Request user selects option to edit, add, or remove.
list_current


until @restart == true
	
	puts "Enter an item number to edit its quantity. Type 'new' to create a new item, or 'exit' to exit."
	@item_to_edit = gets.chomp
	
	# If edit: get new input, update quantity.
	if @item_to_edit != "new" && @item_to_edit != "exit"

		@item_to_edit = @item_to_edit.to_i

		puts "Please type in the new quantity for #{@beans[@item_to_edit - 1].type} Jelly Beans:"
		@new_item_qty = gets.chomp.to_i

		puts "There are now #{@new_item_qty} #{@beans[@item_to_edit - 1].type} Jelly Beans in inventory."

	# If new: retrieve type and qty of new item from user.
	elsif @item_to_edit == "new"
		puts "What flavor Jelly Bean would you like to add to inventory?"
		@new_flav = gets.chomp.capitalize

		puts "What quantity #{@new_flav} Jelly Beans would you like to add to inventory?"
		@new_flav_qty = gets.chomp.to_i

		@new_item = Beans.new(@new_flav, @new_flav_qty)

		@beans.push(@new_item) 

		puts "Inventory has been updated as follows:"

		list_current

	# Confirm or deny "exit".
	else @item_to_edit == "exit"
		puts "You have chosen to exit the Inventory editor. Is this correct?" 
		@end = gets.chomp.downcase

		if @end != "y" && @end != "yes"
			
			@restart == true

			list_current
		else
			break
		end
	end	

end


# Features to add:

# Flavor of the day? @beans.shuffle
# Clear screen / system 'clear' or system 'cls'









# If add or remove, .push or .pop item. 

# Retun new inventory count.

# Loop or exit.
