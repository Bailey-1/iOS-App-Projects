import Foundation

var pizzaInInches: Int = 16 {
    willSet {
        print(newValue)
    }
    didSet {
        print(oldValue)
    }
}

var numberOfPeople: Int = 12
let slicesPerPerson: Int = 4

var numberOfSlices: Int {
    get {
        return pizzaInInches - 4
    }
    set {
        print("NumberOfSlices now has a new value which is \(newValue)")
    }
}

var numberOfPizza: Int {
    get {
        let numberOfPeopleFedPerPizza = numberOfSlices / slicesPerPerson
        return numberOfPeople / numberOfPeopleFedPerPizza
    }
    set {
        let totalSlices = numberOfSlices * newValue
        numberOfPeople = totalSlices / slicesPerPerson
    }
}

numberOfPizza = 4

print(numberOfPizza)
