def quick_sort(arr)
    return arr if arr.length <= 1
    pivot_arr = [arr.first]
    left_side = arr[1..-1].select { |el| el < arr.first}
    right_side = arr[1..-1].select { |el| el >= arr.first}
    p arr
    p "(" +left_side.join(" ")+ ") " + pivot_arr.join(" ") + " (" +right_side.join(" ")+ ")"
    quick_sort(left_side) + pivot_arr + quick_sort(right_side)
end

x = [4, 2, 3, 7, 5, 3, 1]

p quick_sort(x)


