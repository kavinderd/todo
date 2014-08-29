require_relative '../lib/todo'
require 'minitest/autorun'

class TodoTest < MiniTest::Unit::TestCase

	# Adding Tasks
	def test_add_to_general_list_without_any_options
	  t = Todo::Application.new
		t.add(name: "get this done")
		assert_equal(["get this done"], t.tasks)
	end

	def test_add_details_to_task
		t = Todo::Application.new
		t.add(name: "get this done", priority: "high")
		assert_equal(["get this done"], t.tasks)
		assert_equal(["get this done | priority: high"], t.tasks(verbose: true))
	end

	def test_adding_to_named_list
		t = Todo::Application.new
		t.add(name: "do this", list: "my todo")
		assert_equal([], t.tasks)
		assert_equal(["my todo"], t.lists)
		assert_equal(["do this"], t.access_list("my todo").all)
	end


	# Removing Tasks
	def test_remove_from_general_list
		t = Todo::Application.new
		t.add(name: "get this done")
		t.remove("get this done")
		assert_equal([], t.tasks)
	end
end
