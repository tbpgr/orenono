# encoding: utf-8

# rubocop:disable LineLength
module Orenono
  # DslModel
  class DslModel
    # increment command
    attr_accessor :increment
    # decrement command
    attr_accessor :decrement
    # start_loop command
    attr_accessor :start_loop
    # end_loop command
    attr_accessor :end_loop
    # next_cursol command
    attr_accessor :next_cursol
    # previous_cursol command
    attr_accessor :previous_cursol
    # display command
    attr_accessor :display
    # read command
    attr_accessor :read

    def syntaxes
      [
        @increment, @decrement, @start_loop, @end_loop,
        @next_cursol, @previous_cursol, @display, @read
      ]
    end

    def default_syntaxes
      %w(+ - [ ] > < . ,)
    end

    def token_patterns
      instance_variables.map do |key|
        sap_key = instance_variable_get(key)
        '+.[]'.split('').include?(sap_key) ? "\\#{sap_key}" : sap_key
      end.join('|')
    end
  end
end
