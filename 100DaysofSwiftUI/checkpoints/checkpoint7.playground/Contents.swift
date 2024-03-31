import Cocoa

class Animal{
    var legs = 4
    
    init(legs: Int){
        self.legs = legs
    }
    
}
class Cat: Animal{
    
    var isTame: Bool
    
    func speak(){
        print("MEOW")
    }
    init(isTame: Bool) {
        self.isTame = isTame
        super.init(legs: 4)}
}


class Dog: Animal{
    

    func speak(){
        print("WOOF")
    }
    
    init(){
        super.init(legs: 4)
    }
   
}

class Corgi: Dog{
    override func speak() {
        print("woof woof")
    }
}

class Poodle: Dog{
    override func speak() {
        print("Woooooof")
    }
}

class Persian: Cat{
     init() {
         super.init(isTame: true)
    }
    override func speak(){
        print("mmmmeeeooow")
    }
}

class Lion: Cat{
    init(){
        super.init(isTame: false)
    }
    override func speak(){
        print("Rawr")
    }
}

var lion = Lion()
var corgi = Corgi()
var poodle = Poodle()
var cat = Persian()

lion.speak()
corgi.speak()
poodle.speak()
cat.speak()

print(cat.isTame ? "Oh you can pet this cat" : "Wish i could pet this cat")
print(lion.isTame ? "Oh you can pet this cat" : "Wish i could pet this cat")
