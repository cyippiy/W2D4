def anagram?(str1,str2)

end

def first_anagram?(string, other_string)
  all_kinds_of_shit = string.split("").permutation

  all_kinds_of_shit.map! { |arr| arr.join("") }

  all_kinds_of_shit.include?(other_string)
end

# O(n) * O(1) = O(n)
def second_anagram?(string, other_string)
  other_arr = other_string.chars
  string.length.times do |idx|
    idx_destroy = other_arr.index(string[idx])
    return false if idx_destroy.nil?
    other_arr.delete_at(idx_destroy)
  end

  return true if other_arr.empty?
  return false
end

# quick sort at best = O(n)
# at worst it's quadratic, O(n^2)
def third_anagram?(string, other_string)
  string.split("").sort == other_string.split("").sort
end

# O(2n) ===> O(n)
def fourth_anagram?(string, other_string)
  hash = Hash.new { |hash, key| hash[key] = 0 }
  string.each_char do |char|
    hash[char] += 1
  end

  other_hash = Hash.new { |hash, key| hash[key] = 0 }
  other_string.each_char do |char|
    other_hash[char] += 1
  end

  hash == other_hash
end

# O(3n) ===> O(n)
def fifth_anagram?(string, other_string)
  hash = Hash.new { |hash, key| hash[key] = 0 }
  string.each_char do |char|
    hash[char] += 1
  end

  other_string.each_char do |char|
    hash[char] -= 1
  end

  hash.values.all? { |value| value == 0 }
end
