import UIKit

//API Call 1
func someAPICallOne(completion: @escaping(String)->Void){
    sleep(4)
    completion("API call one is done! ")
    
}

//API Call 2
func someAPICallTwo(completion: @escaping(String)->Void){
    sleep(3)
    completion("API call Two is done! ")
}

//API Call 3
func someAPICallThree(completion: @escaping(String)->Void){
    sleep(1)
    completion("API call Three is done! ")
}

//Dependant task must need to add first then it will execute first 

let dispatchQueue = DispatchQueue(label: "someSerialQueue")
//first API Calling method is added
dispatchQueue.sync {
    someAPICallOne { response in
        print(response)
    }
}

//Second API Calling method is added
dispatchQueue.sync {
    someAPICallTwo { response in
        print(response)
    }
}

//Third API calling method is added
dispatchQueue.sync {
    someAPICallThree { response in
        print(response)
    }
}


