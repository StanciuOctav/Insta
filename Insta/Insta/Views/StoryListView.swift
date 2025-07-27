//
//  StoryListView.swift
//  Insta
//
//  Created by Octav Stanciu on 27.07.2025.
//

import SwiftUI

struct StoryListView: View {
    @ObservedObject var viewModel: StoriesViewModel
    let onStoryTap: (Int, Int) -> Void
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 16) {
                ForEach(Array(viewModel.stories.enumerated()), id: \ .element.id) { index, user in
                    StoryBubbleView(
                        user: user,
                        size: 70,
                        onTap: {
                            onStoryTap(index, 0)
                        }
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
