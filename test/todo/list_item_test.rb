require_relative "../../lib/todo/list_item"
#TODO: Does minitest have a spec_helper convention
require "minitest/autorun"

class ListItemTest < MiniTest::Unit::TestCase

	def test_initializing_minimal_list_item
		assert_instance_of(Todo::ListItem, Todo::ListItem.new(name: "my item"))
	end
end
