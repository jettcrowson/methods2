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
        @to_write.push("require './test_setup'")
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
    def minitest(test_desc, parameters, must_equal)
        minitest_lines = []
        minitest_lines.push("\t\tit '#{test_desc}' do")
        minitest_lines.push("\t\t\t#{@function_name}(#{parameters.join(',')}).must_equal(#{must_equal})")
        minitest_lines.push("\t\tend")

        return minitest_lines
    end
    def setup
        setup_file = File.new("test_setup.rb", "w")
        setup_file.puts("require 'minitest/autorun'")
        setup_file.puts("require 'minitest/reporters'")
        setup_file.puts("reporter_options = { color: true }")
        setup_file.puts("Minitest::Reporters.use! [Minitest::Reporters::DefaultReporter.new(reporter_options)]")
        setup_file.close
    end
    def write(file_name)
        test_file = File.new("#{file_name}.rb", "w")
        @to_write.each{ |line| test_file.puts(line)}
        test_file.close

        run(file_name)
    end
    def run(file_name)
        system("ruby #{file_name}.rb")
    end

end


