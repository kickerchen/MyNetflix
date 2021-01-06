//
//  WhiteButton.swift
//  NetflixClone
//
//  Created by CHENCHIAN on 2021/1/6.
//

import SwiftUI

struct WhiteButton: View {
    var text: String
    var imageName: String
    var backgroundColor: Color = Color.white
    
    var action: () -> Void
    
    var body: some View {
        Button(action: action, label: {
            HStack {
                Spacer()
                Image(systemName: imageName)
                    .font(.headline)
                
                Text(text)
                    .bold()
                    .font(.system(size: 16))
                Spacer()
            }
        })
        .padding(.vertical, 6)
        .foregroundColor(backgroundColor == .white ? .black : .white)
        .background(backgroundColor)
        .cornerRadius(3.0)
    }
}

struct WhiteButton_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            Color.black
                .edgesIgnoringSafeArea(.all)

            WhiteButton(text: "Play", imageName: "play.fill") {
                //
            }
        }
    }
}
