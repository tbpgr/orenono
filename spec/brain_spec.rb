# encoding: utf-8
require 'spec_helper'
require 'brain'

# rubocop:disable Eval
def capture(st)
  begin
    st = st.to_s
    eval "$#{st} = StringIO.new"
    yield
    result = eval("$#{st}").string
  ensure
    eval("$#{st} = #{st.upcase}")
  end
  result
end
# rubocop:enable Eval

# rubocop:disable Tab, UnusedMethodArgument
describe Orenono::Brain do
  context :increment do
    cases = [
      {
        case_no: 1,
        case_title: 'valid increment',
        expected: 1
      }
    ]

    cases.each do |c|
      it "|case_no=#{c[:case_no]}|case_title=#{c[:case_title]}" do
        begin
          case_before c

          # -- given --
          brain = Orenono::Brain.new(Orenono::Dsl.new.orenono)

          # -- when --
          brain.increment
          actual = brain.tape[brain.memory_cursol]

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

  context :decrement do
    cases = [
      {
        case_no: 1,
        case_title: 'decrement exception',
        increment: 0,
        decrement: 1,
        expect_error: true
      },
      {
        case_no: 2,
        case_title: 'valid decrement',
        increment: 1,
        decrement: 1,
        expected: 0
      }
    ]

    cases.each do |c|
      it "|case_no=#{c[:case_no]}|case_title=#{c[:case_title]}" do
        begin
          case_before c

          # -- given --
          brain = Orenono::Brain.new(Orenono::Dsl.new.orenono)
          c[:increment].times { brain.increment }

          # -- when --
          if c[:expect_error]
            expect  { brain.decrement }.to raise_error(StandardError)
            next
          end
          brain.decrement
          actual = brain.tape[brain.memory_cursol]

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

  context :start_loop do
    cases = [
      {
        case_no: 1,
        case_title: 'valid single start_loop',
        loop_stack: [],
        tape: [1],
        memory_cursol: 0,
        code_cursol: 10,
        expected: [10]
      },
      {
        case_no: 2,
        case_title: 'valid multi start_loop',
        loop_stack: [2],
        tape: [1, 1],
        memory_cursol: 1,
        code_cursol: 0,
        code_cursol: 10,
        expected: [2, 10]
      }
    ]

    cases.each do |c|
      it "|case_no=#{c[:case_no]}|case_title=#{c[:case_title]}" do
        begin
          case_before c

          # -- given --
          brain = Orenono::Brain.new(Orenono::Dsl.new.orenono)
          brain.instance_variable_set(:@loop_stack, c[:loop_stack])
          brain.instance_variable_set(:@memory_cursol, c[:memory_cursol])
          brain.instance_variable_set(:@tape, c[:tape])
          brain.instance_variable_set(:@code_cursol, c[:code_cursol])

          # -- when --
          brain.start_loop
          actual = brain.loop_stack

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

  context :end_loop do
    cases = [
      {
        case_no: 1,
        case_title: 'end_loop exception',
        loop_stack: [],
        expect_error: true
      },
      {
        case_no: 2,
        case_title: 'reloop',
        tape: [0, 1, 2, 1],
        loop_stack: [2],
        expected: 2
      },
      {
        case_no: 3,
        case_title: 'end loop',
        tape: [0, 1, 2, 0, 0],
        loop_stack: [2],
        expected: 2
      }
    ]

    cases.each do |c|
      it "|case_no=#{c[:case_no]}|case_title=#{c[:case_title]}" do
        begin
          case_before c

          # -- given --
          brain = Orenono::Brain.new(Orenono::Dsl.new.orenono)
          brain.instance_variable_set(:@loop_stack, c[:loop_stack])
          brain.instance_variable_set(:@tape, c[:tape])

          # -- when --
          if c[:expect_error]
            expect { brain.end_loop }.to raise_error(StandardError)
            next
          end
          brain.end_loop
          actual = brain.code_cursol

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

  context :next_cursol do
    cases = [
      {
        case_no: 1,
        case_title: 'valid move',
        memory_cursol: 0,
        expected: 1
      }
    ]

    cases.each do |c|
      it "|case_no=#{c[:case_no]}|case_title=#{c[:case_title]}" do
        begin
          case_before c

          # -- given --
          brain = Orenono::Brain.new(Orenono::Dsl.new.orenono)
          brain.instance_variable_set(:@memory_cursol, c[:memory_cursol])

          # -- when --
          brain.next_cursol
          actual = brain.memory_cursol

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

  context :previous_cursol do
    cases = [
      {
        case_no: 1,
        case_title: 'previous memory_cursol exception',
        memory_cursol: 0,
        expect_error: true
      },
      {
        case_no: 2,
        case_title: 'valid move',
        memory_cursol: 1,
        expected: 0
      }
    ]

    cases.each do |c|
      it "|case_no=#{c[:case_no]}|case_title=#{c[:case_title]}" do
        begin
          case_before c

          # -- given --
          brain = Orenono::Brain.new(Orenono::Dsl.new.orenono)
          brain.instance_variable_set(:@memory_cursol, c[:memory_cursol])

          # -- when --
          if c[:expect_error]
            expect { brain.previous_cursol }.to raise_error(StandardError)
            next
          end
          brain.previous_cursol
          actual = brain.memory_cursol

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

  context :display do
    cases = [
      {
        case_no: 1,
        case_title: 'case_title',
        tape: [65],
        memory_cursol: 0,
        expected: 'A'
      }
    ]

    cases.each do |c|
      it "|case_no=#{c[:case_no]}|case_title=#{c[:case_title]}" do
        begin
          case_before c

          # -- given --
          brain = Orenono::Brain.new(Orenono::Dsl.new.orenono)
          brain.instance_variable_set(:@tape, c[:tape])
          brain.instance_variable_set(:@memory_cursol, c[:memory_cursol])

          # -- when & then --
          capture(:stdout) { brain.display }.should == c[:expected]
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
# rubocop:enable Tab, UnusedMethodArgument
