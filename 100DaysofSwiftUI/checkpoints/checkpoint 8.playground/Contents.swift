import Cocoa

protocol Building {
    var name: String {get}
    var roomNum: Int {get}
    var cost: Int {get}
    var estateAgent: String {get}
    
    func summary()
}

struct House: Building {
    
    var name = "House"
    var roomNum = 7
    var cost = 600_000
    var estateAgent = "Phil Dunphy"
    
    func summary() {
        
        print("This building is a \(name) with \(roomNum) rooms & it costs \(cost)$. If you are interested you can talk with the estate Agent \(estateAgent). ")
    }
}
struct Office: Building {
    var name = "Office"
    var roomNum = 3
    var cost = 400_000
    var estateAgent = "Phil Dunphy"
    
    func summary() {
        print("This building is a \(name) with \(roomNum) rooms & it costs \(cost)$. If you are interested you can talk with the estate Agent \(estateAgent). ")
    }
}

let Option1 = House()
let Option2 = Office()

Option1.summary()
Option2.summary()
