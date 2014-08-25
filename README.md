# Todo

###The Problem

I find it hard to manage my todo list in any application (Evernote, Trello, Wunderlist).  It's just a mental barrier to switch context open an application, find the list or notebook and then finally type in the todo item.  This gem aims to solve my problem by providing a command line alternative that is simple to add to a list, create a new list or sublist and check items off a list.

###The Solution
	
	Todo can be used in the following ways:

1. Add a task to the general list:
    
    todo 'get some milk'

2. Add a task to the general list with priority:

   todo 'get some milk' -p high

This will push the item to the top of the list.

3. Add a task to the general list with a due date:

  todo 'get some milk' -d (tomorrow, 1/1/15, 1 week)

4. Add a task to a specific list:

  todo 'get some milk' -l groceries

5. Recall a list

  todo groceries

This returnes

   1. 'get some milk' | due date: tomorrow | priority: high

6. Mark a task as done

	todo check 'get some milk' -l groceries
  todo check 1 -l groceries

When a task is finished you can either invoke `check` with the name of the task or with the number on the priority list.

7. Delete a task

	todo delete 'get some milk' -l groceries
  todo delete 1 -l groceries

8. Edit a task

  todo edit 'get some milk' -n 'Get Some Milk' -d '1 month'

## Installation

Add this line to your application's Gemfile:

    gem 'todo'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install todo

## Usage

TODO: Write usage instructions here

## Contributing

1. Fork it ( http://github.com/<my-github-username>/todo/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
