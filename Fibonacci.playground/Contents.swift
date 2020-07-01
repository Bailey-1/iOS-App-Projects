import UIKit

func fibonacci(n: Int){
    var results:[Int] = [0, 1]
    
    for i in 1..<n-1 {
        results.append(results[i]+results[i-1])
        
    }
    print(results)
}

fibonacci(n: 5)
// [0, 1, 1, 2, 3]

fibonacci(n: 10)
// [0, 1, 1, 2, 3, 5, 8, 13, 21, 34]


// Fizzbuzz

for index in 1...100 {
    
    if (index % 3 == 0) && (index % 5 == 0) {
        print("FizzBuzz")
    } else if index % 3 == 0 {
        print("Fizz")
    } else if index % 5 == 0 {
        print("Buzz")
    } else {
        print(index)
    }
}
