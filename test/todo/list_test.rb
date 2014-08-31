require_relative '../../lib/todo/list'
require 'minitest/autorun'

class ListTest < MiniTest::Unit::TestCase
	
	def test_inital_list_state
	  list = Todo::List.new
		assert_equal([], list.tasks)
	end

	def test_list_with_name
		list = Todo::List.new("named list")
		assert_equal("named list", list.name)
	end

	def test_list_adds_list_item_objects
		list = Todo::List.new
		list.add(name: "my task")
		assert_instance_of(Todo::ListItem, list.all[0])
	end

	def test_adding_sublists
		list = Todo::List.new
		list.add(name: 'do this', list: 'my todo')
		assert_equal(['my todo'], list.lists)
		assert_equal([], list.tasks)
	end
  
	def test_to_h
		list = Todo::List.new
		list.add(name: 'my task')
		assert_equal(true, list.to_h.keys.include?(:tasks))
	end

	def test_all_with_verbose
		list = Todo::List.new
		list.add(name: 'my task', priority: 'high')
		assert_equal('high', list.all.first.priority)
	end

	def test_removing_from_internal_list
		list = Todo::List.new
	  list.add(name: "my task")
		list.remove("my task")
		assert_equal([], list.all)
	end

	def test_access_sub_lists
		list = Todo::List.new
		list.add(name: 'do this', list: 'my todo')
		list.access_list('my_todo')
	end

end
