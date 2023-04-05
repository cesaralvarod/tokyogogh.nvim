package main

import "fmt"

func main() {
// Declaration and assignment of variables
var myNumberVariable int = 42
var myStringVariable string = "Hello, world!"

// Function
myFunction(myNumberVariable)

// Conditional
if myNumberVariable > 0 {
  fmt.Println("The variable is greater than 0")
} else {
  fmt.Println("The variable is less than or equal to 0")
}

// Loop
for i := 1; i <= 10; i++ {
  fmt.Println(i)
}

// Struct
type Person struct {
  Name string
  Age int
}

// Creating an object
person1 := Person{"John", 30}

// Accessing object attributes
fmt.Println(person1.Name)
fmt.Println(person1.Age)

// Function definition
func myFunction(parameter int) {
fmt.Println("The value of the parameter is:", parameter)
}
