//
//  OriginalTextView.swift
//  Socratic
//
//  Created by Henry Anyimadu on 3/23/25.
//

import SwiftUI

struct OriginalTextView: View {
    let concept: PhilosophyConcept
    
    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            Text("Original Text")
                .font(.headline)
                .padding(.bottom, 4)
            
            Text("This is where you would include an excerpt from the original philosophical text related to \(concept.title). The text would be carefully selected to be manageable within a microlearning context, typically 300-500 words.")
                .font(.body)
                .padding(.bottom, 8)
            
            Divider()
            
            Text("Context & Commentary")
                .font(.headline)
                .padding(.vertical, 4)
            
            Text("This section would provide historical context and scholarly commentary to help the user understand the original text, its significance, and how it fits within the broader philosophical tradition.")
                .font(.body)
        }
        .padding(.horizontal)
    }
}

//#Preview {
//    OriginalTextView()
//}
