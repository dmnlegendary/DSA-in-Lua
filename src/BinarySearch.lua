--[[
The structure or secuence of any program in Lua has to be as the follow:
♦ LIBRARIES
♦ GLOBAL VARIABLES OR CONSTANT VALUES
♦ DICTIONARY OR ENUMERATION
♦ FUNCTIONS
♦ CALL FUNCTIONS
♦ MAIN RUN
]]--
math.randomseed(os.time())

-- Function that returns a table within 30-100 positions range, where each may contain a value from 1 to 200
local function numberGeneratorInt()
    local size = math.random(30, 100)
    print("\nThe new list has a size of "..size.." elements\n")
    local t = {}

    for i=1, size do
        t[i] = math.random(200)
    end

    return t
end

-- Function that sorts from smallest to biggest numbers in the table
local function orderTableNumbers(table, long)
    local helper = 0
    for i=1, long do
        for j=i, long do
            if table[i]>table[j] then
                help = table[i]
                table[i] = table[j]
                table[j] = help
            end
        end
    end
end

-- This function finds an specific value and its position in a table
local function binarySearch(sortedTable, long, numberToFindInside)
    local inicio = 1
    local final = long

    while inicio<=final do
        local medio = math.floor((inicio+fin)/2)

        if sortedTable[medio]==numberToFindInside then
            return medio
        elseif sortedTable[medio]<numberToFindInside then
            inicio = medio + 1
        elseif sortedTable[medio]>numberToFindInside then
            fin = medio - 1
        end
    end

    return nil
end

-- Prints the numbers in a table
local function printTable(table, long)
    io.write("\nThis is the list: [")
    for i=1, long-1 do
        io.write(table[i]..",")
    end
    io.write(table[long].."]\n")
end

local function Menu()
    local abandon = false
    local seekNumber = nil
    local isSorted = false
    local test = numberGeneratorInt()
    --local tableTest = {1,4,2,7,11}
    repeat
        print("Welcome to this program. The options are:\n1) Print Generated Test List.\n2) Sort Test List.\n3) Find a number.\n4) Generate new Test List.\n5) Exit..\n")
        
        local selection = tonumber(io.read())
        if selection==1 then
            printTable(test, #test)
        elseif selection==2 then
            orderTableNumbers(test, #test)
            isSorted = true
        elseif selection==3 then
            io.write("\nInsert the number you seek (1-200): ")
            seekNumber = tonumber(io.read())
            if seekNumber>0 and seekNumber<201 and isSorted then
                local position = binarySearch(test, #test, seekNumber)
                if position==nil then
                    print("El numero no se encuentra en la tabla.\n")
                else
                    print("The number "..seekNumber.." is in the position: "..position)
                end
            else
                print("That's not acceptable!\n")
            end
        elseif selection==4 then
            test = numberGeneratorInt()
            isSorted = false
        elseif selection==5 then
            abandon = true
            print("Goodbye!")
        else
            print("That's not an option :( PLS enter a number from 1 to 5\n")
        end
    until abandon==true
end

Menu()