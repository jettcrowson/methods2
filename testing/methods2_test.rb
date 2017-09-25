require_relative "test_maker"

t = Test.new
t.setup
t.create("methods2")
    t.new_test("elevenish?")
    t.function_test([
        t.test("true for 11", [11], true),
        t.test("true for 22", [22], true),
        t.test("true for 21", [22], true),
        t.test("false for 13", [13], false),
        t.test("true for -11", [-11], true),
        t.test("true for -34", [-34], true),
        t.test("false for -18", [-18], false)
    ])
    t.new_test("ice_cream_party?")
    t.function_test([
        t.test("party is good with 5 of each(1)", [5, 5], 1),
        t.test("party is good with 200 ice cream and 201 candies(1)", [200,201], 1),
        t.test("party is great with 5 ice cream and 10 candies(2)", [5,10], 2),
        t.test("party is great with 2135 ice creams and 6 candies(2)", [2135, 6], 2),
        t.test("party is bad with 1 ice cream and 2343 candies(0)", [1, 2343], 0),
        t.test("party is bad with 2 ice creams and 4 candies(0)", [2,4], 0)
    ])
    t.new_test("successful_squirrel_party?")
    t.function_test([
        t.test("Party is successful on weekend with 40 nuts", [40, true], true),
        t.test("Party is successful on weekend with 200 nuts", [200, true], true),
        t.test("Party is successful on weekday with 40 nuts", [40, false], true),
        t.test("Party is not successful on weekday with 200 nuts", [200, false], false),
        t.test("Party is successful on weekday with 60 nuts", [60, false], true),
        t.test("Party is not successful on weekday with 12 nuts", [12, false], false),
        t.test("Party is not successful on weekend with 12 nuts", [12, true], false)
    ])
    t.new_test("ticket")
    t.function_test([
        t.test("10 when b is 6 and c is 4", [12, 6, 4], 10),
        t.test("10 when a is 1 and b is 9", [1, 9, 1], 10),
        t.test("10 when a is 7 and c is 3", [7, 1, 3], 10),
        t.test("5 when a is 23, b is 17, c is 13", [23, 17, 13], 5),
        t.test("5 when a is 4, b is 20, c is 10", [4, 20, 10], 5),
        t.test("0 when a is 1, b is 12, and c is 3", [1, 12, 3], 0)
    ])
    t.new_test("in_order?")
    t.function_test([
        t.test("They are bigger if given 1, 2, 3, and false", [1,2,3,false], true),
        t.test("They are bigger if given 1, 2, 3, and true", [1,2,3,true], true),
        t.test("They are bigger if given 1, 0, 3, and true", [1,0,3,true], true),
        t.test("They are not bigger if given 1, 2, 3, and false", [1,0,3,false], false),
        t.test("They are not bigger if given 2, 1, 0 and false", [2, 1, 0, false], false),
        t.test("They are not bigger if given 2, 1, 0 and true", [2,1, 0, true], false)
    ])
    t.new_test("less_by_ten?")
    t.function_test([
        t.test("less by ten when 1, 23, 12", [1, 23, 12], true),
        t.test("less by ten when 13, 8, 30", [13, 8, 30], true),
        t.test("not less by ten when 1, 2, 3", [1, 2, 3], false),
        t.test("less by ten when 1, 2, 300", [1, 2, 300], true)
    ])
t.write(File.basename(__FILE__))
