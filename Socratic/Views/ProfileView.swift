//
//  ProfileView.swift
//  Socratic
//
//  Created by Henry Anyimadu on 3/23/25.
//

import SwiftUI

struct ProfileView: View {
    @EnvironmentObject var appState: AppState
    
    var body: some View {
        NavigationView {
            ScrollView {
                VStack(spacing: 24) {
                    // User info header
                    VStack {
                        Image(systemName: "person.circle.fill")
                            .font(.system(size: 80))
                            .foregroundColor(.blue)
                        
                        Text("John Doe")
                            .font(.title2)
                            .fontWeight(.bold)
                            .padding(.top, 8)
                        
                        Text("Joined March 2023")
                            .font(.subheadline)
                            .foregroundColor(.secondary)
                    }
                    .padding()
                    
                    // Stats section
                    VStack(alignment: .leading) {
                        Text("Your Stats")
                            .font(.headline)
                            .padding(.bottom, 8)
                        
                        HStack {
                            StatItemView(value: "\(appState.streakCount)", label: "Day Streak", icon: "flame.fill", color: .orange)
                            StatItemView(value: "42", label: "Concepts Learned", icon: "book.fill", color: .blue)
                            StatItemView(value: "87%", label: "Quiz Accuracy", icon: "checkmark.circle.fill", color: .green)
                        }
                    }
                    .padding(.horizontal)
                    
                    // Progress overview
                    VStack(alignment: .leading) {
                        Text("Branch Progress")
                            .font(.headline)
                            .padding(.bottom, 8)
                        
                        ForEach(PhilosophyBranch.allCases, id: \.self) { branch in
                            BranchProgressView(branch: branch, progress: branchProgress(branch))
                        }
                    }
                    .padding(.horizontal)
                    
                    // Achievements
                    VStack(alignment: .leading) {
                        Text("Achievements")
                            .font(.headline)
                            .padding(.bottom, 8)
                        
                        ScrollView(.horizontal, showsIndicators: false) {
                            HStack(spacing: 16) {
                                AchievementView(icon: "1.circle.fill", title: "First Step", description: "Completed your first concept", isUnlocked: true)
                                AchievementView(icon: "7.circle.fill", title: "Consistent Philosopher", description: "7 day learning streak", isUnlocked: true)
                                AchievementView(icon: "brain.head.profile", title: "Knowledge Seeker", description: "Complete 10 quizzes", isUnlocked: false)
                            }
                        }
                    }
                    .padding(.horizontal)
                    
                    // Settings button
                    Button(action: {
                        // Navigate to settings
                    }) {
                        HStack {
                            Image(systemName: "gear")
                            Text("Settings")
                        }
                        .foregroundColor(.primary)
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(Color(.systemGray6))
                        .cornerRadius(8)
                    }
                    .padding(.horizontal)
                    
                    // Logout button
                    Button(action: {
                        appState.logout()
                    }) {
                        HStack {
                            Image(systemName: "arrow.right.square")
                            Text("Logout")
                        }
                        .foregroundColor(.red)
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(Color(.systemGray6))
                        .cornerRadius(8)
                    }
                    .padding(.horizontal)
                }
                .padding(.vertical)
            }
            .navigationTitle("Profile")
        }
    }
    
    // Calculate progress for each branch - in real app would use actual data
    private func branchProgress(_ branch: PhilosophyBranch) -> Double {
        let branchConcepts = appState.philosophyConcepts.filter { $0.branch == branch }
        if branchConcepts.isEmpty { return 0.0 }
        
        let totalProgress = branchConcepts.reduce(0.0) { $0 + $1.completionPercentage }
        return totalProgress / Double(branchConcepts.count)
    }
}

#Preview {
    ProfileView()
}
