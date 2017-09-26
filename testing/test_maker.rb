# TO USE:
# test_variable = Test.new
# test_variable.setup
# test_variable.create("file to test")
#
# For each function to test
# test_variable.new_test("function to test")
# test_variable.function_test([array filled with minitests, follow each minitest with a comma])
#
# minitests
# test_variable.minitest("describe the expected outcome", [any variables your function needs], expected result)
#
# At the very end
# test_variable.write(File.basename(__FILE__))
require 'fileutils'

class Test
    def initialize
        @to_write = []
        @ends = 0
        @function = ""
    end
    def create(file_name)
        @to_write.push("#To setup, add the following to your gem file and run 'bundle':")
        @to_write.push("#")
        @to_write.push("# gem 'minitest'")
        @to_write.push("# gem 'minitest-reporters'")
        @to_write.push("require './testing/test_setup'")
        @to_write.push("require './#{file_name}'")
        @to_write.push("")
        @to_write.push("describe '#{file_name}' do")
        @ends += 1
        @to_write.push("end")
    end
    def new_test(function_name)
        @function_name = function_name
    end
    def function_test(minitests)
        function_and_minitests = []
        function_and_minitests.push("\tdescribe '#{@function_name}' do")
        minitests.each{ |minitest| minitest.each{ |line| function_and_minitests.push(line)}}
        function_and_minitests.push("\tend")
        function_and_minitests.each{ |to_push| @to_write.insert(-2, to_push)}
    end
    def test(test_desc, parameters, must_equal)
        minitest_lines = []
        parameters_fixed = []

        parameters.each do |param|
            if param.instance_of?(String)
                parameters_fixed.push("'#{param}'")
            elsif param.instance_of?(Array)
                parameters_fixed.push("#{param}")
            else
                parameters_fixed.push(param)
            end
        end

        if must_equal.instance_of?(String)
            must_equal_fixed = "'#{must_equal}'"
        elsif must_equal.instance_of?(Array)
           must_equal_fixed = ("#{must_equal_fixed}")
        else
            must_equal_fixed = must_equal
        end

        must_equal_fixed = must_equal.instance_of?(String) ? "'#{must_equal}'" : must_equal

        minitest_lines.push("\t\tit '#{test_desc}' do")
        minitest_lines.push("\t\t\t#{@function_name}(#{parameters_fixed.join(',')}).must_equal(#{must_equal_fixed})")
        minitest_lines.push("\t\tend")

        return minitest_lines
    end
    def setup
        setup_file = File.new("testing/test_setup.rb", "w")
        setup_file.puts("require 'minitest/autorun'")
        setup_file.puts("require 'minitest/reporters'")
        setup_file.puts("reporter_options = { color: true }")
        setup_file.puts("Minitest::Reporters.use! [Minitest::Reporters::DefaultReporter.new(reporter_options)]")
        setup_file.close
    end
    def write(file_name)
        Dir.mkdir("testing/expanded") unless File.exists?("testing/expanded")

        @parent_file_name = file_name.chop.chop.chop
        test_file = File.new("testing/expanded/#{@parent_file_name}_expanded.rb", "w")
        @to_write.each{ |line| test_file.puts(line)}
        test_file.close

        run(@parent_file_name)
    end
    def run(file_name)
        system("ruby testing/expanded/#{file_name}_expanded.rb")
    end

end


