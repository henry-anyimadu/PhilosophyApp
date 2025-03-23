//
//  ContentView.swift
//  Socratic
//
//  Created by Henry Anyimadu on 3/17/25.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject var appState: AppState
    var body: some View {
        MainTabView()
            .environmentObject(appState)
    }
}
#Preview {
    ContentView(appState: AppState())
}
