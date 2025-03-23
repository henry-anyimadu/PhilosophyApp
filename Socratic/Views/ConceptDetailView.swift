//
//  ConceptDetailView.swift
//  Socratic
//
//  Created by Henry Anyimadu on 3/23/25.
//

import SwiftUI

struct ConceptDetailView: View {
    let concept: PhilosophyConcept
    @State private var currentTab = 0
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 20) {
                // Concept header
                VStack(alignment: .leading) {
                    Text(concept.branch.rawValue)
                        .font(.subheadline)
                        .foregroundColor(concept.branch.color)
                    
                    Text(concept.title)
                        .font(.title)
                        .fontWeight(.bold)
                    
                    Text(concept.description)
                        .foregroundColor(.secondary)
                        .padding(.top, 4)
                }
                .padding(.horizontal)
                
                // Progress bar
                HStack {
                    Text("Progress: \(Int(concept.completionPercentage * 100))%")
                        .font(.subheadline)
                    
                    Spacer()
                    
                    if concept.completionPercentage < 1.0 {
                        Button(action: {
                            // Continue learning action
                        }) {
                            Text("Continue")
                                .fontWeight(.medium)
                                .foregroundColor(.white)
                                .padding(.horizontal, 16)
                                .padding(.vertical, 8)
                                .background(concept.branch.color)
                                .cornerRadius(8)
                        }
                    } else {
                        Text("Completed")
                            .fontWeight(.medium)
                            .foregroundColor(.white)
                            .padding(.horizontal, 16)
                            .padding(.vertical, 8)
                            .background(Color.green)
                            .cornerRadius(8)
                    }
                }
                .padding(.horizontal)
                
                // Tab selector
                Picker("Content", selection: $currentTab) {
                    Text("Learn").tag(0)
                    Text("Original Text").tag(1)
                    Text("Quiz").tag(2)
                }
                .pickerStyle(SegmentedPickerStyle())
                .padding(.horizontal)
                
                // Content based on selected tab
                if currentTab == 0 {
                    SimplifiedContentView(concept: concept)
                } else if currentTab == 1 {
                    OriginalTextView(concept: concept)
                } else {
                    QuizView(concept: concept)
                }
            }
            .padding(.vertical)
        }
        .navigationBarTitleDisplayMode(.inline)
    }
}

//#Preview {
//    ConceptDetailView()
//}
