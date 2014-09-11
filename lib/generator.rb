# encoding: utf-8
require 'orenono_dsl'
require 'orenono_dsl_model'

# rubocop:disable LineLength
module Orenono
  # Brainf*ck code generator
  class Generator
    attr_reader :tables, :init_codes, :pointer, :config

    def self.generate(text, config)
      bf = new(text[0], config)
      text.split('').map(&:ord).each_with_object([bf.init_codes]) do |char, codes|
        codes << bf.diff(char)
        codes << bf.output
      end.join
    end

    def initialize(char, config)
      char_code = char.ord
      repeat = char_code / 10
      rest = char_code % 10
      @tables = []
      @pointer = 0
      @config = config
      @init_codes = ten_increment(config) +
                    config.start_loop +
                    config.next_cursol +
                    increment(repeat) +
                    config.previous_cursol +
                    config.decrement +
                    config.end_loop +
                    config.next_cursol +
                    increment(rest)
      @tables[@pointer] = char_code
    end

    def increment(count = 1)
      @tables[@pointer] = 0 unless @tables[@pointer]
      @tables[@pointer] += count
      @config.increment * count
    end

    def decrement(count = 1)
      @tables[@pointer] -= count
      @config.decrement * count
    end

    def diff(char_code)
      diff_of_code = char_code - @tables[@pointer]
      return '' if diff_of_code.zero?
      @tables[@pointer] += diff_of_code
      diff_of_code > 0 ? (@config.increment * diff_of_code) : (@config.decrement * diff_of_code.abs)
    end

    def next_pointer(count = 1)
      @pointer += count
      @config.next_cursol * count
    end

    def previous_pointer(count = 1)
      @pointer -= count
      @config.previous_cursol * count
    end

    def output(count = 1)
      @config.display * count
    end

    private

    def ten_increment(config)
      config.increment * 10
    end
  end
end
# rubocop:enable LineLength
