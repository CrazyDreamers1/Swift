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

// Assign Task 1 Syncronusly to Queue
//Here only this task is syncronus while all others are async you will see difference on console if you compare result with last Example

concurrentQueue.sync {
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

// Assign Task 2 Asyncronously to Queue
concurrentQueue.async {
    sleep(4)
    printMyAge(age: "25")
}

// Assign Async Task 3  Queue
concurrentQueue.async {
    sleep(2)
    printMyName(name: "Ainul")
}

// Assign Task 4 Asyncronously to concurrent Queue
concurrentQueue.async {
    sleep(2)
    printMyAge(age: "27")
    }

// Assign Task 5 Asyncronously to Queue
concurrentQueue.async {
    sleep(2)
    printMyName(name: "Shahriar")
    
}

// Assign Task 6 Asyncronously to Queue
concurrentQueue.async {
    sleep(2)
    printMyAge(age: "32")
}
