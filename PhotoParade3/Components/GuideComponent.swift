//
//  GuideComponent.swift
//  PhotoParade3
//
//  Created by Nam Anh Vũ on 2024-03-17.
//

import SwiftUI

struct GuideComponent: View {
    var title: String
    var subtitle: String
    var description: String
    var icon: String
    
    var body: some View {
        HStack(alignment: .center, spacing: 10) {
            VStack(alignment: .leading, spacing: 5) {
                HStack {
                    Image(systemName: icon)
                        .font(.largeTitle)
                        .foregroundColor(Color(red: 0.937, green: 0.58, blue: 0.424))
                    
                    Text(title.uppercased())
                        .foregroundColor(.black)
                        .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                        .font(.title)
                }
                
                Text(subtitle.uppercased())
                    .font(.subheadline)
                    .fontWeight(.heavy)
                    .foregroundColor(Color(red: 0.51, green: 0.424, blue: 0.498))
                
                Text(description)
                    .font(.footnote)
                    .foregroundColor(.gray)
                    .fixedSize(horizontal: false, vertical: /*@START_MENU_TOKEN@*/true/*@END_MENU_TOKEN@*/)
            }
        }
    }
}

#Preview {
    GuideComponent(
        title: "How to use the app?",
        subtitle: "Swipe or touch buttons!",
        description: "Swipe left or use dislike button to remove image,\nswipe right or use like button to keep it,\nswipe up or use share button to share that image!",
        icon: "questionmark.circle"
    )
        .previewLayout(.sizeThatFits)
}
