//
//  MatchView.swift
//  Stroll
//
//  Created by Mohamed Ameen on 26/09/25.
//

import SwiftUI

struct MatchesView: View {
    // Mock Data for Match Cards
    private let matchCards = [
        MatchCard(
            imageName: "card1",
            title: "Amanda, 22",
            question: "What is your most favourite\nchildhood memory?",
            prompt: "Tap to answer"
        ),
        MatchCard(
            imageName: "card2",
            title: "Malte, 31",
            question: "What is the most important quality in friendships to you?",
            prompt: "Tap to answer"
        ),
        MatchCard(
            imageName: "card3",
            title: "Sofia, 29",
            question: "If you could travel anywhere in the world, where would you go?",
            prompt: "Tap to answer"
        )
    ]

    
    private let chats = [
        Chat(name: "Jessica", message: "Voice message", time: "6:21 pm", avatar: "avatar1", status: "New chat", unreadCount: nil),
        Chat(name: "Amanda", message: "Lol I love house music too", time: "6:21 pm", avatar: "avatar2", status: "Your move", unreadCount: nil),
        Chat(name: "Sila", message: "You: I love the people there tbh, have you been?", time: "Wed", avatar: "avatar3", status: nil, unreadCount: nil),
        Chat(name: "Marie", message: "Hahaha that's interesting, it does seem like people here are startin...", time: "6:21 pm", avatar: "avatar4", status: "Your move", unreadCount: 4)
    ]
    
    var body: some View {
        GeometryReader { geo in
            let screenWidth = geo.size.width
            let screenHeight = geo.size.height
            let cardHeight = screenHeight * 0.30
            let spacing: CGFloat = 12
            let visiblePeek: CGFloat = 40
            let cardWidth = (screenWidth - visiblePeek - spacing * 2) / 2
            
            VStack(spacing: 0) {
                ScrollView(.vertical, showsIndicators: false) {
                    VStack(alignment: .leading, spacing: 20) {
                        
                        // Header
                        HStack {
                            VStack(alignment: .leading, spacing: 4) {
                                HStack(spacing: 8) {
                                    Text("Your Turn")
                                        .font(.title2)
                                        .fontWeight(.bold)
                                        .foregroundColor(.white)
                                    Circle()
                                        .fill(Color.customLightPurple)
                                        .frame(width: 24, height: 24)
                                        .overlay(
                                            Text("7")
                                                .foregroundColor(.white)
                                                .font(.caption)
                                                .fontWeight(.semibold)
                                        )
                                }
                                Text("Make your move, they are waiting 🎵")
                                    .font(.subheadline)
                                    .foregroundColor(.gray)
                            }
                            Spacer()
                            VStack(spacing: 6) {
                                Image("avatar5")
                                    .resizable()
                                    .scaledToFill()
                                    .frame(width: 100, height: 60)
                                    .shadow(radius: 4)
                            }
                            .frame(width: 70)
                        }
                        .padding(.horizontal)
                        
                        // Match Cards Section
                        ScrollView(.horizontal, showsIndicators: false) {
                            HStack(spacing: spacing) {
                                ForEach(Array(matchCards.enumerated()), id: \.element.id) { index, card in
                                    MatchCardView(
                                        card: card,
                                        width: cardWidth,
                                        height: cardHeight,
                                        showOverlayImage: index == 1 || index == 2
                                    )
                                }
                            }
                            .padding(.horizontal, spacing)
                        }
                        
                        // Chats Section
                        VStack(alignment: .leading, spacing: 16) {
                            VStack(alignment: .leading, spacing: 12) {
                                HStack(spacing: 20) {
                                    Text("Chats")
                                        .font(.title3)
                                        .fontWeight(.bold)
                                        .foregroundColor(.white)
                                        .overlay(
                                            Rectangle()
                                                .frame(height: 1)
                                                .foregroundColor(.white)
                                                .offset(y: 4),
                                            alignment: .bottom
                                        )
                                    
                                    Text("Pending")
                                        .font(.title2)
                                        .fontWeight(.bold)
                                        .foregroundColor(.gray)
                                }
                                
                                Text("The ice is broken. Time to hit it off")
                                    .font(.subheadline)
                                    .foregroundColor(.gray)
                            }
                            .padding(.horizontal)
                            
                            VStack(spacing: 20) {
                                ForEach(chats) { chat in
                                    ChatRowView(chat: chat)
                                        .padding(.horizontal)
                                }
                            }
                        }
                        
                    }
                    .padding(.top)
                }
                
                TabBarView()
            }
            .background(Color.black.ignoresSafeArea())
        }
    }
}

#Preview {
    MatchesView()
        .preferredColorScheme(.dark)
}

