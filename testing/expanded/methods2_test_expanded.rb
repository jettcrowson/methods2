#To setup, add the following to your gem file and run 'bundle':
#
# gem 'minitest'
# gem 'minitest-reporters'
require './testing/test_setup'
require './methods2'

describe 'methods2' do
	describe 'elevenish?' do
		it 'true for 11' do
			elevenish?(11).must_equal(true)
		end
		it 'true for 22' do
			elevenish?(22).must_equal(true)
		end
		it 'true for 21' do
			elevenish?(22).must_equal(true)
		end
		it 'false for 13' do
			elevenish?(13).must_equal(false)
		end
		it 'true for -11' do
			elevenish?(-11).must_equal(true)
		end
		it 'true for -34' do
			elevenish?(-34).must_equal(true)
		end
		it 'false for -18' do
			elevenish?(-18).must_equal(false)
		end
	end
	describe 'ice_cream_party?' do
		it 'party is good with 5 of each(1)' do
			ice_cream_party?(5,5).must_equal(1)
		end
		it 'party is good with 200 ice cream and 201 candies(1)' do
			ice_cream_party?(200,201).must_equal(1)
		end
		it 'party is great with 5 ice cream and 10 candies(2)' do
			ice_cream_party?(5,10).must_equal(2)
		end
		it 'party is great with 2135 ice creams and 6 candies(2)' do
			ice_cream_party?(2135,6).must_equal(2)
		end
		it 'party is bad with 1 ice cream and 2343 candies(0)' do
			ice_cream_party?(1,2343).must_equal(0)
		end
		it 'party is bad with 2 ice creams and 4 candies(0)' do
			ice_cream_party?(2,4).must_equal(0)
		end
	end
	describe 'successful_squirrel_party?' do
		it 'Party is successful on weekend with 40 nuts' do
			successful_squirrel_party?(40,true).must_equal(true)
		end
		it 'Party is successful on weekend with 200 nuts' do
			successful_squirrel_party?(200,true).must_equal(true)
		end
		it 'Party is successful on weekday with 40 nuts' do
			successful_squirrel_party?(40,false).must_equal(true)
		end
		it 'Party is not successful on weekday with 200 nuts' do
			successful_squirrel_party?(200,false).must_equal(false)
		end
		it 'Party is successful on weekday with 60 nuts' do
			successful_squirrel_party?(60,false).must_equal(true)
		end
		it 'Party is not successful on weekday with 12 nuts' do
			successful_squirrel_party?(12,false).must_equal(false)
		end
		it 'Party is not successful on weekend with 12 nuts' do
			successful_squirrel_party?(12,true).must_equal(false)
		end
	end
	describe 'ticket' do
		it '10 when b is 6 and c is 4' do
			ticket(12,6,4).must_equal(10)
		end
		it '10 when a is 1 and b is 9' do
			ticket(1,9,1).must_equal(10)
		end
		it '10 when a is 7 and c is 3' do
			ticket(7,1,3).must_equal(10)
		end
		it '5 when a is 23, b is 17, c is 13' do
			ticket(23,17,13).must_equal(5)
		end
		it '5 when a is 4, b is 20, c is 10' do
			ticket(4,20,10).must_equal(5)
		end
		it '0 when a is 1, b is 12, and c is 3' do
			ticket(1,12,3).must_equal(0)
		end
	end
	describe 'in_order?' do
		it 'They are bigger if given 1, 2, 3, and false' do
			in_order?(1,2,3,false).must_equal(true)
		end
		it 'They are bigger if given 1, 2, 3, and true' do
			in_order?(1,2,3,true).must_equal(true)
		end
		it 'They are bigger if given 1, 0, 3, and true' do
			in_order?(1,0,3,true).must_equal(true)
		end
		it 'They are not bigger if given 1, 2, 3, and false' do
			in_order?(1,0,3,false).must_equal(false)
		end
		it 'They are not bigger if given 2, 1, 0 and false' do
			in_order?(2,1,0,false).must_equal(false)
		end
		it 'They are not bigger if given 2, 1, 0 and true' do
			in_order?(2,1,0,true).must_equal(false)
		end
	end
	describe 'less_by_ten?' do
		it 'less by ten when 1, 23, 12' do
			less_by_ten?(1,23,12).must_equal(true)
		end
		it 'less by ten when 13, 8, 30' do
			less_by_ten?(13,8,30).must_equal(true)
		end
		it 'not less by ten when 1, 2, 3' do
			less_by_ten?(1,2,3).must_equal(false)
		end
		it 'less by ten when 1, 2, 300' do
			less_by_ten?(1,2,300).must_equal(true)
		end
	end
	describe 'fizz_string' do
		it 'firetruck returns Fizz' do
			fizz_string('firetruck').must_equal('Fizz')
		end
		it 'dab returns Buzz' do
			fizz_string('dab').must_equal('Buzz')
		end
		it 'fib returns FizzBuzz' do
			fizz_string('fib').must_equal('FizzBuzz')
		end
		it 'Fib returns FizzBuzz' do
			fizz_string('Fib').must_equal('FizzBuzz')
		end
		it 'call returns call' do
			fizz_string('call').must_equal('call')
		end
	end
	describe 'first_last_six?' do
		it 'array does have 6 as a first or last element' do
			first_last_six?([1,2,3,4,5,6]).must_equal(true)
		end
		it 'array does have 6 as a first or last element' do
			first_last_six?([6,5,4,3,2,1]).must_equal(true)
		end
		it 'array does not have 6 as a first or last element' do
			first_last_six?([1,2,3]).must_equal(false)
		end
		it 'array does not have 6 as a first or last element' do
			first_last_six?([3]).must_equal(false)
		end
		it 'array does have 6 as a first or last element' do
			first_last_six?([6]).must_equal(true)
		end
	end
end
