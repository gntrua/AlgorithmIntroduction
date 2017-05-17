def Select(list, left, right, n)
    loop do
        if left == right
            return left
        end
        pivotIndex = pivot(list, left, right)
        pivotIndex = partition(list, left, right , pivotIndex)
        if n == pivotIndex
            return n
        elsif n < pivotIndex
            right = pivotIndex - 1
        else
            left = pivotIndex + 1
        end
    end
end

def partition(list, left, right, pivotIndex)
    pivotValue = list[pivotIndex]
    swap(list, pivotIndex, right)
    storeIndex = left
    for i in left..(right - 1)
        if list[i] < pivotValue
            swap(list, storeIndex, i)
            storeIndex += 1
        end
    end
    swap(list, right, storeIndex)
    return storeIndex
end

def partition5(list, left, right)
    i = list.index(list[left..right].sort![(right-left)/2])
end

def pivot(list, left, right)
    if right - left < 5
        return partition5(list,left,right)
    end
    i = left
    while i <= right
        subRight = [i+4, right].min
        median5 = partition5(list,i,subRight)
        swap(list, median5, (left + (i - left)/5))
        i += 5
    end
    p list
    return Select(list, left, left + ((right - left)/5.0).ceil - 1,left + (right - left)/10)
end


def swap(arr,a,b)
    temp = arr[a]
    arr[a] = arr[b]
    arr[b] = temp
end


a = [92, 72, 21, 59, 94, 36, 70, 90, 27, 53, 88, 28, 50, 9, 75, 91, 21, 20, 52, 98, 95, 87, 4, 72, 47, 49, 42, 20, 22, 25, 33, 84, 58, 94,47, 1, 54, 98, 97, 55, 3, 32, 95, 50, 87, 66, 69, 84, 31, 56, 53, 37, 65, 52, 75, 70, 36, 90, 71, 97, 84, 55, 59, 73, 75, 86, 11, 41, 50, 16, 45, 6, 31, 18, 17, 69, 15, 9, 23, 33, 71, 63, 9, 57, 19, 55, 35, 40, 57, 1, 7, 51, 43, 36, 11, 98, 86, 67, 91, 34].shuffle

a.uniq!
num = 23
n = Select(a, 0, a.length - 1, num)
