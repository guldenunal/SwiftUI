import Cocoa

enum errors: Error{
    case outOfBounds
    case noRoot
}

func square(num: Int ) throws -> Int{
   if num > 10_000 || num < 1{
        throw errors.outOfBounds
    }
    for i in 1...100{
        
        if num == i*i{
            return i
            }
        }
    
    throw errors.noRoot
}

do{
   let result = try square(num: 100)
    print(result)
}
catch{
    print("theres an error")
}

do{
   let result = try square(num: 100000)
    print(result)
}
catch let error {
    print(error)
}
do{
   let result = try square(num: 33 )
    print(result)
}
catch let error {
    print(error)
}
