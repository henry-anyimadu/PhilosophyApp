//
//  HomeView.swift
//  Socratic
//
//  Created by Henry Anyimadu on 3/23/25.
//

import SwiftUI

struct HomeView: View {
    @EnvironmentObject var appState: AppState
    
    var body: some View {
        NavigationView {
            ScrollView {
                VStack(alignment: .leading, spacing: 20) {
                    // Daily streak and goal section
                    VStack(alignment: .leading) {
                        HStack {
                            VStack(alignment: .leading) {
                                Text("Day \(appState.streakCount)")
                                    .font(.title)
                                    .fontWeight(.bold)
                                Text("Keep your streak going!")
                                    .foregroundColor(.secondary)
                            }
                            Spacer()
                            Image(systemName: "flame.fill")
                                .font(.system(size: 40))
                                .foregroundColor(.orange)
                        }
                        .padding()
                        .background(Color(.systemGray6))
                        .cornerRadius(12)
                    }
                    
                    // Today's lessons
                    VStack(alignment: .leading) {
                        Text("Today's Lessons")
                            .font(.headline)
                            .padding(.bottom, 8)
                        
                        ForEach(appState.philosophyConcepts.prefix(3)) { concept in
                            NavigationLink(destination: ConceptDetailView(concept: concept)) {
                                ConceptCardView(concept: concept)
                            }
                            .buttonStyle(PlainButtonStyle())
                        }
                    }
                    
                    // Continue learning
                    VStack(alignment: .leading) {
                        Text("Continue Learning")
                            .font(.headline)
                            .padding(.bottom, 8)
                            .padding(.top, 12)
                        
                        ScrollView(.horizontal, showsIndicators: false) {
                            HStack(spacing: 16) {
                                ForEach(appState.philosophyConcepts) { concept in
                                    if concept.completionPercentage > 0 && concept.completionPercentage < 1.0 {
                                        NavigationLink(destination: ConceptDetailView(concept: concept)) {
                                            ContinueLearningCard(concept: concept)
                                        }
                                        .buttonStyle(PlainButtonStyle())
                                    }
                                }
                            }
                        }
                    }
                }
                .preferredColorScheme(.dark)
                .padding()
            }
            .navigationTitle("Home")
        }
    }
}

#Preview {
    HomeView()
        .environmentObject(AppState())
}
