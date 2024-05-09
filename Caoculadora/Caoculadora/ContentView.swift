//
//  ContentView.swift
//  Caoculadora
//
//  Created by Lucas Dantas de Moura Carvalho on 07/05/24.
//

import SwiftUI

enum Size: String, CaseIterable {
    case small = "Pequeno"
    case medium = "Médio"
    case large = "Grande"
}

struct ContentView: View {
    @State var years: Int? = nil
    @State var months: Int? = nil
    @State var result: Int?
    @State var size: Size?
    
    
    var body: some View {
        VStack(alignment: .leading) {
            Spacer()
            Text("Qual a idade do seu cão?")
            Text("Anos")
            TextField(
                "Digite a idade do seu cão em anos caninos",
                value: $years,
                format: .number
            )
            Text("Meses")
            TextField(
                "E quantos meses além disso ele tem",
                value: $months,
                format: .number
            )
            Text("Porte")
            
            Picker(selection: $size, label: Text("Porte")) {
                ForEach(Size.allCases, id: \.self) { value in
                    Text(value.rawValue)
                        .tag(value as Size?)
                }
            }
            .pickerStyle(.segmented)
            Divider()
            Spacer()
            
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
            Spacer()
            Button(action: processYears, label: {
                Text("Cãocular")
                    .frame(height: 50)
                    .frame(maxWidth: .infinity)
                    .background(Color.teal)
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
    
    
    func processYears() {
//        if let years {
//            result = years * 7
//        } else {
//            print("preencha o campo de entrada")
//        }
        
        guard let years else {
            print("preencha o campo de anos")
            return
        }
        
        guard let months else {
            print("preencha o campo de meses")
            return
        }
        
        guard years > 0 || months > 0 else {
            print("algum campo tem que ter valor maior que 0")
            return
        }
        
        result = (years + (months / 12)) * 7
        
        guard var result else {
            print("Ocorreu um erro")
            return
        }
        
        if size == .large {
            self.result = Int(Double(result) * 0.8)
        } else if size == .medium {
            self.result = Int(Double(result) * 0.9)
        }
    }
}

#Preview {
    ContentView()
}
