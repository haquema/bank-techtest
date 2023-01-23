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
│ -deposit                       │
│ -withdraw                      │
│ -print_statement               │
└─────────────┬──────────────────┘
              │
              │  Account contains a list of transactions
              │
┌─────────────▼──────────────────┐
│  Transaction                   │
│                                │
│  -initialize                   │
│  -type                         │
│  -date                         │
│  -amount                       │
│  -statement_formatter          │
└────────────────────────────────┘
```

_Also design the interface of each class in more detail._

```ruby
class Account
  def initialize
    # takes no arguments and returns nothing
  end

  def deposit(date, amount)
    # creates a new transaction and records the deposit details
    # takes two arguments
    # date is a string in the format dd/mm/yyyy
    # amount is a positive integer
    # returns nothing
  end

  def withdraw(date, amount)
    # creates a new transaction and records the withdrawal details
    # takes two arguments
    # date is a string in the format dd/mm/yyyy
    # amount is a positive integer
    # returns nothing
  end
  
  def print_statement
    # takes no arguments
    # returns a multi line string of all transactions recorded
  end
end

class Track

  attr_reader :type, :date, :amount

  def initialize(type, date, amount)
    # takes three arguments and returns nothing
    #stores the arguments in appropriate instance variables
  end

  def statement_formatter
    # returns a string to be outputted when statement is printed
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