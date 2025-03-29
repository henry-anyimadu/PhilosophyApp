//
//  LearningPathView.swift
//  Socratic
//
//  Created by Henry Anyimadu on 3/23/25.
//

import SwiftUI

struct LearningPathView: View {
    @State private var selectedBranch: PhilosophyBranch = .ethics
    
    var body: some View {
        NavigationView {
            VStack {
                // Branch selector
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack(spacing: 16) {
                        ForEach(PhilosophyBranch.allCases, id: \.self) { branch in
                            BranchButton(branch: branch, isSelected: selectedBranch == branch) {
                                selectedBranch = branch
                            }
                        }
                    }
                    .padding(.horizontal)
                }
                .padding(.vertical, 8)
                
                // Skill tree visualization
                ScrollView {
                    VStack(alignment: .leading) {
                        Text(selectedBranch.rawValue)
                            .font(.title)
                            .fontWeight(.bold)
                            .padding(.horizontal, 40)
                        
                        // Simplified skill tree for MVP
                        SkillTreeView(branch: selectedBranch)
                            .environmentObject(AppState())
                            .padding(.horizontal, -40)
                    }
                    .padding(.vertical)
                }
            }
            .navigationTitle("Learning Path")
        }
        .preferredColorScheme(.dark)
    }
}

#Preview {
    LearningPathView()
}
