def algorithm_01(number)
  response = []
  if number %3 == 0
    response.push("Fizz")
  elsif number %5 == 0
    response.push("Buzz")
  elsif number %3 == 0 && number %5 == 0
    response.push("FizzBuzz")
  else
    response.push(number)
  end
  puts response
end

def algorithm_02(word)
end

def algorithm_03(word)
end

def algorithm_04(text)
end
