//
//  ContentView.swift
//  NotesApp
//
//  Created by mathis goffin on 23/01/2025.
//

import SwiftUI


class TakenModel: ObservableObject {
    @Published  var taken: [String]  = ["Test taak"]
    
    
    func voegTaakToe(title: String) {
        taken.append(title)
    }
    
    func deleteItem(at offsets: IndexSet) {
        taken.remove(atOffsets: offsets)
    }
}
struct ContentView: View {
    @StateObject var model = TakenModel()
    @State var taak: String = ""
    
   
    
    var body: some View {
        NavigationStack{
           
            VStack{
                List{
                    ForEach(model.taken, id: \.self) { taak in
                        NavigationLink("\(taak)", destination: taakView())
                        
                    }.onDelete(perform: model.deleteItem)
                }
                TextField("voeg je taak toe", text: $taak).padding().background(.white).padding()
                Button(action: {
                    model.voegTaakToe(title: taak)
                    taak = ""
                }) {
                    Text("Taak toevoegen").padding().padding(.horizontal, 100).background(.gray).cornerRadius(15).foregroundColor(.white)
                }
            }
            .navigationTitle("taken")
            .background(Color(.systemGray6))
        }
    
    }
}

#Preview {
    ContentView()
}
