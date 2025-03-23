//
//  BranchProgressView.swift
//  Socratic
//
//  Created by Henry Anyimadu on 3/23/25.
//

import SwiftUI

struct BranchProgressView: View {
    let branch: PhilosophyBranch
    let progress: Double
    
    var body: some View {
        HStack {
            Image(systemName: branch.icon)
                .foregroundColor(branch.color)
                .font(.system(size: 20))
                .frame(width: 24)
            
            Text(branch.rawValue)
                .font(.subheadline)
            
            Spacer()
            
            Text("\(Int(progress * 100))%")
                .font(.subheadline)
                .fontWeight(.semibold)
                .foregroundColor(branch.color)
        }
        .padding(.vertical, 2)
    }
}
