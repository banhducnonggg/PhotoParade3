//
//  infoView.swift
//  PhotoParade3
//
//  Created by Nam Anh Vũ on 2024-03-17.
//

import SwiftUI

struct infoView: View {
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
            VStack(alignment: .center, spacing: 20) {
                
                Text("PhotoParade")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .foregroundColor(Color(red: 0.937, green: 0.58, blue: 0.424))
                Spacer(minLength: 20)
                
                Text("App information")
                    .fontWeight(.bold)
                    .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                
                HStack {
                    Text("Application:")
                        .font(.headline)
                        .foregroundColor(Color(red: 0.937, green: 0.58, blue: 0.424))
                    Spacer()
                    Text("PhotoParade")
                }
                
                Text("Credits")
                    .fontWeight(.bold)
                    .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                
                HStack {
                    Text("Developer:")
                        .font(.headline)
                        .foregroundColor(Color(red: 0.937, green: 0.58, blue: 0.424))
                    Spacer()
                    Text("Nam Anh Vu")
                }
                
                HStack {
                    Text("Design:")
                        .font(.headline)
                        .foregroundColor(Color(red: 0.937, green: 0.58, blue: 0.424))
                    Spacer()
                    Text("Nam Anh Vu")
                }
                
                HStack {
                    Text("Version:")
                        .font(.headline)
                        .foregroundColor(Color(red: 0.937, green: 0.58, blue: 0.424))
                    Spacer()
                    Text("1.0")
                }
                
                HStack {
                    Text("Website:")
                        .font(.headline)
                        .foregroundColor(Color(red: 0.937, green: 0.58, blue: 0.424))
                    Spacer()
                    Text("monocromo.app")
                }
                
                HStack {
                    Text("Contact:")
                        .font(.headline)
                        .foregroundColor(Color(red: 0.937, green: 0.58, blue: 0.424))
                    Spacer()
                    Text("anhvn0811@gmail.com")
                }
                
                Spacer()
                
                Button(action: {
                    print("A button was tapped")
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
    infoView()
}
