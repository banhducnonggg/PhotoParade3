//
//  CardNav.swift
//  photoParade
//
//  Created by Nam Anh Vũ on 2024-03-12.
//

import SwiftUI

struct CardNav: View {
    var onLike: () -> Void
    var onDislike: () -> Void
    var onShare: () -> Void
    
    var body: some View {
        
        
        HStack {
            Spacer()
            
            Button(action: onDislike) {
                Image(systemName: "hand.thumbsdown.fill")
                    .font(.system(size: 30, weight: .bold))
                    .foregroundColor(Color(red: 0.51, green: 0.424, blue: 0.498))
            }
                
            Spacer()
            
            Button(action: onShare) {
                Image(systemName: "square.and.arrow.up.fill")
                    .font(.system(size: 30, weight: .bold))
                    .foregroundColor(Color(red: 0.235, green: 0.533, blue: 0.494))
            }
            
            Spacer()
            
            Button(action: onLike) {
                Image(systemName: "hand.thumbsup.fill")
                    .font(.system(size: 30, weight: .bold))
                    .foregroundColor(Color(red: 0.937, green: 0.58, blue: 0.424))
            }
            
            Spacer()
        }
    }
}

struct CardNav_Previews: PreviewProvider {
    static var previews: some View {
        CardNav(onLike: {}, onDislike: {}, onShare: {})
            .previewLayout(.fixed(width: 375, height: 20))
    }
}


//#Preview {
//    CardNav(onLike: <#() -> Void#>, onDislike: <#() -> Void#>)
//        .previewLayout(.fixed(width: 375, height: 20))
//}
