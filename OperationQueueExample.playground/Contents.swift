import UIKit

//API Call 1
func someAPICallOne(completion: @escaping(String)->Void){
    DispatchQueue.global().asyncAfter(deadline: .now() + .seconds(4)) {
        completion("API call one is done! ")
    }
}

//API Call 2
func someAPICallTwo(completion: @escaping(String)->Void){
    DispatchQueue.global().asyncAfter(deadline: .now() + .seconds(3)) {
        completion("API call Two is done! ")
    }
}

//API Call 3
func someAPICallThree(completion: @escaping(String)->Void){
    DispatchQueue.global().asyncAfter(deadline: .now() + .seconds(1)) {
        completion("API call Three is done! ")
    }
}

//API Call 4
func someAPICallFour(completion: @escaping(String)->Void){
    DispatchQueue.global().asyncAfter(deadline: .now() + .seconds(2)) {
        completion("API call Four is done! ")
    }
}


//Create operatoin block One
let blockOperationOne = BlockOperation()
blockOperationOne.addExecutionBlock {
    //Added Api calling task one to operation block one
    someAPICallOne { response in
        print(response)
    }
}

//Create Operation Block Two
let blockOperationTwo = BlockOperation()
//Adding API calling task three to operation block two
blockOperationTwo.addExecutionBlock {
    someAPICallThree { response in
        print(response)
    }
}

//Create Operation Block Three
let blockOperationThree = BlockOperation()
//Adding task to block operation three
blockOperationThree.addExecutionBlock {
    someAPICallFour { response in
        print(response)
    }
}


//Create Operation Queue

let operationQueue = OperationQueue()
operationQueue.qualityOfService = .utility

//Add operations to operationQueue One by one
//operationQueue.addOperation(blockOperationOne)
//operationQueue.addOperation(blockOperationTwo)
//operationQueue.addOperation(blockOperationThree)


//Add operations to operationQueue
operationQueue.addOperations([blockOperationThree, blockOperationOne, blockOperationTwo], waitUntilFinished: false)

