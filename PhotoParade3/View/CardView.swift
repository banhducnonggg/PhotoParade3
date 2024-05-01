//
//  CardView.swift
//  photoParade3
//
//  Created by Nam Anh Vũ on 2024-03-11.
//

import SwiftUI

struct CardView: View {
    @Binding var showGuideView: Bool
    @Binding var showInfoView: Bool
    
    let id = UUID()
    var oldPics: Destination
    
    var body: some View {
        VStack(alignment: .center, spacing: 20) {
            HStack(alignment: .center, spacing: 20) {
                Spacer(minLength: 20)
                
                Button(action: {
                    //                print("Toggled")
                    self.showGuideView.toggle()
                }) {
                    Image(systemName: "questionmark.circle")
                        .font(.system(size: 25, weight: .semibold))
                        .foregroundColor(.gray)
                }
                .accentColor(/*@START_MENU_TOKEN@*/.blue/*@END_MENU_TOKEN@*/)
                .sheet(isPresented: $showGuideView) {
                    GuideView()
                }
                
                VStack(alignment: .center, spacing: 10) {
                    Text(oldPics.name)
                        .foregroundColor(.black)
                        .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                        .font(.largeTitle)
                        .frame(width: 200, height: 20, alignment: .center)
                    //                .padding(.horizontal, -180)
                    //                .padding(.vertical, -72)
                        .padding()
                    
                    Text(oldPics.date)
                        .foregroundColor(.gray)
                        .fontWeight(.bold)
                        .font(.headline)
                        .frame(width: 150, height: 20, alignment: .center)
                }
                
                Button(action: {
                    self.showInfoView.toggle()
                }) {
                    Image(systemName: "person")
                        .font(.system(size: 25, weight: .semibold))
                        .foregroundColor(.gray)
                }
                .accentColor(/*@START_MENU_TOKEN@*/.blue/*@END_MENU_TOKEN@*/)
                .sheet(isPresented: $showInfoView) {
                    infoView()
                }
                
                Spacer(minLength: 20)
            }
            oldPics.img
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 369, height: 500, alignment: .center)
                .cornerRadius(25)
                .clipped()
        }
        .background(Rectangle().fill(.white))
    }
}

struct CardView_Preview: PreviewProvider {
    @State static var showGuide: Bool = false
    @State static var showInfo: Bool = false
    
    static var previews: some View {
        CardView(showGuideView: $showGuide, showInfoView: $showInfo, oldPics: photoParadeData[3])
    }
}
