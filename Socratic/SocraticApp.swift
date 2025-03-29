//
//  SocraticApp.swift
//  Socratic
//
//  Created by Henry Anyimadu on 3/17/25.
//

import SwiftUI
import Firebase

class AppDelegate: NSObject, UIApplicationDelegate {
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        FirebaseApp.configure()
        return true
    }
}

@main
struct SocraticApp: App {
    @StateObject private var appState = AppState()
    
    init() {
        FirebaseApp.configure()
        
        // Force dark appearance regardless of system settings
        UIWindow.appearance().overrideUserInterfaceStyle = .dark
        
        // Configure global UI appearance
        let navBarAppearance = UINavigationBarAppearance()
        navBarAppearance.configureWithOpaqueBackground()
        navBarAppearance.backgroundColor = UIColor.black
        navBarAppearance.titleTextAttributes = [.foregroundColor: UIColor.white]
        navBarAppearance.largeTitleTextAttributes = [.foregroundColor: UIColor.white]
        
        UINavigationBar.appearance().standardAppearance = navBarAppearance
        UINavigationBar.appearance().compactAppearance = navBarAppearance
        UINavigationBar.appearance().scrollEdgeAppearance = navBarAppearance
        
        // Configure tab bar appearance
        let tabBarAppearance = UITabBarAppearance()
        tabBarAppearance.configureWithOpaqueBackground()
        tabBarAppearance.backgroundColor = UIColor.black
        
        UITabBar.appearance().standardAppearance = tabBarAppearance
        UITabBar.appearance().scrollEdgeAppearance = tabBarAppearance
    }
    
    var body: some Scene {
        WindowGroup {
            if appState.isAuthenticated {
                MainTabView(appState: AppState())
                    .environmentObject(appState)
                    .preferredColorScheme(.dark) // Force dark mode colors for SwiftUI
                    .background(AppTheme.background) // Apply our black background globally
            } else {
                AuthView()
                    .environmentObject(appState)
                    .preferredColorScheme(.dark) // Force dark mode colors for SwiftUI
                    .background(AppTheme.background) // Apply our black background globally
            }
        }
    }
}
