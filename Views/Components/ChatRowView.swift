//
//  ChatRowView.swift
//  Stroll
//
//  Created by Mohamed Ameen on 26/09/25.
//

import SwiftUI

struct ChatRowView: View {
    let chat: Chat
    
    var body: some View {
        HStack(spacing: 12) {
            AvatarView(imageName: chat.avatar, size: 56)
            
            VStack(alignment: .leading, spacing: 6) {
                HStack(spacing: 8) {
                    Text(chat.name)
                        .font(.headline)
                        .foregroundColor(.white)
                    
                    if let status = chat.status {
                        Text(status)
                            .font(.caption)
                            .fontWeight(.medium)
                            .padding(.horizontal, 8)
                            .padding(.vertical, 3)
                            .background(
                                status == "New chat" ? Color.customLightPurple : Color.gray
                            )
                            .foregroundColor(.white)
                            .clipShape(Capsule())
                    }
                    
                    Spacer()
                }
                
                HStack(spacing: 8) {
                    if chat.message == "Voice message" {
                        Image(systemName: "mic.fill")
                            .foregroundColor(.customLightPurple)
                            .font(.body)
                        
                        HStack(spacing: 2) {
                            ForEach(0..<8) { _ in
                                RoundedRectangle(cornerRadius: 1)
                                    .fill(Color.customLightPurple)
                                    .frame(width: 2, height: CGFloat.random(in: 8...20))
                            }
                        }
                        
                        Text("00:58")
                            .font(.caption)
                            .foregroundColor(.customLightPurple)
                            .monospacedDigit()
                    } else {
                        Text(chat.message)
                            .font(.subheadline)
                            .foregroundColor(
                                chat.name == "Sila" ? Color.gray :
                                    chat.name == "Marie" ? .white :
                                        .white
                            )
                            .lineLimit(
                                chat.name == "Sila" || chat.name == "Marie" ? 2 : 1
                            )
                    }
                    
                    Spacer()
                }
            }
            
            VStack(alignment: .trailing, spacing: 8) {
                Text(chat.time)
                    .font(.caption)
                    .foregroundColor(chat.name == "Sila" ? .white : .customLightPurple)
                
                if let count = chat.unreadCount {
                    Circle()
                        .fill(Color.customLightPurple)
                        .frame(width: 20, height: 20)
                        .overlay(
                            Text("\(count)")
                                .font(.caption2)
                                .fontWeight(.semibold)
                                .foregroundColor(.white)
                        )
                } else if chat.name == "Jessica" {
                    Circle()
                        .fill(Color.customLightPurple)
                        .frame(width: 20, height: 20)
                        .overlay(
                            Image(systemName: "star.fill")
                                .foregroundColor(.black)
                                .font(.caption2)
                        )
                }
            }
        }
        
    }
}
