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

struct StoryUser: Codable, Identifiable, Equatable {
    var id: Int
    let name: String
    let profilePicUrl: String
    
    var isSeen: Bool = false
    var isLiked: Bool = false

    enum CodingKeys: String, CodingKey {
        case id
        case name
        case profilePicUrl = "profile_picture_url"
    }
}
