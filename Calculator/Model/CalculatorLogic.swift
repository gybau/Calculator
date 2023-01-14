

import Foundation

class CalculatorLogic {
    
    var number: Double
    
    init(number: Double) {
        self.number = number
    }
    
    func upperCalcButtonPressed(symbol: String) -> Double? {
        
        if symbol == "+/-" {
            return number * -1
        } else if symbol == "%" {
            return number * 0.01
        } else if symbol == "AC" {
            return 0
        }
        
        return nil
    }
}
