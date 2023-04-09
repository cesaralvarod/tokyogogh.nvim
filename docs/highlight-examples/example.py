#!/usr/bin/python

# Importing modules
import numpy as np
from sklearn.linear_model import LinearRegression

# Defining a function


def factorial(n: int) -> int:
    """
    Returns the factorial of a given integer n.
    """
    if n == 0:
        return 1
    else:
        return n * factorial(n-1)

# Creating a class


class Car:
    def __init__(self, make: str, model: str, year: int):
        self.make = make
        self.model = model
        self.year = year

    def get_make(self) -> str:
        return self.make

    def get_model(self) -> str:
        return self.model

    def get_year(self) -> int:
        return self.year

    def get_info(self) -> str:
        return f"{self.year} {self.make} {self.model}"


# Creating an object and calling methods
my_car = Car("Toyota", "Camry", 2022)
print(my_car.get_info())

# Using conditional statements
x = 5
if x < 0:
    print("x is negative")
elif x == 0:
    print("x is zero")
else:
    print("x is positive")

# Using loops
for i in range(5):
    print(factorial(i))

# Defining a lambda function


def double(x): return x * 2


print(double(5))

# Using list comprehension
squares = [x**2 for x in range(10)]
print(squares)

# Creating and using a dictionary
my_dict = {"apple": 1, "banana": 2, "cherry": 3}
print(my_dict["banana"])

# Using try-except block
try:
    result = 10 / 0
except ZeroDivisionError:
    print("Cannot divide by zero")
