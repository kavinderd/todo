require_relative '../../lib/todo/presenter'
require_relative '../../lib/todo/list'
require 'minitest/autorun'

class PresenterTest < MiniTest::Unit::TestCase

	def test_presenting_list_tasks
		p = Todo::Presenter.new
		list = 	Todo::List.new
		list.add(name: 'my task')
    expected = "Tasks\n1. my task\n"
		assert_output(expected) { p.present(item: list, info: :tasks)}
	end

  def test_presenting_list_tasks_detailed
    p = Todo::Presenter.new
    list = Todo::List.new
    list.add(name: 'my task', priority: 'high')
    expected = "Tasks\n1. my task | priority: high\n"
    assert_output(expected) { p.present(item: list, info: :tasks, level: :verbose)}
  end

  def test_presenting_list_tasks_not_finished
    p = Todo::Presenter.new
    list = Todo::List.new
    list.add(name: 'my task')
    list.add(name: 'my other task')
    list.finish('my task')
    expected = "Tasks\n1. my other task\n"
    assert_output(expected) {p.present(item: list, info: :tasks, exclude: :finished) }
  end

  def test_presenting_list_tasks_not_finished_detailed
    p = Todo::Presenter.new
    list = Todo::List.new
    list.add(name: 'my task', priority: 'high')
    list.add(name: 'my other task', priority: 'high')
    list.finish('my other task')
    expected = "Tasks\n1. my task | priority: high\n"
    assert_output(expected) { p.present(item: list, info: :tasks, level: :verbose, exclude: :finished) }
  end

  def test_presenting_list_tasks_finished
    p = Todo::Presenter.new
    list = Todo::List.new
    list.add(name: 'my task')
    list.add(name: 'my other task')
    list.finish('my task')
    expected = "Tasks\n1. my task | ---- FINISHED ----\n"
    assert_output(expected) { p.present(item: list, info: :tasks, level: :verbose, exclude: :open) }
  end

  def test_presenting_list_lists
    p = Todo::Presenter.new
    list = Todo::List.new
    list.add(name: 'my task', list: 'sub list')
    expected = "Lists\n1. sub list\n"
    assert_output(expected) { p.present(item: list, info: :lists)}
  end

  def test_presenting_list_lists
    p = Todo::Presenter.new
    list = Todo::List.new
    list.add(name: 'my task', list: 'sub list')
    expected = "Lists\n1. sub list | tasks: 1\n"
    assert_output(expected) { p.present(item: list, info: :lists, level: :verbose)}
  end


end
