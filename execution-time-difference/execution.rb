# Phase I
# def my_min1(arr)
#   smallest_value = arr[0]
#
#   arr.each do |num1|
#     arr.each do |num2|
#       if num1 < num2
#           smallest_value = num1
#       end
#     end
#   end
# end

# so terribad we won't try to emulate this behavior
def my_min_1a(list)
  min_num = nil

  list.each do |num1|
    dup_list = list.dup
    dup_list.delete(num1)
    min_num = num1 if dup_list.all? { |num2| num2 > num1 }
  end

  min_num
end

# actually our code
# Phase II
# O(n) runtime
def my_min2(arr)

  smallest_value = arr[0]

  arr.each do |num|
    smallest_value = num if num < smallest_value
  end

  smallest_value
end

# [5, 3, -7]
# PHASE I
def largest_contiguous_subsum_1(arr)
  results = []

  arr.each_index do |idx1|
   arr.each_index do |idx2| # [idx1+1..-1]
      results << arr[idx1..idx2].sum unless arr[idx1..idx2].empty?#.sum#.sum #if arr[idx1..idx2].length > 1
   end
 end

  results.max
end

# PHASE II

def largest_contiguous_subsum_2(arr)
  max_sum = arr.first
  current_sum = 0

  el_or_sum = 0

  arr.each_with_index do |el,idx|

    #update current sum (prev sum + current el)
    current_sum += el
    #check current sum . check el, check max. determine greatest
    p "current_sum is #{current_sum}"
    p "current el is #{el}"
    p "current max is #{max_sum}"
    el_or_sum = current_sum > el ? current_sum : el
    p "max of the two is #{el_or_sum}"
    max_sum = el_or_sum if el_or_sum > max_sum
    #if current sum is less than el. reset current sum
    #if current el is greater than max, update max

    #this doesn't freaking work
    current_sum = 0 if max_sum < el
  end

  max_sum
end

# def largest_contiguous_subsum_2(arr)
#   # core design
#   # temp = arr.dup
#   # n.times do
#   #   temp.shift
#   # end
#
# end
# def largest_contiguous_subsum_2(arr)
#   # largest = arr[0]
#   #
#   # # idx_start = 0
#   # # while idx_start < arr.length
#   # #   largest = arr[idx_start..-1].sum if arr[idx_start..-1].sum > largest
#   # #   idx_start += 1
#   # # end
#   # #
#   # # idx_stop = arr.length - 1
#   # # until idx_stop == 0
#   # #   largest = arr[0..idx_stop].sum if arr[0..idx_stop].sum > largest
#   # #   idx_stop -= 1
#   # # end
#   #
#   # largest
# end
