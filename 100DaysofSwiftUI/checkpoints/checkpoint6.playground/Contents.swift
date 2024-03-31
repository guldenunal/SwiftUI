import Cocoa

struct Car {
    let model: String
    let seatNum: Int
    private (set) var currentGear = 0
    
    init(model: String, seatNum: Int) {
        self.model = model
        self.seatNum = seatNum
    }
    
    mutating func changeGear(gear: Int){
        if gear >= 1 && gear <= 10{
            self.currentGear = gear
            print("now gear is \(currentGear)")
        }
        else{
            print("there is no such gear?!")
        }}
    
    mutating func gearUp(){
        if currentGear < 10{
            currentGear += 1
            print("gear is \(currentGear)")
        }
        else{
            print("You already on the max gear")
        }
    }
    
    mutating func gearDown(){
        if currentGear > 1 {
            currentGear -= 1
            print("gear is \(currentGear)")
        } else {
            print("you already on the lowest gear")
        }
    }
    
    
}

var myCar = Car(model: "idk", seatNum: 5)
myCar.model
myCar.seatNum

myCar.gearUp()

myCar.changeGear(gear: 10)

myCar.gearUp()

myCar.gearDown()

myCar.changeGear(gear: 1)

myCar.gearDown()
