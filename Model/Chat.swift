//
//  Chat.swift
//  Stroll
//
//  Created by Mohamed Ameen on 26/09/25.
//

import Foundation

struct Chat: Identifiable {
    let id = UUID()
    let name: String
    let message: String
    let time: String
    let avatar: String
    let status: String?
    let unreadCount: Int?
}
