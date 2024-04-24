import SwiftUI

struct Card: Identifiable{
    // 1 properties
    var suit: String
    var symbol: String
    var imageName: String
    var value: Int 
    var id: String = UUID().uuidString
    
    //2 initializers
    init(suit: String, symbol: String, imageName: String, value: Int) {
        self.suit = suit
        self.symbol = symbol
        self.imageName = imageName
        self.value = value
    }
    
    // 3 methods 
    init(suit: String, symbol: String, value: Int) {
        self.suit = suit
        self.symbol = symbol
        self.imageName = "card\(suit)\(symbol)"
        self.value = value
    }
}
