# ToyLang

[![Build Status](https://github.com/maxbarsukov/toylang/actions/workflows/main.yml/badge.svg?branch=master)](https://github.com/maxbarsukov/toylang/actions/workflows/main.yml)
[![Codecov](https://codecov.io/gh/maxbarsukov/toylang/branch/master/graph/badge.svg?token=9L8Y4N4KKW)](https://codecov.io/gh/maxbarsukov/toylang)

***ToyLang*** is interpreted high-level fully OOP language with *Python-like* syntax and dynamic typing.

 > Complex is better than complicated.

As a multi-paradigm language, ***ToyLang*** supports object-oriented and imperative programming styles both.

## Installation

    $ gem install toylang

## Usage

Run REPL:
```bash
toylang
```

or run file:
```bash
toylang your_code.tlg
```

## Examples of code

```python
# comment
println("Hello World")
"Hello World".println # Hello World

println(2 + 2 ** 5) # 34

def hello(name):
  "Hi, " + name + "!"

hello("Max").println # => Hi, Max!

a = 23
b = a + 2
println(b) # => 25

Hey = 5 # constant

if (2 > 1):
  println("Yeah!")
else:
  println("Something goes bad!")

if (false):
  print("Won't be printed")
```

Cycles:
```python
a = 0
while (a != 3):
  println(a)
  a = a + 1
# => 0 1 2
```

OOP:
```python
# class defination
class Klass:
  def my_method:
    true

# object creating
k = Klass.new
k.my_method.print # => true

# monkey patching
class Number:
  def ten:
    10

1.ten.println # => 10

class Number:
  def ten:
    11

1.ten.println # => 11

# inheritance
class Animal:
  def is_a_human:
    false
  def say:
    "..."

class Dog < Animal:
  def say:
    "Bark!"

dog = Dog.new
animal = Animal.new

println(animal.say)     # ...
println(dog.say)        # Bark!
println(dog.is_a_human) # false
```

## Building

### Pre-reqs

To build and run this app locally you will need a few things:

- Install [Ruby](https://www.ruby-lang.org/en/) *(tested on **2.6**)*;
- Using [Racc](https://github.com/ruby/racc) as parser

### Getting start

- Clone the repository
```bash
git clone --depth=1 https://github.com/maxbarsukov/toylang.git
```
- **Install dependencies**
```bash
cd toylang
bundle install
```
- **Run**
```bash
./bin/toylang input.tlg
# or
./bin/toylang
````
- **RSpec**
```bash
bundle exec rspec
```
- **Rubocop**
```bash
bundle exec rubocop
```

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/maxbarsukov/toylang. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [code of conduct](https://github.com/maxbarsukov/toylang/blob/master/CODE_OF_CONDUCT.md).

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the Toylang project's codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/maxbarsukov/toylang/blob/master/CODE_OF_CONDUCT.md).
