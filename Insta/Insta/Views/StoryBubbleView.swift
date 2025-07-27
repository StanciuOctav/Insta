//
//  StoryBubbleView.swift
//  Insta
//
//  Created by Octav Stanciu on 27.07.2025.
//

import SwiftUI

struct StoryBubbleView: View {
    let isSeen: Bool
    let size: CGFloat
    
    var body: some View {
        ZStack {
            Circle()
                .strokeBorder(
                    isSeen ? AnyShapeStyle(Color.gray) : AnyShapeStyle(LinearGradient(
                        gradient: Gradient(colors: [Color.yellow, Color.red]),
                        startPoint: .bottomLeading,
                        endPoint: .topTrailing
                    )),
                    lineWidth: 2
                )
                .frame(width: size, height: size)
            
            Image(systemName: "person.crop.circle")
                .resizable()
                .scaledToFill()
                .frame(width: size - 8, height: size - 8)
                .clipShape(Circle())
        }
    }
}

struct StoryBubbleView_Previews: PreviewProvider {
    static var previews: some View {
        VStack(spacing: 20) {
            StoryBubbleView(
                isSeen: false,
                size: 70
            )
            StoryBubbleView(
                isSeen: true,
                size: 70,
            )
        }
        .padding()
        .previewLayout(.sizeThatFits)
    }
}
