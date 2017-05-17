def swap(arr,a,b)
    temp = arr[a]
    arr[a] = arr[b]
    arr[b] = temp
end

def randomized_select(a,p,r,i)
    if p == r
        return a[p]
    end
    q = randomized_partition(a,p,r)
    k = q - p + 1
    if i == k
        return a[q]
    elsif i < k
        return randomized_select(a,p,q-1,i)
    else 
        return randomized_select(a,q+1,r,i-k)
    end
end

def randomized_partition(a,p,r)
    i = rand(p..r)
    swap(a,r,i)
    return partition(a,p,r)
end

def partition(a,p,r)
    x = a[r]
    i = p - 1
    for j in p..(r-1)
        if a[j] <= x
            i += 1
            swap(a,i,j)
        end
    end
    swap(a,i+1,r)
    return i + 1
end


=begin
a = [92, 72, 21, 59, 94, 36, 70, 90, 27, 53, 88, 28, 50, 9, 75, 91, 21, 20, 52, 98, 95, 87, 4, 72, 47, 49, 42, 20, 22, 25, 33, 84, 58, 94,47, 1, 54, 98, 97, 55, 3, 32, 95, 50, 87, 66, 69, 84, 31, 56, 53, 37, 65, 52, 75, 70, 36, 90, 71, 97, 84, 55, 59, 73, 75, 86, 11, 41, 50, 16, 45, 6, 31, 18, 17, 69, 15, 9, 23, 33, 71, 63, 9, 57, 19, 55, 35, 40, 57, 1, 7, 51, 43, 36, 11, 98, 86, 67, 91, 34]

a.uniq!

num = 22
puts a.sort[num - 1]

puts randomized_select(a,0,a.length - 1,num)
=end

a = [31, 34, 61, 93, 13, 59, 57, 23, 76, 25, 4, 33, 42, 47, 55, 89, 80, 31, 66, 42, 29, 28, 26, 16, 40, 41, 79, 72, 94, 75, 86, 31, 62, 23, 53, 53, 72, 76, 92, 95, 85, 16, 17, 67, 18, 61, 49, 17, 39, 22]

swap(a,24,a.length - 1)
partition(a,0,a.length - 1)
s = ""
for i in 0..4
    for j in 0..9
        s += ","+a[j*5+i].to_s
    end
    puts s
    s = ""
end
        