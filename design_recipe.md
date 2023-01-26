# {{PROBLEM}} Multi-Class Planned Design Recipe

## 1. Describe the Problem

Given a client makes a deposit of 1000 on 10-01-2023
And a deposit of 2000 on 13-01-2023
And a withdrawal of 500 on 14-01-2023
When she prints her bank statement
Then she would see

You should be able to interact with your code via a REPL like IRB or Node. (You don't need to implement a command line interface that takes input from STDIN.)
Deposits, withdrawal.
Account statement (date, amount, balance) printing.
Data can be kept in memory (it doesn't need to be stored to a database or anything).

## 2. Design the Class System

_Consider diagramming out the classes and their relationships. Take care to
focus on the details you see as important, not everything. The diagram below
uses asciiflow.com but you could also use excalidraw.com, draw.io, or miro.com_

```
                                          ┌────────────────────────────────┐
                                          │ Account                        │
                                          │                                │
                                          │ -initialize                    │
                ┌─────────────────────────┤ -deposit                       ├──────────────────────┐
                │                         │ -withdraw                      │                      │
                │                         │ -print_statement               │                      │
                │                         └─────────────┬──────────────────┘                      │
                │                                       │                                         │
                │                                       │                                         │
                │                                       │                                         │
┌───────────────▼─────────────────┐       ┌─────────────▼──────────────────┐      ┌───────────────▼───────────────┐
│  Balance                        │       │  Transaction                   │      │  Statement                    │
│  -initialize                   │       │                                │      │                               │
│  -update                        │       │  -initialize                   │      │  -initialize                  │
│  -current                       │       │   -type                        │      │  -format                      │
│                                 │       │   -date                        │      │                               │
│                                 │       │   -amount                      │      │                               │
│                                 │       │                                │      │                               │
└─────────────────────────────────┘       └────────────────────────────────┘      └───────────────────────────────┘
  This class will be used to track          This class will only be used           This class will be used to format
  changes in balance and print              to store data about a                  transactions for printing
  current balance                           transaction
```

_Also design the interface of each class in more detail._

```ruby
class Account
  def initialize
    # takes no arguments and returns nothing
    # set up new balance class to store transactions
  end

  def deposit(date, amount)
    # creates a new deposit transaction and update balance class
    # takes two arguments
    # date is a string in the format dd/mm/yyyy
    # amount is a positive integer
    # returns nothing
  end

  def withdraw(date, amount)
    # creates a new withdrawal transaction and update balance class
    # takes two arguments
    # date is a string in the format dd/mm/yyyy
    # amount is a positive integer
    # returns nothing
  end
  
  def print_statement
    # takes no arguments
    # create a new statement object and call the format method on it
    # print statement
  end
end

class Track

  attr_reader :type, :date, :amount

  def initialize(type, date, amount)
    # takes three arguments and returns nothing
    #stores the arguments in appropriate instance variables
  end

end

class Balance

  attr_reader :balance

  def initialize(starting_balance)
    # takes one argument
    # sets up a list to store all transactions
    # sets up a balance variable to track current balance
  end

  def update(transaction)
    # takes a transaction object as an argument
    # stores it in list and updates balance
  end
  
end

class Statement

  attr_reader :statement

  def initialize(balance)
    # takes a balance object as an argument
    # sets up instance variable to store statement
  end

  def generate()
    # formats transactions to generate output lines for printing statement
  end
  
end
```

## 3. Create Examples as Integration Tests

_Create examples of the classes being used together in different situations and
combinations that reflect the ways in which the system will be used._

```ruby

# 1

mmy_account = Account.new
my_account.deposit("01/01/2023", 100)
my_account.print_statement

# 2

my_account = Account.new
my_account.deposit("01/01/2023", 1000)
my_account.deposit("04/01/2023", 1000)
my_account.print_statement

# 3

my_account = Account.new
my_account.deposit("04/01/2023", 1000)
my_account.deposit("01/01/2023", 1000)
my_account.deposit("02/01/2023", 1000)
my_account.print_statement

# 4

my_account = Account.new
my_account.deposit("01/01/2023", 1000)
my_account.withdraw("04/01/2023", 500)
my_account.print_statement

# 5

my_account = Account.new
my_account.deposit("04/01/2023", 1000)
my_account.print_statement




```


_Encode each example as a test. You can add to the above list as you go._

## 5. Implement the Behaviour

_After each test you write, follow the test-driving process of red, green,
refactor to implement the behaviour._