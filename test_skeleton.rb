require "./test_maker"

t = Test.new
t.setup
t.create("methods2")
    t.function_test("elevenish?")
        t.minitest("elevenish?", "true for 11", [11], true)
        t.minitest("elevenish?", "true for 22", [22], true)
        t.minitest("elevenish?", "true for 21", [22], true)
        t.minitest("elevenish?", "false for 13", [13], false)
        t.minitest("elevenish?", "true for -11", [-11], true)
        t.minitest("elevenish?", "true for -34", [-34], true)
        t.minitest("elevenish?", "false for -18", [-18], false)
    t.function_test("ice_cream_party?")
        t.minitest("ice_cream_party?", "party is good with 5 of each(1)", [5, 5], 1)
        t.minitest("ice_cream_party?", "party is good with 200 ice cream and 201 candies(1)", [200,201], 1)
        t.minitest("ice_cream_party?", "party is great with 5 ice cream and 10 candies(2)", [5,10], 2)
        t.minitest("ice_cream_party?", "party is great with 2135 ice creams and 6 candies(2)", [2135, 6], 2)
        t.minitest("ice_cream_party?", "party is bad with 1 ice cream and 2343 candies(0)", [1, 2343], 0)
        t.minitest("ice_cream_party?", "party is bad with 2 ice creams and 4 candies(0)", [2,4], 0)
t.write("test")
t.run("test")