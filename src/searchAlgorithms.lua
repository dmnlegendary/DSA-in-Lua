local Search = {}

function Search.linearSearch(arr, target)
    for i = 1, #arr do
        if arr[i] == target then
            return i   -- devuelve la posición encontrada
        end
    end
    return nil         -- no encontrado
end

function Search.binarySearch(arr, target)
    local low, high = 1, #arr
    while low <= high do
        local mid = math.floor((low + high) / 2)
        if arr[mid] == target then
            return mid
        elseif arr[mid] < target then
            low = mid + 1
        else
            high = mid - 1
        end
    end
    return nil
end

function Search.jumpSearch(arr, target)
    local n = #arr
    local step = math.floor(math.sqrt(n))
    local prev = 1

    while arr[math.min(step, n)] < target do
        prev = step + 1
        step = step + math.floor(math.sqrt(n))
        if prev > n then
            return nil
        end
    end

    for i = prev, math.min(step, n) do
        if arr[i] == target then
            return i
        end
    end
    return nil
end

return Search