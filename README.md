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
$ orenono h
Commands:
  orenono convert         # Convert Brainf*ck default syntax to your Orenonof...
  orenono execute         # Execute Brainf**k
  orenono generate        # Generate Brainf*ck code from ascii code text.
  orenono help [COMMAND]  # Describe available commands or one specific command
  orenono init            # Generate Orenonofile template
  orenono version         # version

Options:
  -h, [--help]     # help message.
      [--version]  # version
~~~

### Generate Orenonofile

~~~bash
$ orenono init
~~~

or 

~~~bash
$ orenono i
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

### Generate Brainf*ck code from ascii code text.

* Default syntax case

~~~bash
$ orenono generate 'Hello, world!' > hello.bf
$ cat hello.bf
++++++++++[>+++++++<-]>++.+++++++++++++++++++++++++++++.+++++++..+++.-------------------------------------------------------------------.------------.+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++.--------.+++.------.--------.-------------------------------------------------------------------.
$ orenono e hello.bf
Hello, world!
~~~

* Original syntax case.

Orenonofile

~~~ruby
# encoding: utf-8

increment "俺について来い！！"
decrement "頑張れよ！！"
start_loop "できる！できる！絶対にできるんだから！"
end_loop "諦めんなよ!"
next_cursol "もっと熱くなれよ…!!"
previous_cursol "ぬるま湯なんかつかってんじゃねぇよお前！！"
display "人の弱点を見つける天才よりも、人を褒める天才がいい"
read "熱い血燃やしてけよ…!!"
~~~

* results

