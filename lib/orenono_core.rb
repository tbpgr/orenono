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
      src = read_dsl
      dsl = Orenono::Dsl.new
      dsl.instance_eval src if File.exist?(ORENONO_FILE)
      code = File.open(file, 'r:utf-8') { |f|f.read }
      ob = Orenono::Brain.new(dsl.orenono, code)
      ob.run
    end

    private

    def read_dsl
      File.open(ORENONO_FILE) { |f|f.read } if File.exist?(ORENONO_FILE)
    end
  end
end
