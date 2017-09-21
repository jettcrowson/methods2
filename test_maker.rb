class Test
    def initialize
        @to_write = []
        @ends = 0
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
    def function_test(function_name)
        @to_write.insert(-2,"\tdescribe '#{function_name}' do", "\tend")
    end
    def minitest(function_name, test_desc, parameters, must_equal)
        spot = @to_write.index("\tdescribe '#{function_name}' do") + 1
        @to_write.insert(spot, "\t\tit '#{test_desc}' do")
        spot += 1
        @to_write.insert(spot, "\t\t\t#{function_name}(#{parameters.join(',')}).must_equal(#{must_equal})")
        spot += 1
        @to_write.insert(spot, "\t\tend")
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
    end
    def run(file_name)
        system("ruby #{file_name}.rb")
    end

end


