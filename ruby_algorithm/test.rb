def algorithm_04(text)
  t = text.split(' ').map { |word| word.gsub(',', '').gsub('.', '') }
  answer = t.map { |word| word.length }
  return answer
end

algorithm_04("Hello, my name is John.")
