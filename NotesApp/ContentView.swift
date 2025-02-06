//
//  ContentView.swift
//  NotesApp
//
//  Created by mathis goffin on 23/01/2025.
//

import SwiftUI

struct Taak: Identifiable {
    let id = UUID()
    var completed: Bool
    var naam: String
}


class TakenModel: ObservableObject {
    @Published  var taken: [Taak]  = [Taak(completed: true, naam: "test")]
    
    
    func voegTaakToe(title: String, completed: Bool) {
        taken.append(Taak(completed: completed, naam: title))
    }
    
    func deleteItem(at offsets: IndexSet) {
        taken.remove(atOffsets: offsets)
        
        
        }
    func bewerkTaak(id: UUID, nieuweNaam: String, nieuweStatus: Bool) {
        if let index = taken.firstIndex(where: { $0.id == id }) {
            taken[index].naam = nieuweNaam
            taken[index].completed = nieuweStatus
        }
    }
    
    
    
}

struct ContentView: View {
    @StateObject var model = TakenModel()
    @State var taak: String = ""
    @State var taakCompleted: Bool = false
    
    
    
    
    var body: some View {
        NavigationStack{
            
            VStack{
                List{
                    ForEach(model.taken) { taak in
                        NavigationLink(destination: taakView(Taak:taak, model: model)){
                            HStack {
                                Text("\(taak.naam)")
                                Spacer()
                                Image(systemName: taak.completed ? "checkmark.square.fill" : "x.square.fill").foregroundColor(taak.completed ? .green : .red)
                            }
                        }
                        
                    }.onDelete(perform: model.deleteItem)
                    
                    
                }
                TextField("voeg je taak toe", text: $taak).padding().background(.white).padding()
                Toggle(isOn: $taakCompleted) {
                    Text("klaar?")
                }.padding()
                Button(action: {
                    model.voegTaakToe(title: taak, completed: taakCompleted)
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
