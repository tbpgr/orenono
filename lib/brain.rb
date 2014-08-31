# encoding: utf-8
require 'orenono_dsl'
require 'orenono_dsl_model'

module Orenono
  # Brain
  class Brain
    attr_reader :config, :tokens, :src, :tape
    attr_reader :memory_cursol, :loop_stack, :code_cursol

    def initialize(config, src = '')
      @config = config
      @src = src
      @tokens = @src.scan(/#{@config.token_patterns}/)
      @tape = Array.new(65_535) { 0 }
      @memory_cursol = 0
      @code_cursol = 0
      @loop_stack = []
    end

    # rubocop:disable CyclomaticComplexity, MethodLength
    def run
      loop do
        token = @tokens[@code_cursol]
        case token
        when @config.increment
          increment
          @code_cursol += 1
        when @config.decrement
          decrement
          @code_cursol += 1
        when @config.start_loop
          start_loop
        when @config.end_loop
          end_loop
        when @config.next_cursol
          next_cursol
          @code_cursol += 1
        when @config.previous_cursol
          previous_cursol
          @code_cursol += 1
        when @config.display
          display
          @code_cursol += 1
        when @config.read
          read
          @code_cursol += 1
        end
        break if @code_cursol >= @tokens.size
      end
    end
    # rubocop:enable CyclomaticComplexity, MethodLength

    def increment
      @tape[@memory_cursol] += 1
    end

    def decrement
      fail InvalidMemoryAccessError if @tape[@memory_cursol].zero?
      @tape[@memory_cursol] -= 1
    end

    def start_loop
      @loop_stack << @code_cursol
      return goto_end_loop_next if @tape[@memory_cursol] == 0
      @code_cursol += 1
    end

    def goto_end_loop_next
      hit_cnt = 0
      index = 0
      @tokens[@code_cursol..-1].each_with_index do |token, i|
        hit_cnt += 1 if token == @config.end_loop
        next unless hit_cnt == @loop_stack.size
        index = i + @code_cursol
        break
      end
      @loop_stack.pop
      @code_cursol = index + 1
    end

    def end_loop
      fail InvalidLoopError, 'Invalid Loop.' if @loop_stack.empty?
      @code_cursol = @loop_stack.pop
    end

    def next_cursol
      @memory_cursol += 1
    end

    def previous_cursol
      fail InvalidCursolError, 'Invalid Cursol.' if @memory_cursol.zero?
      @memory_cursol -= 1
    end

    def display
      putc @tape[@memory_cursol]
    end

    def read
      @tape[@memory_cursol] = STDIN.readchar.ord
    end
  end

  class InvalidMemoryAccessError < StandardError; end
  class InvalidLoopError < StandardError; end
  class InvalidCursolError < StandardError; end
end
