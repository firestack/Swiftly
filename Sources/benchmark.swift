import Foundation
import Glibc

public class Timer: CustomStringConvertible{
  var start:NSDate = NSDate()
  var end:NSDate = NSDate()
  var testName:String = ""

  public init(testName:String){
      self.testName = testName
      start = NSDate()

  }
  public func stop(){
    end = NSDate()
  }

  public var description: String {
    return "Test:'\(testName)' Elapsed Time \(end.timeIntervalSinceDate(start))"
  }

}

func doTest(){
    let arraySize = 10000000
    var randomNumbers = [Int]()
    print("Creating array of \(arraySize) random() numbers")

    let arrayTiming = Timer(testName:"Array Generation")
    for _ in 0..<arraySize {
        randomNumbers.append(random())
    }
    arrayTiming.stop()
    print(arrayTiming)

    let sortTiming = Timer(testName:"Sorting Test")
    randomNumbers.sortInPlace()
    sortTiming.stop()
    print(sortTiming)

    

}
