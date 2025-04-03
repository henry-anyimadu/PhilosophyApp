//
//  ConceptCardView.swift
//  Socratic
//
//  Created by Henry Anyimadu on 3/23/25.
//

import SwiftUI

struct ConceptCardView: View {
    let concept: PhilosophyConcept
    
    var body: some View {
        HStack {
            Circle()
                .fill(concept.branch.color)
                .frame(width: 40, height: 40)
                .overlay(
                    Image(systemName: concept.branch.icon)
                        .foregroundColor(.white)
                )
            
            VStack(alignment: .leading, spacing: 4) {
                Text(concept.title)
                    .font(.headline)
                
                Text(concept.description)
                    .font(.subheadline)
                    .foregroundColor(.secondary)
                    .lineLimit(1)
                
                // Progress bar
                GeometryReader { geometry in
                    ZStack(alignment: .leading) {
                        Rectangle()
                            .frame(width: geometry.size.width, height: 6)
                            .opacity(0.3)
                            .foregroundColor(concept.branch.color)
                        
                        Rectangle()
                            .frame(width: min(CGFloat(concept.completionPercentage) * geometry.size.width, geometry.size.width), height: 6)
                            .foregroundColor(concept.branch.color)
                    }
                    .cornerRadius(2)
                }
                .frame(height: 6)
            }
            
            Spacer()
            
            Image(systemName: "chevron.right")
                .foregroundColor(.gray)
        }
        .padding()
        .background(Color(.systemGray6))
        .cornerRadius(2)
    }
}
//#Preview {
//    ConceptCardView()
//}
