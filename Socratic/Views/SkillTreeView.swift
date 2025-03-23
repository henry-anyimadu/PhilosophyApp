//
//  SkillTreeView.swift
//  Socratic
//
//  Created by Henry Anyimadu on 3/23/25.
//

import SwiftUI

struct SkillTreeView: View {
    @EnvironmentObject var appState: AppState
    let branch: PhilosophyBranch
    
    private var branchConcepts: [PhilosophyConcept] {
        appState.philosophyConcepts.filter { $0.branch == branch }
    }
    
    var body: some View {
        // Simplified skill tree visualization
        VStack(spacing: 30) {
            // Level 1 concepts (no prerequisites)
            HStack(spacing: 40) {
                ForEach(branchConcepts.filter { $0.prerequisites.isEmpty }) { concept in
                    NavigationLink(destination: ConceptDetailView(concept: concept)) {
                        ConceptNodeView(concept: concept)
                    }
                }
            }
            .frame(maxWidth: .infinity)
            
            // Connection lines
            Path { path in
                // Simplified for MVP - would be more dynamic based on actual concept relationships
                path.move(to: CGPoint(x: 100, y: 0))
                path.addLine(to: CGPoint(x: 60, y: 30))
                
                path.move(to: CGPoint(x: 100, y: 0))
                path.addLine(to: CGPoint(x: 140, y: 30))
            }
            .stroke(Color.gray, style: StrokeStyle(lineWidth: 2, dash: [5]))
            .frame(height: 30)
            
            // Level 2 concepts
            HStack(spacing: 40) {
                ForEach(branchConcepts.filter { !$0.prerequisites.isEmpty }) { concept in
                    NavigationLink(destination: ConceptDetailView(concept: concept)) {
                        ConceptNodeView(concept: concept)
                    }
                }
            }
            .frame(maxWidth: .infinity)
        }
    }
}
//
//#Preview {
//    SkillTreeView()
//}
