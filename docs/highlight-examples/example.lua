#!/usr/bin/env lua

-- Variables
local myNumberVariable = 42
local myStringVariable = "Hello, world!"

-- Function
function myFunction(parameter)
	print("The value of the parameter is: " .. parameter)
end

-- Conditional
if myNumberVariable > 0 then
	print("The variable is greater than 0")
else
	print("The variable is less than or equal to 0")
end

-- Loop
for i = 1, 10 do
	print(i)
end

-- Table
local myTable = { firstName = "John", lastName = "Doe" }

-- Access table fields
print(myTable.firstName)
print(myTable.lastName)

-- Function with named parameters
function myOtherFunction(params)
	print("The first parameter is: " .. params.firstParam)
	print("The second parameter is: " .. params.secondParam)
end

-- Call function with named parameters
myOtherFunction({ firstParam = "Hello", secondParam = "world" })
