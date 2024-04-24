import SwiftUI

class Deck: ObservableObject{
    
    @Published var cards: [Card] = []
    
    init() {
        loadCards()
    }
    
    func loadCards() {
        cards.removeAll()
        let suits : [String] = ["Hearts", "Clubs", "Diamonds", "Spades"]
        let symbols : [String] = ["2","3","4","5","6","7","8","9","10","J","Q","K","A"]
        
        for suit in suits {
            for symbol in symbols {
                cards.append(Card(suit: suit, symbol: symbol, value: 10))
            }
        }
    }
    func dealCard() -> Card{
        if cards.count > 0 {
            return cards.removeLast()
            
        }  else {
            loadCards() 
            shuffle() 
            return dealCard()
        }
    
    
}
    func shuffle() {
        cards.shuffle()
    }
    func discard() { 
        cards.removeLast()
    }
}

