//
//  ContentView.swift
//  NotesApp
//
//  Created by mathis goffin on 23/01/2025.
//

import SwiftUI

struct ContentView: View {
    @State var taken: Array = [""]
    @State var taak: String = ""
    
    func voegTaakToe() {
        taken.append("\(taak)")
    }
    var body: some View {
        NavigationStack{
            Spacer()
            VStack{
                List{
                    ForEach(taken, id: \.self) { taak in
                        Text("\(taak)")
                        
                    }
                }
                TextField("voeg je taak toe", text: $taak)
                Button(action: {
                    voegTaakToe()
                    taak = ""
                }) {
                    Text("Taak toevoegen").padding().padding(.horizontal, 100).background(.gray).cornerRadius(15).foregroundColor(.white)
                }
            }.padding()
                .navigationTitle("taken")
                
        }
    }
}

#Preview {
    ContentView()
}
