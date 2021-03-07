//
//  RepositoryModel.swift
//  OtriumApp
//
//  Created by Rizvi on 3/7/21.
//

struct RepositoryModel: Decodable {
    let name : String?
    let description: String
    let forkCount : Int
    let openGraphImageUrl: String
    let primaryLanguage: PinnedLanguage?
}

struct MainModel : Decodable {
    let name : String
    
    let pinnedItems: MainPinned?
    
}

struct MainPinned: Decodable  {
    let edges: [MainEdges]
}

struct MainEdges: Decodable {
    let node: PinndedModel
}

