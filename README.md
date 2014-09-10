# Orenono

[![Gem Version](https://badge.fury.io/rb/orenono.svg)](http://badge.fury.io/rb/orenono)
[![Build Status](https://travis-ci.org/tbpgr/orenono.png?branch=master)](https://travis-ci.org/tbpgr/orenono)
[![Coverage Status](https://coveralls.io/repos/tbpgr/orenono/badge.png)](https://coveralls.io/r/tbpgr/orenono)

Brainfuck interpreter written in Ruby.

You can change basic syntaxes by Orenonofile.
You can create "New Brainfuck Derivation Language" easily.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'orenono'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install orenono

## Command Line Interface Usage

### Show help

~~~bash
orenono h
~~~

### Generate Orenonofile

~~~bash
orenono init
~~~

or 

~~~bash
orenono i
~~~

Orenonofile contents is...  

~~~ruby
# encoding: utf-8

# increment command
# increment's default value => "+"
increment "+"

# decrement command
# decrement's default value => "-"
decrement "-"

# start_loop command
# start_loop's default value => "["
start_loop "["

# end_loop command
# end_loop's default value => "]"
end_loop "]"

# next_cursol command
# next_cursol's default value => ">"
next_cursol ">"

# previous_cursol command
# previous_cursol's default value => "<"
previous_cursol "<"

# display command
# display's default value => "."
display "."

# read command
# read's default value => ","
read ","
~~~

### Execute Brainfuck (default Orenonofile)

* orenono.bf

~~~
+++++++++[>++++++++>+++++++++++>+++++<<<-]>.>++.+++++++..+++.>-.
------------.<++++++++.--------.+++.------.--------.>+.
~~~

* execute

~~~
$ orenono execute sample.bf
Hello, world!
~~~

or

~~~
$ orenono e sample.bf
Hello, world!
~~~

### Convert Brainf*ck default syntax to your Orenonofile syntax

* Orenonofile

~~~ruby
# encoding: utf-8

increment "足す"
decrement "引く"
start_loop "はじめ"
end_loop "おわり"
next_cursol "次"
previous_cursol "前"
display "出"
read "入"
~~~

* Target Brainf_ck code.

~~~brainfuck
+++++++++[>++++++++>+++++++++++>+++++<<<-]>.>++.+++++++..+++.>-.
------------.<++++++++.--------.+++.------.--------.>+.
~~~

* Convert

~~~bash
$ orenono c base.bf
足す足す足す足す足す足す足す足す足すはじめ次足す足す足す足す足す足す足す足す次足す足す足す足す足す足す足す足す足す足す足す次足す足す足す足す足す前前前引くおわり次出次足す足す出足す足す足す足す足す足す足す出出足す足す足す出次引く出
引く引く引く引く引く引く引く引く引く引く引く引く出前足す足す足す足す足す足す足す足す出引く引く引く引く引く引く引く引く出足す足す足す出引く引く引く引く引く引く出引く引く引く引く引く引く引く引く出次足す出
~~~

* Use converted file

~~~bash
$ orenono c base.bf > sample.bf
$ orenono e sample.bf
Hello, world!$
~~~

## Brainfuck Derivation Language Samples

### Sample Define1

* Orenonofile

~~~ruby
# encoding: utf-8

increment "足す"
decrement "引く"
start_loop "はじめ"
end_loop "おわり"
next_cursol "次"
previous_cursol "前"
display "出"
read "入"
~~~

* ./samples/pattern1/orenono.bf

~~~ruby
足す足す足す足す足す足す足す足す足すはじめ次足す足す足す足す足す足す足す足す次足す足す足す足す足す足す足す足す足す足す足す次足す足す足す足す足す前前前引くおわり次出次足す足す出足す足す足す足す足す足す足す出出足す足す足す出次引く出
引く引く引く引く引く引く引く引く引く引く引く引く出前足す足す足す足す足す足す足す足す出引く引く引く引く引く引く引く引く出足す足す足す出引く引く引く引く引く引く出引く引く引く引く引く引く引く引く出次足す出
~~~

* output

~~~
$ orenono e orenono.bf
Hello, world!
~~~

### Sample Define2

Emoji word only syntax.

* Orenonofile

~~~ruby
# encoding: utf-8

increment ":heavy_plus_sign:"
decrement ":heavy_minus_sign:"
start_loop ":baby:"
end_loop ":older_man:"
next_cursol ":arrow_right:"
previous_cursol ":arrow_left:"
display ":blossom:"
read ":seedling:"
~~~

* ./samples/pattern2/orenono.bf

~~~
:heavy_plus_sign::heavy_plus_sign::heavy_plus_sign::heavy_plus_sign::heavy_plus_sign::heavy_plus_sign::heavy_plus_sign::heavy_plus_sign::heavy_plus_sign::baby::arrow_right::heavy_plus_sign::heavy_plus_sign::heavy_plus_sign::heavy_plus_sign::heavy_plus_sign::heavy_plus_sign::heavy_plus_sign::heavy_plus_sign::arrow_right::heavy_plus_sign::heavy_plus_sign::heavy_plus_sign::heavy_plus_sign::heavy_plus_sign::heavy_plus_sign::heavy_plus_sign::heavy_plus_sign::heavy_plus_sign::heavy_plus_sign::heavy_plus_sign::arrow_right::heavy_plus_sign::heavy_plus_sign::heavy_plus_sign::heavy_plus_sign::heavy_plus_sign::arrow_left::arrow_left::arrow_left::heavy_minus_sign::older_man::arrow_right::blossom::arrow_right::heavy_plus_sign::heavy_plus_sign::blossom::heavy_plus_sign::heavy_plus_sign::heavy_plus_sign::heavy_plus_sign::heavy_plus_sign::heavy_plus_sign::heavy_plus_sign::blossom::blossom::heavy_plus_sign::heavy_plus_sign::heavy_plus_sign::blossom::arrow_right::heavy_minus_sign::blossom:
:heavy_minus_sign::heavy_minus_sign::heavy_minus_sign::heavy_minus_sign::heavy_minus_sign::heavy_minus_sign::heavy_minus_sign::heavy_minus_sign::heavy_minus_sign::heavy_minus_sign::heavy_minus_sign::heavy_minus_sign::blossom::arrow_left::heavy_plus_sign::heavy_plus_sign::heavy_plus_sign::heavy_plus_sign::heavy_plus_sign::heavy_plus_sign::heavy_plus_sign::heavy_plus_sign::blossom::heavy_minus_sign::heavy_minus_sign::heavy_minus_sign::heavy_minus_sign::heavy_minus_sign::heavy_minus_sign::heavy_minus_sign::heavy_minus_sign::blossom::heavy_plus_sign::heavy_plus_sign::heavy_plus_sign::blossom::heavy_minus_sign::heavy_minus_sign::heavy_minus_sign::heavy_minus_sign::heavy_minus_sign::heavy_minus_sign::blossom::heavy_minus_sign::heavy_minus_sign::heavy_minus_sign::heavy_minus_sign::heavy_minus_sign::heavy_minus_sign::heavy_minus_sign::heavy_minus_sign::blossom::arrow_right::heavy_plus_sign::blossom:
~~~

* output

~~~
$ orenono e orenono.bf
Hello, world!
~~~

## History
* version 0.0.2 : Add converter(Brainf*ck default syntax to your Orenonofile syntax).
* version 0.0.1 : First release.

## Contributing

1. Fork it ( https://github.com/[my-github-username]/orenono/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
