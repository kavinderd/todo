require_relative '../lib/todo'
require 'minitest/autorun'

class TodoTest < MiniTest::Unit::TestCase

	def test_add_to_general_list_without_any_options
	  t = Todo::Application.new
		t.add("get this done")
		assert_equal(["get this done"], t.tasks)
	end
end
