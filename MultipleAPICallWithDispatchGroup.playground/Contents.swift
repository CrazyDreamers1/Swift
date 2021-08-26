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


var results:[String] = []

//Create dispatch Group
let dispatchGroup = DispatchGroup()


dispatchGroup.enter()
someAPICallOne { response in
    debugPrint(response)
    results.append(response)
    dispatchGroup.leave()
}

dispatchGroup.enter()
someAPICallTwo { response in
    debugPrint(response)
    results.append(response)
    dispatchGroup.leave()
}

dispatchGroup.enter()
someAPICallThree { response in
    debugPrint(response)
    results.append(response)
    dispatchGroup.leave()
}

dispatchGroup.enter()
someAPICallFour { response in
    debugPrint(response)
    results.append(response)
    dispatchGroup.leave()
}

dispatchGroup.notify(queue: .main) {
    debugPrint("All API Call Done!")
}







