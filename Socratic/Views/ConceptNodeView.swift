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
                Circle()
                    .fill(concept.isUnlocked ? concept.branch.color : Color.gray)
                    .frame(width: 60, height: 60)
                
                Circle()
                    .stroke(Color.white, lineWidth: 3)
                    .frame(width: 60, height: 60)
                
                if concept.completionPercentage >= 1.0 {
                    Image(systemName: "checkmark")
                        .foregroundColor(.white)
                        .font(.system(size: 24, weight: .bold))
                } else if concept.isUnlocked {
                    Text("\(Int(concept.completionPercentage * 100))%")
                        .foregroundColor(.white)
                        .font(.system(size: 14, weight: .bold))
                } else {
                    Image(systemName: "lock.fill")
                        .foregroundColor(.white)
                }
            }
            
            Text(concept.title)
                .font(.caption)
                .multilineTextAlignment(.center)
                .lineLimit(2)
                .frame(width: 80)
        }
    }
}
//
//#Preview {
//    ConceptNodeView()
//}
