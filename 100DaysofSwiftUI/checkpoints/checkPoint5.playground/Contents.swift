import Cocoa

let luckyNumbers = [7, 4, 38, 21, 16, 15, 12, 33, 31, 49]

let _ = luckyNumbers
    .filter { !$0.isMultiple(of: 2)}
    .sorted()
    .map{ print("\($0) is a lucky number")}

/*var filteredArray = luckyNumbers.filter{ lucky in
    return lucky % 2 == 1
}

filteredArray.sort()

var mapped: [()] = filteredArray.map{
    print( "\($0) is a lucky number")
}
*/

