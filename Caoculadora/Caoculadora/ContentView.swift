//
//  ContentView.swift
//  Caoculadora
//
//  Created by Lucas Dantas de Moura Carvalho on 07/05/24.
//

import SwiftUI

struct ContentView: View {
    @State var years: Int? = nil
    @State var months: Int? = nil
    @State var result: Int?
    @State var size: Size?
    @State var failedInput = false
    let tituloPreecherCampos = "Preencha os campos para poder cãocular!"
    @State var zeroInput = false
    let tituloCamposZero = "Algum dos campos precisa ter valor maior que zero!"
    
    var body: some View {
        NavigationStack {
//            ScrollView {
                VStack(alignment: .leading, spacing: 20) {
                    Spacer()
                    Text("Qual a idade do seu cão?")
                        .font(.header5)
                    VStack(alignment: .leading, spacing: 8) {
                        Text("Anos")
                            .font(.body1)
                        TextField(
                            "Digite a idade do seu cão em anos caninos",
                            value: $years,
                            format: .number
                        )
                    }
                    VStack(alignment: .leading, spacing: 8) {
                        Text("Meses")
                            .font(.body1)
                        TextField(
                            "E quantos meses além disso ele tem",
                            value: $months,
                            format: .number
                        )
                    }
                    Text("Porte")
                        .font(.body1)
                    
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
                            .foregroundStyle(Color.teal)
                            .frame(maxWidth: .infinity)
                            .font(.body1)
                        Text("\(result) anos")
                            .contentTransition(.numericText())
                            .foregroundStyle(Color.teal)
                            .frame(maxWidth: .infinity)
                            .font(.display)
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
                            .font(.body1)
                    })
                }
//                .containerRelativeFrame(.vertical)
                .textFieldStyle(.roundedBorder)
                .keyboardType(.numberPad)
                .bold()
                .fontDesign(.rounded)
                .padding()
            .navigationTitle("Cãoculadora")
            .toolbarBackground(.visible, for: .navigationBar)
            .toolbarBackground(.teal, for: .navigationBar)
            .toolbarColorScheme(.dark, for: .navigationBar, .tabBar)
            .alert(tituloPreecherCampos, isPresented: $failedInput) {
                Button("OK", role: .cancel, action: {})
            }
            .alert(tituloCamposZero, isPresented: $zeroInput) {
                Button("OK", role: .cancel, action: {})
            }
            .confirmationDialog(tituloPreecherCampos, isPresented: $failedInput, titleVisibility: .visible) {
                Button("OK", action: {})
            }
//            }
            .scrollDismissesKeyboard(.immediately)
        }
    }
    
    
    func processYears() {
//        if let years {
//            result = years * 7
//        } else {
//            print("preencha o campo de entrada")
//        }
        
        guard let years else {
            print("preencha o campo de anos")
            failedInput = true
            return
        }
        
        guard let months else {
            print("preencha o campo de meses")
            failedInput = true
            return
        }
        
        guard years > 0 || months > 0 else {
            print("algum campo tem que ter valor maior que 0")
            zeroInput = true
            return
        }
        
//        guard let result else {
//            print("Ocorreu um erro")
//            return
//        }
        
//        if size == .large {
//            self.result = Int(Double(result) * 0.8)
//        } else if size == .medium {
//            self.result = Int(Double(result) * 0.9)
//        }
        
//        let multiplier: Int?
        
//        switch size {
//        case .small:
//            multiplier = 6
//        case .medium:
//            multiplier = 7
//        case .large:
//            multiplier = 8
//        default:
//            multiplier = nil
//        }
//        
//        guard let multiplier else {
//            print("Multiplier was never set")
//            return
//        }
        
        withAnimation(.easeIn.speed(0.5)) {
            self.result = size?.ageConversion(years: years, months: months)
        }
        
    }
}

#Preview {
    ContentView()
}
