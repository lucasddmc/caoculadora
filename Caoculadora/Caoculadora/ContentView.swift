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
    @State var result: Int?
    
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
            Text("Porte")
            // aqui vai o segmented control
            if let result = result {
                Text("Seu cachorro tem, em idade humana: ")
                Text("\(result) anos")
            } else {
                Image(ImageResource.clarinha)
                    .resizable()
                    .scaledToFit()
                    .frame(maxHeight: 150)
                    .frame(maxWidth: .infinity)
                    .shadow(radius: 5, x: 5, y: 5)
            }
            Button(action: {
                result = 23
            }, label: {
                Text("Cãocular")
                    .frame(height: 50)
                    .frame(maxWidth: .infinity)
                    .background(Color.purple)
                    .foregroundStyle(.white)
                    .clipShape(.rect(cornerRadius: 10))
            })
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
