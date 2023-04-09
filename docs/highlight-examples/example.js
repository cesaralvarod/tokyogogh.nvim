import axios from "axios";

// Single line comment

/*
   Multi-line comment
*/

// Variables
var a = 5;
let b = "hello";
const c = true;
const NAME_OF_PERSON = "Cesar";

// Arrays
const arr = [1, 2, 3];
const nestedArr = [
	[1, 2],
	[3, 4],
];

// Objects
const obj = {
	name: "John",
	age: 30,
	address: {
		street: "123 Main St",
		city: "Anytown",
		state: "CA",
	},
};

// Functions
function add(a, b) {
	return a + b;
}

const subtract = function (a, b) {
	return a - b;
};

const multiply = (a, b) => {
	return a * b;
};

// Classes
class Person {
	constructor(name, age) {
		this.name = name;
		this.age = age;
	}

	greet() {
		console.log(`Hello, my name is ${this.name}`);
	}
}

// Promises
const promise = new Promise((resolve, reject) => {
	setTimeout(() => {
		resolve("Success!");
	}, 1000);
});

promise.then((result) => {
	console.log(result);
});

// Async/await
async function getData() {
	const response = await fetch("https://jsonplaceholder.typicode.com/todos/1");
	const data = await response.json();
	return data;
}

// Try/catch
try {
	// code that may throw an error
} catch (error) {
	console.error(error);
}

// Loops
for (let i = 0; i < 10; i++) {
	console.log(i);
}

while (condition) {
	// code to execute while condition is true
}

do {
	// code to execute at least once, and then while condition is true
} while (condition);
