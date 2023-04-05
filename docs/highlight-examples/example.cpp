#include <iostream>
#include <string>

using namespace std;

// Function prototype
int addNumbers(int x, int y);

// Class definition
class Person {
private:
    string name;
    int age;

public:
    // Constructor
    Person(string n, int a) {
        name = n;
        age = a;
    }

    // Method
    void printInfo() {
        cout << "Name: " << name << endl;
        cout << "Age: " << age << endl;
    }
};

int main() {
    // Variable declaration
    int x = 5;
    int y = 10;

    // Function call
    int sum = addNumbers(x, y);
    cout << "The sum is: " << sum << endl;

    // Object instantiation
    Person p("John", 30);
    p.printInfo();

    return 0;
}

// Function definition
int addNumbers(int x, int y) {
    return x + y;
}
