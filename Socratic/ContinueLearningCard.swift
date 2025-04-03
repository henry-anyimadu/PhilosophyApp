//
//  ContinueLearningCard.swift
//  Socratic
//
//  Created by Henry Anyimadu on 3/23/25.
//

import SwiftUI

// VIEW: Continue Learning Card
struct ContinueLearningCard: View {
    let concept: PhilosophyConcept
    
    var body: some View {
        VStack(alignment: .leading) {
            // Branch indicator and progress
            HStack {
                Text(concept.branch.rawValue)
                    .font(.caption)
                    .padding(.horizontal, 8)
                    .padding(.vertical, 4)
                    .background(concept.branch.color.opacity(0.2))
                    .foregroundColor(.white)
                    .cornerRadius(4)
                
                Spacer()
                
                Text("\(Int(concept.completionPercentage * 100))%")
                    .font(.caption)
                    .fontWeight(.bold)
                    .foregroundColor(.white)
            }
            
            // Title
            Text(concept.title)
                .font(.headline)
                .padding(.top, 4)
                .lineLimit(2)
                .fixedSize(horizontal: false, vertical: true)
            
            Spacer()
            
            // Progress bar
            GeometryReader { geometry in
                ZStack(alignment: .leading) {
                    Rectangle()
                        .frame(width: geometry.size.width, height: 8)
                        .opacity(0.3)
                        .foregroundColor(.white)
                    
                    Rectangle()
                        .frame(width: min(CGFloat(concept.completionPercentage) * geometry.size.width, geometry.size.width), height: 8)
                        .foregroundColor(.white)
                }
                .cornerRadius(4)
            }
            .frame(height: 8)
        }
        .padding()
        .frame(width: 160, height: 120)
        .background(.gray.opacity(0.4))
        .cornerRadius(2)
    }
}

//#Preview {
//    ContinueLearningCard()
//}
