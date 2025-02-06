//
//  taakView.swift
//  NotesApp
//  
//  Created by mathis goffin on 28/01/2025.
//

import SwiftUI

struct taakView: View {
     var Taak: Taak
    //model binnenhalen
    @ObservedObject var model: TakenModel
    //niewe state voor naam
    @State var nieweNaam = ""
    
    @State var nieweStatus = false
    
    //functie find index
    
    var body: some View {
        VStack {
                   Text(Taak.naam)
                       .font(.largeTitle)
                       .padding()
                   
                   // Hier kun je nog meer informatie tonen, zoals de voltooiingsstatus van de taak
                   Text(Taak.completed ? "Voltooid" : "Nog niet voltooid")
                       .padding()
                       .foregroundColor(Taak.completed ? .green : .red)
            TextField("", text: $nieweNaam).textFieldStyle(.roundedBorder)
            Toggle("Taak voltooid?", isOn: $nieweStatus)
            
            Button(action: {
                model.bewerkTaak(id: Taak.id , nieuweNaam: nieweNaam, nieuweStatus: nieweStatus)
            }){
                Text("opslaan")
            }
            .onAppear {
                        nieweNaam = Taak.naam
                        nieweStatus = Taak.completed
                    }
            
            
            
        }.padding()
               .navigationTitle(Taak.naam)
    }
}
