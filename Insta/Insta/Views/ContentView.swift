//
//  MainView.swift
//  Insta
//
//  Created by Octav Stanciu on 27.07.2025.
//

import SwiftUI

struct ContentView: View {
    @StateObject private var viewModel: StoriesViewModel
    @State private var isStoryViewerPresented: Bool = false
    @State private var selectedUserIndex: Int? = nil
    @State private var selectedStoryIndex: Int = 0
    
    init(viewModel: StoriesViewModel) {
        self._viewModel = StateObject(wrappedValue: viewModel)
    }
    
    var body: some View {
        ZStack {
            VStack {
                StoryListView(
                    viewModel: viewModel,
                    onStoryTap: { userIndex, storyIndex in
                        selectedUserIndex = userIndex
                        selectedStoryIndex = storyIndex
                        isStoryViewerPresented = true
                    }
                )
                Spacer()
            }
            if let userIndex = selectedUserIndex, isStoryViewerPresented {
                withAnimation {
                    StoryView(
                        users: viewModel.stories,
                        currentUserIndex: userIndex,
                        currentStoryIndex: selectedStoryIndex,
                        onClose: {
                            isStoryViewerPresented = false
                            selectedUserIndex = nil
                            selectedStoryIndex = 0
                        }
                    )
                    .transition(.opacity)
                    .zIndex(1)
                }
            }
        }
    }
}
