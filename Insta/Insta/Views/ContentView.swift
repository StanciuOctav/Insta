//
//  MainView.swift
//  Insta
//
//  Created by Octav Stanciu on 27.07.2025.
//

import SwiftUI

struct ContentView: View {
    @StateObject private var viewModel: StoriesViewModel
    @State private var loadError: Error?
    @State private var showErrorAlert = false
    
    init(viewModel: StoriesViewModel) {
        self._viewModel = StateObject(wrappedValue: viewModel)
    }
    
    var body: some View {
        VStack {
            StoryListView(viewModel: viewModel)
            Spacer()
        }
        .onAppear {
            viewModel.loadStories()
        }
    }
}
