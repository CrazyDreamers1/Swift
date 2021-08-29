import UIKit




let dispatchGroup = DispatchGroup()

//API Call 1
func someAPICallOne(completion: @escaping(String)->Void){
    dispatchGroup.enter()
    DispatchQueue.global().asyncAfter(deadline: .now() + .seconds(4)) {
        completion("API call one is done! ")
        dispatchGroup.leave()
    }
    dispatchGroup.wait()
}

//API Call 2
func someAPICallTwo(completion: @escaping(String)->Void){
    dispatchGroup.enter()
    DispatchQueue.global().asyncAfter(deadline: .now() + .seconds(3)) {
        completion("API call Two is done! ")
        dispatchGroup.leave()
    }
    dispatchGroup.wait()
}

//API Call 3
func someAPICallThree(completion: @escaping(String)->Void){
    DispatchQueue.global().asyncAfter(deadline: .now() + .seconds(1)) {
        completion("API call Three is done! ")
    }
}


//Create Operation One
let blockOperationOne = BlockOperation()
blockOperationOne.addExecutionBlock {
    someAPICallOne(completion: { response in
        print(response)
    })
}

//Create Operation Two
let blockOperationTwo = BlockOperation()
blockOperationTwo.addExecutionBlock {
    someAPICallTwo { response in
        print(response)
    }
}

//Create Operation Three
let blockOperationThree = BlockOperation()
blockOperationThree.addExecutionBlock {
    someAPICallThree { response in
        print(response)
    }
}
//Add dependancy to task
blockOperationThree.addDependency(blockOperationTwo)
blockOperationTwo.addDependency(blockOperationOne)

//Add Operations to OperationQueue
let operationQueue = OperationQueue()
operationQueue.qualityOfService = .utility
operationQueue.addOperations([blockOperationOne,blockOperationTwo,blockOperationThree], waitUntilFinished: false)


//Note: This approch is best approch for handling dependency in case of API calling.
