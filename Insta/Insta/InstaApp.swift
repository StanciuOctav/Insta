//
//  InstaApp.swift
//  Insta
//
//  Created by Octav Stanciu on 27.07.2025.
//

import SwiftUI

@main
struct InstaApp: App {
    @StateObject private var mainVM = MainViewModel()
    var body: some Scene {
        WindowGroup {
            NavigationStack {
                ContentView(viewModel: mainVM.returnStoriesViewModel())
                    .navigationTitle("Instagram")
            }
        }
    }
}
