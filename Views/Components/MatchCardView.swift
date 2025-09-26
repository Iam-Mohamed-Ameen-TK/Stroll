//
//  MatchCardView.swift
//  Stroll
//
//  Created by Mohamed Ameen on 26/09/25.
//

import SwiftUI
import SwiftUI

struct MatchCardView: View {
    let card: MatchCard
    let width: CGFloat
    let height: CGFloat
    let showOverlayImage: Bool

    var body: some View {
        ZStack(alignment: .top) {
            // Card background
            Image(card.imageName)
                .resizable()
                .scaledToFill()
                .frame(width: width, height: height)
                .clipped()
                .cornerRadius(20)
                .shadow(radius: 5)
            
           
            if showOverlayImage {
                Image("image1")
                    .resizable()
                    .scaledToFit()
                    .frame(height: 60)
                    .padding(.top, 12)
                    .frame(maxWidth: .infinity, alignment: .center)
            }
            
            Text(card.prompt)
                .font(.caption)
                .foregroundColor(.gray)
                .multilineTextAlignment(.center)
                .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .center)
            
            // Bottom title & question
            VStack {
                Spacer()
                VStack(spacing: 2) {
                    Text(card.title)
                        .font(.body)
                        .foregroundColor(.white)
                        .multilineTextAlignment(.center)
                    
                    // First card: split question into two lines
                    if card.title.contains("Amanda") {
                        VStack(spacing: 0) {
                            Text("What is your most favourite")
                                .frame(width: width * 0.9, alignment: .center)
                            Text("childhood memory?")
                                .frame(width: width * 0.9, alignment: .center)
                        }
                        .font(.caption2)
                        .foregroundColor(.gray)
                        .multilineTextAlignment(.center)
                    } else {
                        Text(card.question)
                            .font(.caption2)
                            .foregroundColor(.gray)
                            .multilineTextAlignment(.center)
                    }
                }
                .padding()
                .frame(maxWidth: .infinity)
                .background(
                    LinearGradient(
                        colors: [Color.black.opacity(0.8), Color.clear],
                        startPoint: .bottom,
                        endPoint: .top
                    )
                )
            }
        }
        .frame(width: width, height: height)
    }
}
