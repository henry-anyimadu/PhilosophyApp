//
//  AuthView.swift
//  Socratic
//
//  Created by Henry Anyimadu on 3/23/25.
//

import SwiftUI

struct AuthView: View {
    @EnvironmentObject var appState: AppState
    @State private var email = ""
    @State private var password = ""
    @State private var isLogin = true
    
    var body: some View {
        VStack {
            // Logo and app name
            Image(systemName: "books.vertical.fill")
                .font(.system(size: 80))
                .foregroundColor(.blue)
                .padding()
            
            Text("PhiloLearn")
                .font(.largeTitle)
                .bold()
                .padding(.bottom, 50)
            
            // Auth fields
            TextField("Email", text: $email)
                .padding()
                .background(Color(.systemGray6))
                .cornerRadius(8)
                .padding(.horizontal)
                .keyboardType(.emailAddress)
                .autocapitalization(.none)
            
            SecureField("Password", text: $password)
                .padding()
                .background(Color(.systemGray6))
                .cornerRadius(8)
                .padding(.horizontal)
            
            // Login/Register button
            Button(action: {
                // For demo purposes only - would connect to Firebase Auth
                appState.isAuthenticated = true
            }) {
                Text(isLogin ? "Login" : "Register")
                    .foregroundColor(.white)
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(Color.blue)
                    .cornerRadius(8)
                    .padding(.horizontal)
            }
            .padding(.top)
            
            // Toggle between login and register
            Button(action: {
                isLogin.toggle()
            }) {
                Text(isLogin ? "Don't have an account? Sign up" : "Already have an account? Log in")
                    .foregroundColor(.blue)
                    .padding()
            }
        }
        .padding()
    }
}
