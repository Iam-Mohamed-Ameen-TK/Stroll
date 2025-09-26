//
//  MatchCard.swift
//  Stroll
//
//  Created by Mohamed Ameen on 26/09/25.
//

import Foundation

struct MatchCard: Identifiable {
    let id = UUID()
    let imageName: String
    let title: String
    let question: String
    let prompt: String
}
