require_relative "test_maker"

t = Test.new
t.setup
t.create("methods2")
    t.new_test("elevenish?")
    t.function_test([
        t.minitest("true for 11", [11], true),
        t.minitest("true for 22", [22], true),
        t.minitest("true for 21", [22], true),
        t.minitest("false for 13", [13], false),
        t.minitest("true for -11", [-11], true),
        t.minitest("true for -34", [-34], true),
        t.minitest("false for -18", [-18], false)
    ])
    t.new_test("ice_cream_party?")
    t.function_test([
        t.minitest("party is good with 5 of each(1)", [5, 5], 1),
        t.minitest("party is good with 200 ice cream and 201 candies(1)", [200,201], 1),
        t.minitest("party is great with 5 ice cream and 10 candies(2)", [5,10], 2),
        t.minitest("party is great with 2135 ice creams and 6 candies(2)", [2135, 6], 2),
        t.minitest("party is bad with 1 ice cream and 2343 candies(0)", [1, 2343], 0),
        t.minitest("party is bad with 2 ice creams and 4 candies(0)", [2,4], 0)
    ])
    t.new_test("successful_squirrel_party?")
    t.function_test([
        t.minitest("Party is successful on weekend with 40 nuts", [40, true], true),
        t.minitest("Party is successful on weekend with 200 nuts", [200, true], true),
        t.minitest("Party is successful on weekday with 40 nuts", [40, false], true),
        t.minitest("Party is not successful on weekday with 200 nuts", [200, false], false),
        t.minitest("Party is successful on weekday with 60 nuts", [60, false], true),
        t.minitest("Party is not successful on weekday with 12 nuts", [12, false], false),
        t.minitest("Party is not successful on weekend with 12 nuts", [12, true], false)
    ])
    t.new_test("ticket")
    t.function_test([
        t.minitest("10 when b is 6 and c is 4", [12, 6, 4], 10),
        t.minitest("10 when a is 1 and b is 9", [1, 9, 1], 10),
        t.minitest("10 when a is 7 and c is 3", [7, 1, 3], 10),
        t.minitest("5 when a is 12, b is 8, c is 2", [12, 8, 2], 5),
        t.minitest("5 when a is 4, b is 20, c is 10", [4, 20, 10], 5)
    ])
t.write(File.basename(__FILE__))
