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



// Create operation
let blockOperationOne = BlockOperation()
//Select Quality of Service for Blocks
blockOperationOne.qualityOfService = .utility

blockOperationOne.addExecutionBlock {
    someAPICallOne { response in
        print(response)
    }
}

blockOperationOne.addExecutionBlock {
    someAPICallTwo { response in
        print(response)
    }
}

blockOperationOne.addExecutionBlock {
    someAPICallThree { response in
        print(response)
    }

}

//Start Executing added blocks
blockOperationOne.start()


