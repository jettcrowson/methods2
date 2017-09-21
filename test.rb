require './test_setup'
require './methods2'


describe 'Methods2' do
  describe "elevenish?" do

    it "true for 11" do
      elevenish?(11).must_equal(true)
    end

    it "true for 22" do
      elevenish?(22).must_equal(true)
    end    

    it "true for 23" do
      elevenish?(23).must_equal(true)
    end

    it "false for 13" do
      elevenish?(13).must_equal(false)
    end

    it "true for -11" do
      elevenish?(-11).must_equal(true)
    end

    it "true for -32" do
      elevenish?(-32).must_equal(true)
    end

    it "false for -18" do
      elevenish?(-18).must_equal(false)
    end

  end
end
