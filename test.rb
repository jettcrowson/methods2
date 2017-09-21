#To setup, add the following to your gem file and run 'bundle':
#
# gem 'minitest'
# gem 'minitest-reporters'
require './test_setup'
require './methods2'

describe 'methods2' do
	describe 'elevenish?' do
		it 'false for -18' do
			elevenish?(-18).must_equal(false)
		end
		it 'true for -34' do
			elevenish?(-34).must_equal(true)
		end
		it 'true for -11' do
			elevenish?(-11).must_equal(true)
		end
		it 'false for 13' do
			elevenish?(13).must_equal(false)
		end
		it 'true for 21' do
			elevenish?(22).must_equal(true)
		end
		it 'true for 22' do
			elevenish?(22).must_equal(true)
		end
		it 'true for 11' do
			elevenish?(11).must_equal(true)
		end
	end
	describe 'ice_cream_party?' do
		it 'party is bad with 2 ice creams and 4 candies(0)' do
			ice_cream_party?(2,4).must_equal(0)
		end
		it 'party is bad with 1 ice cream and 2343 candies(0)' do
			ice_cream_party?(1,2343).must_equal(0)
		end
		it 'party is great with 2135 ice creams and 6 candies(2)' do
			ice_cream_party?(2135,6).must_equal(2)
		end
		it 'party is great with 5 ice cream and 10 candies(2)' do
			ice_cream_party?(5,10).must_equal(2)
		end
		it 'party is good with 200 ice cream and 201 candies(1)' do
			ice_cream_party?(200,201).must_equal(1)
		end
		it 'party is good with 5 of each(1)' do
			ice_cream_party?(5,5).must_equal(1)
		end
	end
end
