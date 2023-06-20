//
//  ContentView.swift
//  Memorize
//
//  Created by William on 6/19/23.
//

import SwiftUI

struct ContentView: View {
    
    var emojis = ["✈️", "🚀", "🛵", "🚜", "🏎️"]
    
    @State var emojiCount: Int = 4
    
    var body: some View {
        VStack{
            ScrollView{
                LazyVGrid(columns: [GridItem(.adaptive(minimum: 80))]){
                    ForEach(emojis[0..<emojiCount], id: \.self) { emoji in
                        CardView(content: emoji)
                            .aspectRatio(2/3, contentMode: .fit)
                    }
                }
                .foregroundColor(.red)
            }
            
            Spacer()
            
            HStack{
                Button(action: {
                    if emojiCount > 1 {
                        emojiCount -= 1
                    }
                }, label: {
                    Image(systemName: "minus.circle")
                })
                
                Spacer()
                
                Button(action: {
                    if emojiCount < emojis.count{
                        emojiCount += 1
                    }
                }, label: {
                    Image(systemName: "plus.circle")
                })
            }
            .padding(.horizontal)
        }
        .font(.largeTitle)
        .padding(.horizontal)
        
    }
}

struct CardView: View {
    
    var content: String
    @State var isFaceUp: Bool = false
    
    var body: some View{
        ZStack{
            let shape =  RoundedRectangle(cornerRadius: 20)
            
            if isFaceUp{
                shape.fill().foregroundColor(.white)
                shape.strokeBorder(lineWidth: 3)
                Text(content).font(.largeTitle)
            }
            else{
                shape.fill()
            }
        }
        .onTapGesture {
            isFaceUp = !isFaceUp
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .preferredColorScheme(.light)
        ContentView()
            .preferredColorScheme(.dark)
    }
}
