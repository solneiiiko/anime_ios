//
//  ContentView.swift
//  anime
//
//  Created by Oks on 2/9/2026.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Hello, world!")
            if AppConfig.loggingEnabled {
                Text("Log - YES")
            } else {
                Text("Log - NO")
            }
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
