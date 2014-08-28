require_relative '../../lib/todo/list'
require 'minitest/autorun'

class ListTest < MiniTest::Unit::TestCase
	
	def test_inital_list_state
	  list = Todo::List.new
		assert_equal([], list.tasks)
	end

	def test_list_adds_list_item_objects
		list = Todo::List.new
		list.add(name: "my task")
		#assert_instance_of(Todo::ListItem, list.all[0])
	end

	def test_all
		list = Todo::List.new
		list.add(name: 'my task')
		assert_equal(["my task"], list.all)
	end

	def test_all_with_verbose
		list = Todo::List.new
		list.add(name: 'my task', priority: 'high')
		assert_equal(["my task | priority: high"], list.all(verbose: true))
	end

	def test_removing_from_internal_list
		list = Todo::List.new
	  list.add(name: "my task")
		list.remove("my task")
		assert_equal([], list.all)
	end
end
