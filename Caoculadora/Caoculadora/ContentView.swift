//
//  ContentView.swift
//  Caoculadora
//
//  Created by Lucas Dantas de Moura Carvalho on 07/05/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Image(systemName: "pawprint")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Hello, world!")
        }
        .padding()
    }
}

#Preview {
    ContentView()
}