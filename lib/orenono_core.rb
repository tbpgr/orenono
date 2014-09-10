# encoding: utf-8
require 'brain'
require 'orenono_dsl'

module Orenono
  # Orenono Core
  class Core
    ORENONO_FILE = 'Orenonofile'
    ORENONO_TEMPLATE = <<-EOS
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
    EOS

    # Generate Orenonofile to current directory.
    def init
      File.open(ORENONO_FILE, 'w') { |f|f.puts ORENONO_TEMPLATE }
    end

    # Execute brain f**k
    def execute(file)
      dsl = read_dsl
      code = read_code(file)
      ob = Orenono::Brain.new(dsl.orenono, code)
      ob.run
    end

    # Convert Brainf*ck default syntax to your Orenonofile syntax
    def bf_to_your_syntax(file)
      dsl = read_dsl
      code = read_code(file)
      config = dsl.orenono
      convert(config, code, config.default_syntaxes, config.syntaxes)
    end

    private

    def convert(config, src, from_syntaxes, to_syntaxes)
      from_syntaxes.each_with_index do |syntax, i|
        src = src.gsub(syntax, to_syntaxes[i])
      end
      src
    end

    def read_code(file)
      File.open(file, 'r:utf-8') { |f|f.read }
    end

    def read_dsl
      src = File.open(ORENONO_FILE) { |f|f.read } if File.exist?(ORENONO_FILE)
      dsl = Orenono::Dsl.new
      dsl.instance_eval src if File.exist?(ORENONO_FILE)
      dsl
    end
  end
end
