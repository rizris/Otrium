//
//  UserModel.swift
//  OtriumApp
//
//  Created by Rizvi on 3/6/21.
//

import Foundation

struct UserModel : Decodable {
    let name : String
    let login : String
    let email: String
    let avatarUrl: String?
    let followers: Followers?
    let following: Following?
    
    let pinnedItems: Pinned?
    let topRepositories : TopRepo?
    let starredRepositories: StarredRepo?
}

struct Followers: Decodable {
    let totalCount: Int?
}

struct Following: Decodable {
    let totalCount: Int?
}

struct Pinned: Decodable  {
    let edges: [Edges]
}

struct Edges: Decodable {
    let node: PinndedModel
}

struct PinndedModel: Decodable {
    let name : String?
    let description: String
    let forkCount : Int
    let openGraphImageUrl: String
    let primaryLanguage: PinnedLanguage?
}

struct PinnedLanguage: Decodable {
    let name : String
}

struct TopRepo: Decodable {
    let nodes: [TopRepository]?
}

struct TopRepository: Decodable {
    let name : String?
    let description: String
    let forkCount : Int
    let openGraphImageUrl: String
    let primaryLanguage: TopLanguage?
}

struct TopLanguage: Decodable {
    let name : String
}


struct StarredRepo: Decodable {
    let nodes: [StarredRepository]?
}

struct StarredRepository: Decodable {
    let name : String?
    let description: String
    let forkCount : Int
    let openGraphImageUrl: String
    let primaryLanguage: StarredLanguage?
}

struct StarredLanguage: Decodable {
    let name : String
}
