require_relative '../lib/todo'
require 'minitest/autorun'

class TodoTest < MiniTest::Unit::TestCase

  def teardown
    File.delete('undefined.txt') if File.exists?('undefined.txt')
  end
	# Adding Tasks
	def test_add_to_general_list_without_any_options
	  t = Todo::Application.new
		t.add(name: "get this done")
    assert_output("Tasks\n1. get this done\n") {t.tasks}
	end

	def test_add_details_to_task
		t = Todo::Application.new
		t.add(name: "get this done", priority: "high")
    assert_output("Tasks\n1. get this done | priority: high\n") {t.tasks(level: :verbose)}
	end

	def test_adding_to_named_list
		t = Todo::Application.new
		t.add(name: "do this", list: "my todo")
    assert_output("Lists\n1. my todo\n") { t.lists }
	end

  #Finishing Tasks
  def test_finishing_task
    t = Todo::Application.new
    t.add(name: "do this now")
    t.finish("do this now")
    assert_output("Tasks\n1. do this now | ---- FINISHED ----\n") { t.tasks(level: :verbose)}
  end

  def test_finishing_task_on_sublist
    t = Todo::Application.new
    t.add(name: "do this", list: "submarine")
    t.finish("do this", list: "submarine")
    assert_output("Tasks\n1. do this | ---- FINISHED ----\n") { t.tasks(level: :verbose, list: "submarine") }
  end


	# Removing Tasks
	def test_remove_from_general_list
		t = Todo::Application.new
		t.add(name: "get this done")
		t.remove("get this done")
    assert_output("Tasks\n") { t.tasks }
	end

  #Persistence
  def test_saving_base_list_to_file
    t = Todo::Application.new(persistent: true)
    t.add(name: "get this done")
    t = Todo::Application.new(persistent: true)
    assert_output("Tasks\n1. get this done\n") { t.tasks }
  end
end
