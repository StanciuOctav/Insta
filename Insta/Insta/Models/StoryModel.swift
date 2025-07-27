//
//  StoryModel.swift
//  Insta
//
//  Created by Octav Stanciu on 27.07.2025.
//

import Foundation

struct StoriesRoot: Codable {
    let pages: [StoriesPage]
}

struct StoriesPage: Codable {
    let users: [StoryUser]
}

struct Story: Codable, Identifiable, Equatable {
    let id: Int
    let systemName: String
    
    enum CodingKeys: String, CodingKey {
        case id
        case systemName = "system_name"
    }
}

struct StoryUser: Codable, Identifiable, Equatable {
    var id: Int
    let name: String
    let profilePicSystemName: String
    let stories: [Story]
    var isSeen: Bool = false
    var isLiked: Bool = false
    
    enum CodingKeys: String, CodingKey {
        case id
        case name
        case profilePicSystemName = "profile_picture_system_name"
        case stories
    }
}
