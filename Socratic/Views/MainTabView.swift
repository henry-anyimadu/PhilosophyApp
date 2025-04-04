//
//  MainTabView.swift
//  Socratic
//
//  Created by Henry Anyimadu on 3/23/25.
//

import SwiftUI

struct MainTabView: View {
    @StateObject var appState: AppState
    @State private var selectedTab = 0
    
    var body: some View {
        TabView(selection: $selectedTab) {
            HomeView()
                .tabItem {
                    Label("Home", systemImage: "house.fill")
                }
                .tag(0)
            
            LearningPathView()
                .tabItem {
                    Label("Learn", systemImage: "map.fill")
                }
                .tag(1)
            
            ProfileView()
                .tabItem {
                    Label("Profile", systemImage: "person.fill")
                }
                .tag(2)
        }
        .accentColor(.white) // Set tab item tint color
        .background(AppTheme.background)
    }
}

#Preview {
    MainTabView(appState: AppState())
}
