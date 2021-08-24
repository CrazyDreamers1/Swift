import UIKit

//Simple Task function
func printMyName (name:String) {
    print("\(name) is your name!")
}

//Simple Task function
func printMyAge (age:String) {
    print("Your age is \(age)")
}


//Create Concurrent Queue
let concurrentQueue = DispatchQueue(label: "SomeConcurrentTask", attributes: .concurrent)

// Assign Async Task 1  Queue
concurrentQueue.async {
    sleep(2)
    printMyName(name: "Ainul")
}

// Assign Task 2 asyncronously to concurrent Queue
concurrentQueue.async {
    sleep(2)
    printMyAge(age: "27")
    }

// Assign Task 3 asyncronusly to    Queue
concurrentQueue.async {
    sleep(1)
    printMyName(name: "Sharif")
    sleep(1)
    printMyName(name: "Sharif")
    sleep(1)
    printMyName(name: "Sharif")
    sleep(1)
    printMyName(name: "Sharif")
    sleep(1)
    printMyName(name: "Sharif")
}

// Assign Task 4 syncronously to Queue
concurrentQueue.async {
    sleep(4)
    printMyAge(age: "25")
}

// Assign Task 5 asyncronously to Queue
concurrentQueue.async {
    sleep(2)
    printMyName(name: "Shahriar")
    
}

// Assign Task 6 asyncronously to Queue
concurrentQueue.async {
    sleep(2)
    printMyAge(age: "32")
}
