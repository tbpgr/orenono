# encoding: utf-8
require 'spec_helper'
require 'generator'

# rubocop:disable Tab, UnusedMethodArgument, LineLength
describe Orenono::Generator do
  context :generate do
    cases = [
      {
        case_no: 1,
        case_title: 'default case',
        config: Orenono::DslModel.new.tap do |e|
          e.increment = '+'
          e.decrement = '-'
          e.start_loop = '['
          e.end_loop = ']'
          e.next_cursol = '>'
          e.previous_cursol = '<'
          e.display = '.'
          e.read = ','
        end,
        text: 'Hello, world!',
        expected: '++++++++++[>+++++++<-]>++.+++++++++++++++++++++++++++++.+++++++..+++.-------------------------------------------------------------------.------------.+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++.--------.+++.------.--------.-------------------------------------------------------------------.'
      },
      {
        case_no: 2,
        case_title: 'original case',
        config: Orenono::DslModel.new.tap do |e|
          e.increment = 'add'
          e.decrement = 'diff'
          e.start_loop = 'start'
          e.end_loop = 'end'
          e.next_cursol = 'next'
          e.previous_cursol = 'previous'
          e.display = 'display'
          e.read = 'read'
        end,
        text: 'Hello, world!',
        expected: 'addaddaddaddaddaddaddaddaddaddstartnextaddaddaddaddaddaddaddpreviousdiffendnextaddadddisplayaddaddaddaddaddaddaddaddaddaddaddaddaddaddaddaddaddaddaddaddaddaddaddaddaddaddaddaddadddisplayaddaddaddaddaddaddadddisplaydisplayaddaddadddisplaydiffdiffdiffdiffdiffdiffdiffdiffdiffdiffdiffdiffdiffdiffdiffdiffdiffdiffdiffdiffdiffdiffdiffdiffdiffdiffdiffdiffdiffdiffdiffdiffdiffdiffdiffdiffdiffdiffdiffdiffdiffdiffdiffdiffdiffdiffdiffdiffdiffdiffdiffdiffdiffdiffdiffdiffdiffdiffdiffdiffdiffdiffdiffdiffdiffdiffdiffdisplaydiffdiffdiffdiffdiffdiffdiffdiffdiffdiffdiffdiffdisplayaddaddaddaddaddaddaddaddaddaddaddaddaddaddaddaddaddaddaddaddaddaddaddaddaddaddaddaddaddaddaddaddaddaddaddaddaddaddaddaddaddaddaddaddaddaddaddaddaddaddaddaddaddaddaddaddaddaddaddaddaddaddaddaddaddaddaddaddaddaddaddaddaddaddaddaddaddaddaddaddaddaddaddaddaddaddadddisplaydiffdiffdiffdiffdiffdiffdiffdiffdisplayaddaddadddisplaydiffdiffdiffdiffdiffdiffdisplaydiffdiffdiffdiffdiffdiffdiffdiffdisplaydiffdiffdiffdiffdiffdiffdiffdiffdiffdiffdiffdiffdiffdiffdiffdiffdiffdiffdiffdiffdiffdiffdiffdiffdiffdiffdiffdiffdiffdiffdiffdiffdiffdiffdiffdiffdiffdiffdiffdiffdiffdiffdiffdiffdiffdiffdiffdiffdiffdiffdiffdiffdiffdiffdiffdiffdiffdiffdiffdiffdiffdiffdiffdiffdiffdiffdiffdisplay'
      }
    ]

    cases.each do |c|
      it "|case_no=#{c[:case_no]}|case_title=#{c[:case_title]}" do
        begin
          case_before c

          # -- given --
          # nothing

          # -- when --
          actual = Orenono::Generator.generate(c[:text], c[:config])

          # -- then --
          expect(actual).to eq(c[:expected])
        ensure
          case_after c
        end
      end

      def case_before(c)
        # implement each case before
      end

      def case_after(c)
        # implement each case after
      end
    end
  end
end
# rubocop:enable Tab, UnusedMethodArgument, LineLength
