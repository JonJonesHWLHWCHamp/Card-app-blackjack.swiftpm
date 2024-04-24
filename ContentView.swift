import SwiftUI


struct ContentView: View {
    @State var bet: Int = 0
    @State var card: Card = Card(suit: "Hearts", symbol: "J", value: 10)
    @State var playerValue = 0
    @State var dealerValue = 0
    @State var deck: Deck = Deck()
    
    @State var playerCards: [Card] = []
    @State var communityCards: [Card] = []
    
    @State var showDealercard: Bool = false
    //@State var showCard4 = false
    //@State var showCard5 = false
    
    @State var showWin = false
    @State var showLose = false
    
    var body: some View {
        
        VStack {
            HStack{
                ForEach(0..<communityCards.count, id: \.self) { i in 
                    if i == 0 {
                        Image(showDealercard == true ? communityCards[i].imageName : "cardBack_blue4")
                            .resizable()
                            .frame(height: 150)
                            .frame(maxWidth: 120)
                    }else { 
                        Image (communityCards[i].imageName)  
                            .resizable()
                            .frame(height: 150)
                            .frame (maxWidth: 120)
                        
                        
                    }
                    
                }
            }
            HStack{
                ForEach(playerCards) {card in Image (card.imageName)
                        .resizable()
                        .frame(height:150)
                        .frame(maxWidth: 120)
                }
            }
            
            Button("Hit") {
                let newCard = deck.dealCard()
                playerCards.append(newCard)
                playerValue += newCard.value
                if playerValue > 21 {
                    showLose = true
                }
            }
            .disabled(playerValue > 21)
            Button("Show Cards") {
                if showDealercard == false {
                    showDealercard = true
                }
                
            }
            Button("New Game") {
                newGame()
                playerValue = 0
            }
            
            
            //            Image(card.imageName)
            //                .resizable()
            //                .frame(width: 110, height: 160)
            //            Button("Deal Card"){
            //                card = deck.dealCard()
            //           }
            Spacer()
            
        }
        .alert("You win!", isPresented: $showWin, actions: {
            Button("Ok", action: {})
        })
        .alert("You lose!", isPresented: $showLose, actions: {
            Button("Ok", action: {})
        })
        .font(.largeTitle)
        .onAppear(perform: {
            newGame()
        })
        
        
        
    }
    func newGame() {
        playerCards.removeAll()
        communityCards.removeAll()
        
        communityCards.append(deck.dealCard())
        communityCards.append(deck.dealCard())
        //communityCards.append(deck.dealCard())
        //communityCards.append(deck.dealCard())
        //communityCards.append(deck.dealCard())
        
        playerCards.append(deck.dealCard())
        playerCards.append(deck.dealCard())
        
        showDealercard = false
    }
}


