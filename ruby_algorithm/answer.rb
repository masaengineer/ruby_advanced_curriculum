def algorithm_01(number)
  response = []
  1.upto(number) do |i|
    if i %3 == 0 && i %5 == 0
      response.push("らんてくん")
    elsif i %5 == 0
      response.push("くん")
    elsif i %3 == 0
      response.push("らんて")
    else
      response.push(i)
    end
  end
  return response
end

def algorithm_02(word)
  reversed_array = []
  word.each_char do |char|
    reversed_array.unshift(char) # 先頭に追加して逆順に
  end
  reversed_array.join # 配列を文字列に結合
end

def algorithm_03(word)
  odd = []
  even = []
  w = word.split('')
  w.each_with_index do |v, i|
    if (i+1) % 2 == 0
      even.push(v)
    else
      odd.push(v)
    end
  end
  odd.join + even.join
end

def algorithm_04(text)
  t = text.split(' ').map { |word| word.gsub(',', '').gsub('.', '') }
  answer = t.map { |word| word.length }
  return answer
end
