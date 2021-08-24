import UIKit

//Simple Task function
func printMyName (name:String) {
    print("\(name) is your name!")
}

//Simple Task function
func printMyAge (age:String) {
    print("Your age is \(age)")
}


//Create Serial Queue
let serilQueue = DispatchQueue(label: "SomeSerialTask")

// Assign Task 1 to serial Queue
serilQueue.async {
    printMyName(name: "Ainul")
}

// Assign Task 1 to serial Queue
serilQueue.sync {
    printMyAge(age: "27")
}

// Assign Task 1 to serial Queue
serilQueue.async {
    printMyName(name: "Sharif")
}

// Assign Task 1 to serial Queue
serilQueue.sync {
    printMyAge(age: "25")
}

// Assign Task 1 to serial Queue
serilQueue.async {
    printMyName(name: "Shahriar")
}

// Assign Task 1 to serial Queue
serilQueue.sync {
    printMyAge(age: "32")
}


