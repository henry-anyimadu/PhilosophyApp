//
//  SimplifiedContentView.swift
//  Socratic
//
//  Created by Henry Anyimadu on 3/23/25.
//

import SwiftUI

struct SimplifiedContentView: View {
    let concept: PhilosophyConcept
    
    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            // Content sections
            ContentSectionView(title: "Introduction", content: "This is a simplified introduction to \(concept.title). The content would be adapted to be easily digestible in a microlearning format.")
            
            ContentSectionView(title: "Key Ideas", content: "These are the main points to understand about this philosophical concept, presented in a clear, concise manner suitable for short learning sessions.")
            
            ContentSectionView(title: "Examples", content: "Here are practical examples of how this philosophical concept applies to everyday situations, making it more relatable and easier to understand.")
            
            ContentSectionView(title: "Modern Relevance", content: "This section explains why this philosophical concept remains important today and how it influences modern thinking and ethical considerations.")
        }
        .padding(.horizontal)
    }
}

//#Preview {
//    SimplifiedContentView()
//}
