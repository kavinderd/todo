require_relative "../../lib/todo/list_item"
#TODO: Does minitest have a spec_helper convention
require "minitest/autorun"

class ListItemTest < MiniTest::Unit::TestCase

	def test_initializing_minimal_list_item
		assert_instance_of(Todo::ListItem, Todo::ListItem.new(name: "my item"))
	end

	def test_to_h
		li = Todo::ListItem.new(name: 'my item', priority: 'high')
		assert_equal({name: 'my item', priority: "high", finished: false}, li.to_h)
	end

  def test_marking_as_finished
    li = Todo::ListItem.new(name: "my item")
    assert_equal(false, li.finished?)
    li.finish!
    assert_equal(true, li.finished?)
  end
  
  def test_finished_to_s_output
    li = Todo::ListItem.new(name: 'my item')
    li.finish!
    assert_equal('my item | ----FINISHED----', li.details)
  end

  def test_output_without_finished
    li = Todo::ListItem.new(name: 'my item')
    assert_equal('my item', li.details)
  end

end
