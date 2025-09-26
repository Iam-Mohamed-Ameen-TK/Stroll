//
//  AvatarView.swift
//  Stroll
//
//  Created by Mohamed Ameen on 26/09/25.
//

import SwiftUI
import UIKit

struct AvatarView: View {
    let imageName: String?
    let size: CGFloat
    
    var body: some View {
        Group {
            if let name = imageName, let uiImage = UIImage(named: name) {
                Image(uiImage: uiImage)
                    .resizable()
            } else {
                Image(systemName: "person.crop.circle.fill")
                    .resizable()
                    .renderingMode(.template)
                    .foregroundColor(.gray)
            }
        }
        .scaledToFill()
        .frame(width: size, height: size)
        .clipShape(Circle())
        .overlay(Circle().stroke(Color.white.opacity(0.12), lineWidth: 2))
        .shadow(radius: 2)
    }
}

struct AvatarView_Previews: PreviewProvider {
    static var previews: some View {
        HStack(spacing: 20) {
            AvatarView(imageName: nil, size: 64)              // fallback
            AvatarView(imageName: "avatar1", size: 64)        // placeholder (falls back if missing)
            AvatarView(imageName: "avatar2", size: 64)
        }
        .padding()
        .previewLayout(.sizeThatFits)
        .preferredColorScheme(.dark)
    }
}
