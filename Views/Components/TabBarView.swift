//
//  TabBarView.swift
//  Stroll
//
//  Created by Mohamed Ameen on 26/09/25.
//

import SwiftUI

struct TabBarView: View {
    var body: some View {
        HStack {
            Spacer()
            tabItem(imageName: "Tabbar1")
            Spacer()
            tabItem(imageName: "Tabbar2")
            Spacer()
            tabItem(imageName: "Tabbar3")
            Spacer()
            tabItem(imageName: "Tabbar4")
            Spacer()
        }
        .padding(.top, 15)
        .padding(.bottom, 25)
        .frame(height: 80)
        .background(Color(UIColor.systemBackground).opacity(0.06))
    }
    
    @ViewBuilder
    private func tabItem(imageName: String) -> some View {
        Image(imageName)
            .resizable()
            .scaledToFit()
            .frame(width: 52, height: 52)
    }
}

struct TabBarView_Previews: PreviewProvider {
    static var previews: some View {
        TabBarView()
            .previewLayout(.sizeThatFits)
            .preferredColorScheme(.dark)
            .padding()
    }
}
