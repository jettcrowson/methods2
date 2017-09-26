########################################
#
# Methods2
#	
#	Instructions and definitions here: 
#	
#	github.com/mvhs-apcs/methods2
#
#	Write the tests first!
#	Then implement each function.
#
#	Don't forget to commit after each
#	method.
#
########################################


# TODO - write elevenish?
    
def elevenish?(int)
    return int % 11 == 0 || (int + 1) % 11 == 0 ? true : false
end


# TODO - write ice_cream_party?

def ice_cream_party?(ice_cream, candy)
    if ice_cream < 5 || candy < 5
        return 0
    elsif (ice_cream / candy) >= 2 || (candy / ice_cream) >= 2
        return 2
    else
        return 1
    end
end

# TODO - write successful_squirrel_party?

def successful_squirrel_party?(nuts, is_weekend)
    if nuts < 40
        return false
    elsif nuts <= 60 
        return true
    else
        return is_weekend ? true : false
    end
end

# TODO - write ticket

def ticket(a, b, c)
    if a + b == 10 || a + c == 10 || b + c == 10
        return 10
    elsif a + b == a + c + 10 || a + b == b + c + 10
        return 5
    else
        return 0
    end
end

# TODO - write in_order?

def in_order?(a, b, c, bOK)
    return (b > a && c > b) || (bOK && c > b) ? true : false
end

# TODO - write less_by_ten?

def less_by_ten?(a, b, c)
    return a - b >= 10 || a - c >= 10 || b - a >= 10 || b - c >= 10 || c - a >= 10 || c - b >= 10 ? true : false
end

# TODO - write fizz_string

def fizz_string(str)
    if str.downcase[0] == "f" && str.downcase[-1] == "b"
        return "FizzBuzz"
    elsif str.downcase[0] == "f"
        return "Fizz"
    elsif str.downcase[-1] == "b"
        return "Buzz"
    else
        return str
    end
end

# TODO - write first_last_six?

def first_last_six?(num_list)
    return num_list[1] == 6 || num_list[-1] == 6 ? true : false
end

# TODO - write rotate_left

# TODO - write double23?
