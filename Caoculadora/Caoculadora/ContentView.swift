//
//  ContentView.swift
//  Caoculadora
//
//  Created by Lucas Dantas de Moura Carvalho on 07/05/24.
//

import SwiftUI

struct ContentView: View {
    @State var anos: Int? = nil
    @State var meses: Int? = nil
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("Qual a idade do seu cão?")
            Text("Anos")
            TextField(
                "Digite a idade do seu cão em anos caninos",
                value: $anos,
                format: .number
            )
            
            Text("Meses")
            TextField(
                "E quantos meses além disso ele tem",
                value: $meses,
                format: .number
            )
        }
        .textFieldStyle(.roundedBorder)
        .keyboardType(.numberPad)
        .bold()
        .fontDesign(.rounded)
        .padding()
    }
}

#Preview {
    ContentView()
}