~~~bash
$ orenono g 'Hello, world!' > hello.shuzo
$ cat hello.shuzo
俺について来い！！俺について来い！！俺について来い！！俺について来い！！俺について来い！！俺について来い！！俺について来い！！俺について来い！！俺について来い！！俺について来 い！！できる！できる！絶対にできるんだから！もっと熱くなれよ…!!俺について来い！！俺について来い！！俺について来い！！俺について来い！！俺について来い！！俺について来い！！俺 について来い！！ぬるま湯なんかつかってんじゃねぇよお前！！頑張れよ！！諦めんなよ!もっと熱くなれよ…!!俺について来い！！俺について来い！！人の弱点を見つける天才よりも、人を褒める天才がいい俺について来い！！俺について来い！！俺について来い！！俺について来い！！俺について来い！！俺について来い！！俺について来い！！俺について来い！！俺について来い！！ 俺について来い！！俺について来い！！俺について来い！！俺について来い！！俺について来い！！俺について来い！！俺について来い！！俺について来い！！俺について来い！！俺について来 い！！俺について来い！！俺について来い！！俺について来い！！俺について来い！！俺について来い！！俺について来い！！俺について来い！！俺について来い！！俺について来い！！俺につ いて来い！！人の弱点を見つける天才よりも、人を褒める天才がいい俺について来い！！俺について来い！！俺について来い！！俺について来い！！俺について来い！！俺について来い！！俺に ついて来い！！人の弱点を見つける天才よりも、人を褒める天才がいい人の弱点を見つける天才よりも、人を褒める天才がいい俺について来い！！俺について来い！！俺について来い！！人の弱 点を見つける天才よりも、人を褒める天才がいい頑張れよ！！頑張れよ！！頑張れよ！！頑張れよ！！頑張れよ！！頑張れよ！！頑張れよ！！頑張れよ！！頑張れよ！！頑張れよ！！頑張れよ！ ！頑張れよ！！頑張れよ！！頑張れよ！！頑張れよ！！頑張れよ！！頑張れよ！！頑張れよ！！頑張れよ！！頑張れよ！！頑張れよ！！頑張れよ！！頑張れよ！！頑張れよ！！頑張れよ！！頑張 れよ！！頑張れよ！！頑張れよ！！頑張れよ！！頑張れよ！！頑張れよ！！頑張れよ！！頑張れよ！！頑張れよ！！頑張れよ！！頑張れよ！！頑張れよ！！頑張れよ！！頑張れよ！！頑張れよ！ ！頑張れよ！！頑張れよ！！頑張れよ！！頑張れよ！！頑張れよ！！頑張れよ！！頑張れよ！！頑張れよ！！頑張れよ！！頑張れよ！！頑張れよ！！頑張れよ！！頑張れよ！！頑張れよ！！頑張 れよ！！頑張れよ！！頑張れよ！！頑張れよ！！頑張れよ！！頑張れよ！！頑張れよ！！頑張れよ！！頑張れよ！！頑張れよ！！頑張れよ！！頑張れよ！！頑張れよ！！人の弱点を見つける天才 よりも、人を褒める天才がいい頑張れよ！！頑張れよ！！頑張れよ！！頑張れよ！！頑張れよ！！頑張れよ！！頑張れよ！！頑張れよ！！頑張れよ！！頑張れよ！！頑張れよ！！頑張れよ！！人 の弱点を見つける天才よりも、人を褒める天才がいい俺について来い！！俺について来い！！俺について来い！！俺について来い！！俺について来い！！俺について来い！！俺について来い！！ 俺について来い！！俺について来い！！俺について来い！！俺について来い！！俺について来い！！俺について来い！！俺について来い！！俺について来い！！俺について来い！！俺について来 い！！俺について来い！！俺について来い！！俺について来い！！俺について来い！！俺について来い！！俺について来い！！俺について来い！！俺について来い！！俺について来い！！俺につ いて来い！！俺について来い！！俺について来い！！俺について来い！！俺について来い！！俺について来い！！俺について来い！！俺について来い！！俺について来い！！俺について来い！！ 俺について来い！！俺について来い！！俺について来い！！俺について来い！！俺について来い！！俺について来い！！俺について来い！！俺について来い！！俺について来い！！俺について来 い！！俺について来い！！俺について来い！！俺について来い！！俺について来い！！俺について来い！！俺について来い！！俺について来い！！俺について来い！！俺について来い！！俺につ いて来い！！俺について来い！！俺について来い！！俺について来い！！俺について来い！！俺について来い！！俺について来い！！俺について来い！！俺について来い！！俺について来い！！ 俺について来い！！俺について来い！！俺について来い！！俺について来い！！俺について来い！！俺について来い！！俺について来い！！俺について来い！！俺について来い！！俺について来 い！！俺について来い！！俺について来い！！俺について来い！！俺について来い！！俺について来い！！俺について来い！！俺について来い！！俺について来い！！俺について来い！！俺につ いて来い！！俺について来い！！俺について来い！！人の弱点を見つける天才よりも、人を褒める天才がいい頑張れよ！！頑張れよ！！頑張れよ！！頑張れよ！！頑張れよ！！頑張れよ！！頑張 れよ！！頑張れよ！！人の弱点を見つける天才よりも、人を褒める天才がいい俺について来い！！俺について来い！！俺について来い！！人の弱点を見つける天才よりも、人を褒める天才がいい 頑張れよ！！頑張れよ！！頑張れよ！！頑張れよ！！頑張れよ！！頑張れよ！！人の弱点を見つける天才よりも、人を褒める天才がいい頑張れよ！！頑張れよ！！頑張れよ！！頑張れよ！！頑張 れよ！！頑張れよ！！頑張れよ！！頑張れよ！！人の弱点を見つける天才よりも、人を褒める天才がいい頑張れよ！！頑張れよ！！頑張れよ！！頑張れよ！！頑張れよ！！頑張れよ！！頑張れよ ！！頑張れよ！！頑張れよ！！頑張れよ！！頑張れよ！！頑張れよ！！頑張れよ！！頑張れよ！！頑張れよ！！頑張れよ！！頑張れよ！！頑張れよ！！頑張れよ！！頑張れよ！！頑張れよ！！頑 張れよ！！頑張れよ！！頑張れよ！！頑張れよ！！頑張れよ！！頑張れよ！！頑張れよ！！頑張れよ！！頑張れよ！！頑張れよ！！頑張れよ！！頑張れよ！！頑張れよ！！頑張れよ！！頑張れよ ！！頑張れよ！！頑張れよ！！頑張れよ！！頑張れよ！！頑張れよ！！頑張れよ！！頑張れよ！！頑張れよ！！頑張れよ！！頑張れよ！！頑張れよ！！頑張れよ！！頑張れよ！！頑張れよ！！頑 張れよ！！頑張れよ！！頑張れよ！！頑張れよ！！頑張れよ！！頑張れよ！！頑張れよ！！頑張れよ！！頑張れよ！！頑張れよ！！頑張れよ！！頑張れよ！！頑張れよ！！頑張れよ！！頑張れよ ！！頑張れよ！！頑張れよ！！人の弱点を見つける天才よりも、人を褒める天才がいい
$ orenono e hello.shuzo
Hello, world!
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
* version 0.0.3 : Add Brainf*ck code generator from ASCII code text.
* version 0.0.2 : Add converter(Brainf*ck default syntax to your Orenonofile syntax).
* version 0.0.1 : First release.

## Contributing

1. Fork it ( https://github.com/tbpgr/orenono/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
