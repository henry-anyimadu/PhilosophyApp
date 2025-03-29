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
    
    // Get concepts for the current branch
    private var branchConcepts: [PhilosophyConcept] {
        appState.philosophyConcepts.filter { $0.branch == branch }
    }
    
    // Group concepts by levels (based on prerequisites)
    private var conceptsByLevel: [[PhilosophyConcept]] {
        var levels: [[PhilosophyConcept]] = []
        var processedIds: Set<String> = []
        
        // Level 0: concepts with no prerequisites
        let rootConcepts = branchConcepts.filter { $0.prerequisites.isEmpty }
        levels.append(rootConcepts)
        processedIds.formUnion(rootConcepts.map { $0.id })
        
        // Build subsequent levels
        var currentLevel = 0
        while processedIds.count < branchConcepts.count {
            currentLevel += 1
            
            // Find concepts whose prerequisites are all in previous levels
            let nextLevel = branchConcepts.filter { concept in
                !processedIds.contains(concept.id) && // Not already processed
                concept.prerequisites.allSatisfy { prerequisiteId in
                    processedIds.contains(prerequisiteId)
                }
            }
            
            if nextLevel.isEmpty {
                // No more concepts can be added, might be a circular dependency
                break
            }
            
            levels.append(nextLevel)
            processedIds.formUnion(nextLevel.map { $0.id })
        }
        
        return levels
    }
    
    // Get the position of a concept node by its ID
    private func getConceptPosition(conceptId: String, geometrySize: CGSize) -> CGPoint? {
        // Find the concept in the levels
        for (levelIndex, level) in conceptsByLevel.enumerated() {
            if let conceptIndex = level.firstIndex(where: { $0.id == conceptId }) {
                // Calculate position
                let levelCount = level.count
                let horizontalSpacing = geometrySize.width / CGFloat(levelCount + 1)
                let verticalSpacing = geometrySize.height / CGFloat(conceptsByLevel.count + 1)
                
                let x = horizontalSpacing * CGFloat(conceptIndex + 1)
                let y = verticalSpacing * CGFloat(levelIndex + 1)
                
                return CGPoint(x: x, y: y)
            }
        }
        return nil
    }
    
    // Check if a connection between two concepts should be solid or dashed
    private func shouldBeLineSolid(from sourceId: String, to targetId: String) -> Bool {
        // Find the source and target concepts
        guard let source = branchConcepts.first(where: { $0.id == sourceId }),
              let target = branchConcepts.first(where: { $0.id == targetId }) else {
            return false
        }
        
        // Line is solid if both concepts are accessible
        return source.isUnlocked && target.isUnlocked
    }
    
    var body: some View {
        GeometryReader { geometry in
            ZStack {
                // Draw connection lines first (so they appear behind nodes)
                ForEach(branchConcepts) { concept in
                    ForEach(concept.prerequisites, id: \.self) { prerequisiteId in
                        if let startPoint = getConceptPosition(conceptId: prerequisiteId, geometrySize: geometry.size),
                           let endPoint = getConceptPosition(conceptId: concept.id, geometrySize: geometry.size) {
                            
                            Path { path in
                                path.move(to: startPoint)
                                path.addLine(to: endPoint)
                            }
                            .stroke(
                                Color.gray,
                                style: StrokeStyle(
                                    lineWidth: 2,
                                    dash: shouldBeLineSolid(from: prerequisiteId, to: concept.id) ? [] : [5]
                                )
                            )
                        }
                    }
                }
                
                // Draw concept nodes by level
                ForEach(0..<conceptsByLevel.count, id: \.self) { levelIndex in
                    ForEach(conceptsByLevel[levelIndex]) { concept in
                        if let position = getConceptPosition(conceptId: concept.id, geometrySize: geometry.size) {
                            NavigationLink(destination: ConceptDetailView(concept: concept)) {
                                ConceptNodeView(concept: concept)
                            }
                            .position(x: position.x, y: position.y)
                            .disabled(!concept.isUnlocked) // Disable navigation for locked concepts
                        }
                    }
                }
            }
            .frame(width: geometry.size.width, height: geometry.size.height)
        }
        .frame(minHeight: 500) // Set a minimum height for the skill tree
        .padding(.vertical, 10) // Add padding for better spacing
    }
}

#Preview {
    SkillTreeView(branch: .ethics)
        .environmentObject(AppState())
}
