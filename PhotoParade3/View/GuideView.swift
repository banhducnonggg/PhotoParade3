//
//  GuideView.swift
//  PhotoParade3
//
//  Created by Nam Anh Vũ on 2024-03-17.
//

import SwiftUI

struct GuideView: View {
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
            VStack(alignment: .center, spacing: 20) {
                Text("Get started!")
                    .fontWeight(.black)
                    .font(.largeTitle)
                    .foregroundColor(Color(red: 0.937, green: 0.58, blue: 0.424))
                
                Text("Re-discover your photos randomly\nand free up some space!")
                    .lineLimit(nil)
                    .multilineTextAlignment(.center)
                
                Spacer(minLength: 20)
                
                VStack(alignment: .leading, spacing: 25) {
                    GuideComponent(title: "Save", subtitle: "Want to keep this?", description: "Hit the like button", icon: "hand.thumbsup.fill")
                    
                    GuideComponent(title: "Delete", subtitle: "Want to remove this?", description: "Hit the dislike button", icon: "hand.thumbsdown.fill")
                    
                    GuideComponent(title: "Share", subtitle: "Want to share this with friends?", description: "Hit the share button", icon: "square.and.arrow.up.fill")
                }
                
                Spacer()
                
                Button(action: {
                    //print("A button was tapped")
                    self.presentationMode.wrappedValue.dismiss()
                }) {
                    Text("Close".uppercased())
                        .font(.headline)
                        .padding()
                        .frame(minWidth: 0, maxWidth: .infinity)
                        .background(Capsule().fill(Color(red: 0.937, green: 0.58, blue: 0.424)))
                        .foregroundColor(.white)
                }
            }
            .frame(minWidth: 0, maxWidth: .infinity)
            .padding(.top, 15)
            .padding(.bottom, 25)
            .padding(.horizontal, 25)
    }
}

#Preview {
    GuideView()
}
