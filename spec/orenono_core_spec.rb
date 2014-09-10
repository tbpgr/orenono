# encoding: utf-8
require "spec_helper"
require "orenono_core"
require "orenono_dsl_model"

describe Orenono::Core do
  context :convert do
    cases = [
      {
        case_no: 1,
        case_title: "valid case",
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
        src: '++--[[]]>><<..,,',
        bf_to_your: true,
        expected: 'addadddiffdiffstartstartendendnextnextpreviouspreviousdisplaydisplayreadread'
      },
    ]

    cases.each do |c|
      it "|case_no=#{c[:case_no]}|case_title=#{c[:case_title]}" do
        begin
          case_before c

          # -- given --
          orenono_core = Orenono::Core.new

          # -- when --
          actual = orenono_core.send(:convert, c[:config], c[:src], c[:config].default_syntaxes, c[:config].syntaxes)

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
