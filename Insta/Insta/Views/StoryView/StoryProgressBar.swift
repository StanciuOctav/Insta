//
//  StoryProgressBar.swift
//  Insta
//
//  Created by Octav Stanciu on 27.07.2025.
//

import SwiftUI

struct ProgressBarRow: View {
    let storyCount: Int
    let currentIndex: Int
    let progress: Double
    
    var body: some View {
        HStack(spacing: 6) {
            ForEach(0..<storyCount, id: \ .self) { idx in
                ProgressView(value: idx < currentIndex ? 1 : (idx == currentIndex ? progress : 0))
                    .progressViewStyle(LinearProgressViewStyle(tint: .white))
                    .frame(height: 2)
                    .background(Color.white.opacity(0.15))
                    .cornerRadius(1)
            }
        }
    }
}
