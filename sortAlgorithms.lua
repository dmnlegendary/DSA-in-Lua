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

-- Merge sort algorithm
local function mergeSort(table)
    local i = 1;
    local j = 1;
    local size_table = #table;

    

    while 
end

local test = {100,90,80,70,60,50,40,30,20,10,1}

io.write("[")
for i=1, #test do
    io.write(test[i]..",")
end
print("]")

insertionSort(test)

io.write("[")
for i=1, #test do
    io.write(test[i]..",")
end
print("]")