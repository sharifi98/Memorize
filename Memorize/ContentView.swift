import SwiftUI

struct ContentView: View {
    
    struct Theme {
        var name: String
        var emojis: [String]
    }
    
    let themes: [Theme] = [
        Theme(name: "Vehicles", emojis: ["🚗", "🚕", "🚙", "🚌", "🚎", "🚓", "🚑", "🚒", "🚐", "🚚", "🚛", "🚜", "🏍", "🚲", "🛴", "🚠", "🚟", "🚡", "🚁", "✈️", "🛩", "🛫", "🛬", "🚀", "🛸", "🛳", "🚤", "⛵️", "🚢", "🚂", "🚆", "🚇", "🚊", "🚉", "🚞", "🚖", "🚍"]),
        Theme(name: "Christmas", emojis: ["🎄", "🎅", "🎁", "⛄️", "🤶", "🔔", "❄️", "🕯️", "🎉", "🦌", "🎶", "🎊", "🎄🎁", "🎅🏼", "🎄🎅🎁", "🎄🕯️"]),
        Theme(name: "Fruits", emojis: ["🍎", "🍊", "🍌", "🍉", "🍇", "🍓", "🍈", "🍒", "🍑", "🍍", "🥝", "🥥", "🥭", "🍅", "🥑", "🥦", "🥬", "🥒", "🌽"])
    ]
    
    @State private var selectedTheme = 0
    @State private var chosenTheme: [String] = []
    @State private var emojiCount = 15
    
    init() {
        chosenTheme = themes[0].emojis
    }
    
    var body: some View {
        NavigationView {
            VStack {
                ScrollView {
                    LazyVGrid(columns: [GridItem(.adaptive(minimum: 65))]) {
                        ForEach(chosenTheme.prefix(emojiCount).shuffled(), id: \.self, content: { emoji in
                            CardView(content: emoji).aspectRatio(2/3, contentMode: .fit)
                        })
                    }
                }
                .foregroundColor(.red)
                
                Spacer()
                
                HStack {
                    ForEach(0..<themes.count) { index in
                        VStack {
                            Button(action: {
                                selectedTheme = index
                                chosenTheme = themes[index].emojis
                            }, label: {
                                if themes[index].name == "Vehicles" {
                                    Image(systemName: "car")
                                } else if themes[index].name == "Christmas" {
                                    Image(systemName: "snowflake")
                                } else if themes[index].name == "Fruits" {
                                    Image(systemName: "apple.logo")
                                }
                            })
                            .frame(maxWidth: .infinity)
                            
                            Text(themes[index].name)
                                .font(.system(size: 17))
                        }
                    }
                }
                .font(.largeTitle)
                .padding(.horizontal)
            }
            .padding(.horizontal)
            .navigationTitle("Memorize!")
        }
   
    }
    
    struct CardView: View {
        var content: String
        @State var isFaceUp: Bool = true
        
        var body: some View {
            ZStack {
                let shape = RoundedRectangle(cornerRadius: 20)
                if isFaceUp {
                    shape.fill().foregroundColor(.white)
                    shape.strokeBorder(lineWidth: 3)
                    Text(content).font(.largeTitle)
                } else { shape.fill() }
            }
            .onTapGesture {
                isFaceUp = !isFaceUp
            }
        }
        
    }
    
    struct ContentView_Previews: PreviewProvider {
        static var previews: some View {
            ContentView()
                .preferredColorScheme(.dark)
            ContentView()
                .preferredColorScheme(.light)
        }
    }
}
