# encoding: utf-8
require 'orenono_dsl_model'

module Orenono
  # Dsl
  class Dsl
    attr_accessor :orenono

    # String Define
    [
      :increment, :decrement, :start_loop, :end_loop, :next_cursol,
      :previous_cursol, :display, :read].each do |f|
      define_method f do |value|
        @orenono.send("#{f}=", value)
      end
    end

    def initialize
      @orenono = Orenono::DslModel.new
      @orenono.increment = '+'
      @orenono.decrement = '-'
      @orenono.start_loop = '['
      @orenono.end_loop = ']'
      @orenono.next_cursol = '>'
      @orenono.previous_cursol = '<'
      @orenono.display = '.'
      @orenono.read = ','
    end
  end
end
