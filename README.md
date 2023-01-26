To run the tests you will need to ensure you have ruby, bundler and rspec installed. 
You can then run the tests by moving in to the project folder and running the command 'rspec'
----------------

To run the project type the following commands in to your terminal

; irb # start the ruby REPL
; require './lib/transaction.rb' # require the transaction class - you may need to adjust the command depending on where you currently are relative to the file
; require './lib/account.rb' # require the account class

Once these steps are done you should be able to run the program.

To set up a new account use Account.new
; your_account_name = Account.new

To make a deposit or withdrawal, use the deposit and withdraw methods on your new account. These methods takes two arguments, the first is the date of the transaction as a string in the format dd/mm/yyyy. The second is an integer of the deposit amount.
; your_account_name.deposit('25/01/2023', 1000)
; your_account_name.withdraw('26/01/2023', 200)

To print a statement, use the print_statement method.
; your_account_name.print_statement
----------------

My approach to this test was to create two classes, one two store the transaction details and another to keep track of transactions made so that a statement could be generated. I set off by thinking of integration tests based off of my class designs. I then wrote the tests and attempted to pass them. If a test required a specific class, I would go to that class and work on the unit tests required for this class before resuming the integration tests. Once a test has passed, I looked at ways of refactoring the code to make it easier to read and simpler to run.
