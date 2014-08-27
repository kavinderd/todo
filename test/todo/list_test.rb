require_relative '../../lib/todo/list'
require 'minitest/autorun'

class ListTest < MiniTest::Unit::TestCase
	
	def test_inital_list_state
	  list = Todo::List.new
		assert_equal([], list.tasks)
	end

	def test_adding_to_internal_list
		list = Todo::List.new
		list << "my task"
		assert_equal(["my task"], list.all)
	end

	def test_removing_from_internal_list
		list = Todo::List.new
		list << "my task"
		list.remove("my task")
		assert_equal([], list.all)
	end
end
