import UIKit

//Normal Dependancy task hanle with Operation Queue
//If any task dependent on other we need to execute it first. We can do it Operation Queue let see how...
//Here we are creating three task of taking snacks, where task one is about let us know what we are doning. and Other two step is for taking snacks. task one can execute any time it won't be problem for us. if task two isn't execute before task three then there will be problem. because if you not go yet for taking fruits from store how it will be in refrigerator!
//So task three is dependant on task two, so we need to add dependancy to it


func taskOne(){
    print("This is about taking snacks!")
}

func taskTwo(){
    sleep(4)
    print("Please go to store and Find some fruits and put it on refrigerator")
}

func taskThree(){
    sleep(2)
    print("Take fruits from refrigerator and have snacks")
}

//Create Operation One
let blockOperationOne = BlockOperation()
blockOperationOne.addExecutionBlock {
    taskOne()
}

//Create Operation Two
let blockOperationTwo = BlockOperation()
blockOperationTwo.addExecutionBlock {
    taskTwo()
}

//Create Operation Three
let blockOperationThree = BlockOperation()
blockOperationThree.addExecutionBlock {
    taskThree()
}
//Add dependancy to task
blockOperationThree.addDependency(blockOperationTwo)

//Add Operations to OperationQueue
let operationQueue = OperationQueue()
operationQueue.qualityOfService = .utility
operationQueue.addOperations([blockOperationOne,blockOperationTwo,blockOperationThree], waitUntilFinished: false)

//Note: This approch may not work on API Calling because URLSeassion execute on separate backgroud thread.
