//
//  StoryListView.swift
//  Insta
//
//  Created by Octav Stanciu on 27.07.2025.
//

import SwiftUI

struct StoryListView: View {
    @ObservedObject var viewModel: StoriesViewModel
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 16) {
                ForEach(Array(viewModel.stories.enumerated()), id: \ .element.id) { index, story in
                    StoryBubbleView(
                        isSeen: story.isSeen,
                        size: 70
                    )
                    .onAppear {
                        viewModel.loadMoreStoriesIfNeeded(currentIndex: index)
                    }
                }
            }
            .padding(.horizontal)
        }
    }
}
