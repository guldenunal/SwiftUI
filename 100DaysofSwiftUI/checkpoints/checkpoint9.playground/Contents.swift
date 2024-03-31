import Cocoa

func randomInt(arr: [Int]?) -> Int {
   return arr?.randomElement() ?? Int.random(in: 1...100)
}

var arr: [Int]? = nil
//arr = [4,3,23,13,43]
var a = randomInt(arr: arr)

