//
//  ConceptNodeView.swift
//  Socratic
//
//  Created by Henry Anyimadu on 3/23/25.
//

import SwiftUI

struct ConceptNodeView: View {
    let concept: PhilosophyConcept
    
    var body: some View {
        VStack {
            ZStack {
                // Background circle
                Rectangle()
                    .fill(concept.isUnlocked ? concept.branch.color : Color.gray)
                    .frame(width: 60, height: 40)
                    .cornerRadius(10)
                
                // Border
                Rectangle()
                    .stroke(Color.white, lineWidth: 5)
                    .frame(width: 60, height: 40)
                    .cornerRadius(5)
                
                if !concept.isUnlocked {
                    // Lock icon for locked concepts
                    Image(systemName: "lock.fill")
                        .foregroundColor(.white)
                        .font(.system(size: 22, weight: .bold))
                } else if concept.completionPercentage >= 1.0 {
                    // Checkmark for completed concepts
                    Image(systemName: "checkmark")
                        .foregroundColor(.white)
                        .font(.system(size: 24, weight: .bold))
                } else {
                    // Progress percentage for in-progress concepts
                    Text("\(Int(concept.completionPercentage * 100))%")
                        .foregroundColor(.white)
                        .font(.system(size: 14, weight: .bold))
                }
            }
            
            ZStack {
                Rectangle()
                    .fill(Color.black)
                    .frame(width: 80, height: 30)
                    .cornerRadius(2)
                    .opacity(0.7)
                
                VStack {
                    // Concept title with conditional opacity for locked concepts
                    Text(concept.title)
                        .foregroundStyle(AppTheme.primaryText)
                        .font(.caption)
                        .fontWeight(concept.isUnlocked ? .semibold : .regular)
                        .multilineTextAlignment(.center)
                        .lineLimit(2)
                        .frame(width: 80)
                    
                    // Difficulty indicator
                    HStack(spacing: 2) {
                        ForEach(1...concept.difficulty, id: \.self) { _ in
                            Image(systemName: "circle.fill")
                                .font(.system(size: 5))
                                .foregroundColor(concept.isUnlocked ? concept.branch.color : Color.gray)
                        }
                    }
                }
            }
        }
        .padding(8)
    }
}

#Preview {
    VStack(spacing: 20) {
        // Unlocked and not started
        ConceptNodeView(concept: PhilosophyConcept(
            id: "test1",
            title: "Introduction to Ethics",
            description: "Understanding the basics of ethical reasoning",
            branch: .ethics,
            difficulty: 1,
            prerequisites: [],
            isUnlocked: true,
            completionPercentage: 0.0
        ))
        
        // In progress
        ConceptNodeView(concept: PhilosophyConcept(
            id: "test2",
            title: "Virtue Ethics",
            description: "Aristotle's approach to ethical living",
            branch: .ethics,
            difficulty: 2,
            prerequisites: ["ethics1"],
            isUnlocked: true,
            completionPercentage: 0.5
        ))
        
        // Completed
        ConceptNodeView(concept: PhilosophyConcept(
            id: "test3",
            title: "Utilitarianism",
            description: "The greatest happiness principle",
            branch: .ethics,
            difficulty: 2,
            prerequisites: ["ethics1"],
            isUnlocked: true,
            completionPercentage: 1.0
        ))
        
        // Locked
        ConceptNodeView(concept: PhilosophyConcept(
            id: "test4",
            title: "Meta-Ethics",
            description: "The nature of ethical properties and statements",
            branch: .ethics,
            difficulty: 4,
            prerequisites: ["ethics5"],
            isUnlocked: false,
            completionPercentage: 0.0
        ))
    }
    .padding()
    .background(Color(.systemGray6))
    .previewLayout(.sizeThatFits)
}
