-- Insertion Sort Algorithm
local function insertionSort(table)
    for i=2, #table do
        local currentValue = table[i]
        local j = i - 1

        while j>0 and currentValue<table[j] do
            table[j+1] = table[j]
            j = j-1
        end

        table[j+1] = currentValue

        --[[
        for j=i-1, 1, -1 do
            if currentValue < table[j] then
                table[j+1] = table[j]
                table[j] = currentValue -- This line works but it's not best method
            else
                table[j+1] = currentValue --This one optimizes our code better
                break
            end
        end
        ]]--
    end
end

-- Mix function for Merge sort algorithm
local function mix(tbl, begin, half, last)
    local left = {}
    local right = {}

    for i = begin, half do
        left[#left + 1] = tbl[i]
    end

    for i = half + 1, last do
        right[#right + 1] = tbl[i]
    end

    local i, j, k = 1, 1, begin
    while i <= #left and j <= #right do
        if left[i] <= right[j] then
            tbl[k] = left[i]
            i = i + 1
        else
            tbl[k] = right[j]
            j = j + 1
        end
        k = k + 1
    end

    while i <= #left do
        tbl[k] = left[i]
        i = i + 1
        k = k + 1
    end

    while j <= #right do
        tbl[k] = right[j]
        j = j + 1
        k = k + 1
    end
end
-- Merge sort algorithm
local function mergeSort(table, start, last)
    -- [5,10,7,8] -> [5,10] [7,8] -> [5] [10] [7] [8] -> [5,10] [7,8] -> [5,7,8,10] 

    if start==nil then start = 1 end -- We check in 1st iteration start is not null if so we assig default of 1
    if last==nil then last = #table end -- We check in 1st iteration last is not null if so we assig default of quantity of elements in table

    if start>=last then return end -- Table size is no longer than 1 element (already sorted)

    local med = math.floor((start-1+last)/2)
    --print(start.."+"..last.."+"..med)
    mergeSort(table, start, med) -- Left Sort
    mergeSort(table, med+1, last) --Right Sort
    mix(table, start, med, last) --We compare
    
    -- This sort method works like this:
    --[[
    MergeSort(*lista, start, end)
        if (start<end) then
            med = math.floor((start+end)/2)
            MergeSort(&lista, start, med)
            MergeSort(&lista, med+1, end)
            Mix(&lista, start, med, end)
        end
    ]]--
end

local test = {100,90,80,70,60,50,40,30,20,10,1}

io.write("[")
for i=1, #test do
    io.write(test[i]..",")
end
print("]")

mergeSort(test)

io.write("[")
for i=1, #test do
    io.write(test[i]..",")
end
print("]")