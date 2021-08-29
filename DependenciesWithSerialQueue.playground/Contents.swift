import UIKit

//Normal Dependancy task hanle with Dispatch Serial Queue
//If any task dependent on other we need to execute it first. We can do it Serial Queue let see how...
//Here we are creating three task of taking snacks, where task one is about let us know what we are doning. and Other two step is for taking snacks. if task two isn't execute before task three then there will be problem. because if you not go yet for taking fruits from store how it will be in refrigerator!
//So task three is dependant on task two
//Dependant task must need to add first then it will execute first


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


//Create Serial Queue
let dispatchQueue = DispatchQueue(label: "someSerialQueue")
//Task one is added to serial queue
dispatchQueue.sync {
    taskOne()
}

//Task Two is added to serial queue
dispatchQueue.sync {
    taskTwo()
}

//Task Three is added to serial queue
dispatchQueue.sync {
    taskThree()
}

//Note: This approch may not work on API Calling because URLSeassion execute on separate backgroud thread.


