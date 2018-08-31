# O(n^2)
def bad_two_sum?(arr, target)
  arr.each do |i|
    arr.each do |j|
      next if i == j
      return true if i + j == target
    end
  end
  return false
end

arr = [0, 1, 5, 7]
p bad_two_sum?(arr, 6) # => should be true
p bad_two_sum?(arr, 10) # => should be false

#O(nlogn) + O(n) ==> O(nlogn)
def okay_two_sum?(arr, target)
  sorted = quick_sort(arr)

  arr.each_with_index do |el, idx|
    p current = target - el
    bruh = bsearch(arr, current)
    next if bruh == idx
    return true unless bruh.nil?
  end

  return false
end

def quick_sort(arr)
  return arr if arr.length <= 1
  pivot = arr.first
  left = arr[1..-1].select { |el| el <= pivot }
  right = arr[1..-1].select { |el| el > pivot }

  quick_sort(left) + [pivot] + quick_sort(right)
end

def bsearch(arr, target)
  return nil if arr.length == 0

  mid = arr.length / 2

  case arr[mid] <=> target
  when 0
    return mid
  when 1
    return bsearch(arr.dup.take(mid), target)
  when -1
    search_res = bsearch(arr.dup.drop(mid + 1), target)
    search_res.nil? ? nil : mid + 1 + search_res
  end
end

def two_sum_hashish(array,target)
  results = Hash.new { |hash, key| hash[key] = 0 }

end
