# Todo

#Under Construction!

###The Problem

I find it hard to manage my todo list in any application (Evernote, Trello, Wunderlist).  It's just a mental barrier to switch context open an application, find the list or notebook and then finally type in the todo item.  This gem aims to solve my problem by providing a command line alternative that is simple to add to a list, create a new list or sublist and check items off a list.

## Installation

Add this line to your application's Gemfile:

    gem 'todo'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install todo

- **Setup**

In order to setup todo on your machine you'll need to do the following:

-Todo persists the lists to $HOME/todo/ so make sure that is available and writable 

## Usage
	
Todo can be used in the following ways:

1. Add a task to the general list:
	
	`todo add 'get some milk'`

2. Add a task to the general list with priority:

   `todo add 'get some milk' -p high`

This will push the item to the top of the list.

3. Add a task to a specific list:

  	`todo add 'get some milk' -l groceries`

4. Recall a list

	  `todo lists groceries`

This returnes

   1. `'get some milk' | due date: tomorrow | priority: high`

6. Mark a task as done

	 `todo finish 'get some milk' -l groceries`
 
7. Delete a task

	`todo remove 'get some milk' -l groceries`

## Contributing

1. Fork it ( http://github.com/<my-github-username>/todo/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
