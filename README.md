# Ruby Notes

Author: Lin Dong

Date: Thu Feb 12 19:11:42 PST 2015

Notes I took while learning "The Fundamentals of Ruby".

## 1. Installation

[Install rvm guide](https://rvm.io/rvm/install)

## To know

Everything is object, type `variable.methods` to see all available methods.

Useful to know

1. `variable.class`
2. `string.reverse`
3. `string*5` => `stringstringstringstringstring`

## 2 Classes

Methods

```ruby
def add(a,b)

end
def power a,b
end
```

In `irb` all methods are added to `self`, which is an **object**.

Type `self.methods`, you will see the methods you just defined.

```ruby
str1 = 'a'
str2 = 'a'
str1 == str2 -> true
str1.equals? str2 -> false
```

Ruby always returns a value

## 3. Conditions

`if`, `elseif`, `else`

method `if` condition

method `unless` condition

```
case condiiton
when 'case1' then method1
when 'case2' then method2
when 'case3' then method3
else 'unknown case'
end
```

* `puts` print with a newline
* `print` without newline
* `p` is the same as `puts.inspect`

## 4 Loop and block

```ruby
loop do
    break if number > 15
    puts 'the numer is #(number)'
    number += 1
end
```

Range object, `0..15`

Blocks:

1. `do ... end`
2. `{  ...  }` which usually go with `->`

## 5. Proc and Lambdas

`Proc` objects are blocks of code that have been bound to a set of local
variables. Once bound, the code may be called in different contexts and still
access those variables.

`Lambda` requires all the arguments to be passed in directly, whereas `Proc`
does not.

`Proc` and `Lambda` are both **Proc** objects.

```ruby
a = -> {}
b = proc {}
a.class == b.class  # => true, both are Proc
```

`Proc`, the scope of `return` is outside.

`Lambda`, the scope of `return` is self-contained(inside).

## 6. Class

```ruby
attr_reader :variable
attr_writer :variable
attr_accessor :variable1, :variable2
```

## 7. Methods

**initialize**

```ruby
class Post
    def initialize options
        @name = options[:name]
    end
end

p = Post.new {name: 'Lin Dong'}
```

Use `splat` to pass parameters

## 8. Modules

Require modules:

```ruby
require_relative 'moduleName'
require 'gemModuleName'
```

After require modules, we can use `Mixin`

```
include MixinFromModule
```

or just `extend`

## 9. Exceptions
`CustomizedError` is inherited from `StandardError`

```ruby
class CustomizedError < StandardError
end

raise CUstomizedError if #variable.nil?
raise CUstomizedError, "OPTIONAL COMMENTS" if #variable.nil?

begin
    # logics
rescue CustomizedError
    # handle errors
ensure
    # run regardless
end
```

which is like `try catch finally` in **Java**

See more [here](http://www.tutorialspoint.com/ruby/ruby_exceptions.htm)

## 10. Strings

Concatenation

1. `a+b`
2. `a << b`
3. `a.concat b`

Return a new string: `a.upcase`

Capitalize the first letter: `a.capitalize`

Destructive, itself will change: `a.upcase!`

Find string pattern: `'hello world' =~ /\d+/`, return the first index of pattern

`'hello world'.include? 'wor'`

Length of string:
1. a.length
2. a.size
3. a.count

Count the recurrence of pattern: `a.count 'pattern'`

Delete the recurrence of pattern: `a.delete 'pattern'`

`%q` allows to insert newlines, i.e.

```ruby
%q(First Line
Second line
third line).each_line {|line| puts line}
```

`'hello'.reverse`

`"".empty?`

`'a.b.c.d.e'.split '.'`

## 11. Arrays

```ruby
a = [1,2,3]
b = [3,4,5]
a + b
a << b          # b is added at the end
a.unshift b     # b is added at the begining
[1, nil, 3, nil, 5].compact  # will remove nil

a | b

a = [1,2,3]
a[4] # => nil
a.fetch(4) # => raise expection

a.count 1     #=> return number

a.include? 1  #=> return boolean

# join
%w(s t r i n g).join ""   # => "string"
%w(s t r i n g) * "-"     # => "s-t-r-i-n-g"

# %w[ ]   Non-interpolated Array of words, separated by whitespace
# %W[ ]   Interpolated Array of words, separated by whitespace

a = [1,2,3]
a.push 5
a.pop count
a.shift    # pop front
a.unshift  # insert front

a = [1, 'one', 2, 'two', 3, 'three'].select {|item| item.is_a? String}
a = [1, 'one', 2, 'two', 3, 'three'].reject {|item| item.is_a? String}

a.map {|item| a.class}
```

## 12. Hashes

```ruby
hash = {:a => 1, :b => 2, :c => 3}
hash = Hash[:a => 1, :b => 2, :c => 3]
grades = { "Jane Doe" => 10, "Jim Doe" => 6 }

options = { font_size: 10, font_family: "Arial" }
options = { :font_size => 10, :font_family => "Arial" }

Hash["a", 100, "b", 200]             #=> {"a"=>100, "b"=>200}
Hash[ [ ["a", 100], ["b", 200] ] ]   #=> {"a"=>100, "b"=>200}
Hash["a" => 100, "b" => 200]         #=> {"a"=>100, "b"=>200}

# with default value
grades = Hash.new
grades["Dorothy Doe"] = 9

grades = Hash.new(0)

# Or by using the default= method:
grades = {"Timmy Doe" => 8}
grades.default = 0

grades.keys
grades.values
grades.hash_key? "a"
grades.hash_key? :a

grades.hash_value? 1
grades.each {|k, v| p "#{k}, #{v}"}


a = {a: 1, b: 2}
b = {c: 3, d: 4}
c = a.merge b

```

Must overwrite hash functions for class, i.e.

```ruby
class Book
  attr_reader :author, :title

  def initialize(author, title)
    @author = author
    @title = title
  end

  def ==(other)
    self.class === other and
      other.author == @author and
      other.title == @title
  end

  alias eql? ==

  def hash
    @author.hash ^ @title.hash # XOR
  end
end

book1 = Book.new 'matz', 'Ruby in a Nutshell'
book2 = Book.new 'matz', 'Ruby in a Nutshell'

reviews = {}

reviews[book1] = 'Great reference!'
reviews[book2] = 'Nice and compact!'

reviews.length #=> 1
```
## 13. Regexp

```ruby
/PATTERN/.class #=> Regexp
/arf/ =~ "Garfunkel"  # => index of string if there is a match, nil otherwise

/abc/i   #=> enable case insensitive
/ab.c/   #=> dot will match anything EXCEPT the newline
/ab.c/m  #=> using m includes newline in the . dot
/ab.c/x  #=> using x will ignore the whitespaces and comments


```

See [13.rb](13.rb)

`when` can take both **[Proc](## 5. Proc and Lambdas)** and **Regex**


## 14. Inheritance and Composition

Inheritance is more suitable for adding methods. using `<` and `super`

Composition is more suitable for enhancement.

However, situations may vary.

## 15. Mixins

Mixins are suitable for **behavior** methods
