local search = require("src.searchAlgorithms")

local datos = {1, 3, 5, 7, 9, 11}

print("Linear:", search.linearSearch(datos, 7))   -- salida: 4
print("Binary:", search.binarySearch(datos, 9))   -- salida: 5
print("Jump:", search.jumpSearch(datos, 11))      -- salida: 6