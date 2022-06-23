//
//  ProfileImageView.swift
//  FootballPlayerStatsIOS16CD
//
//  Created by Michael Potts on 6/23/22.
//

import SwiftUI

struct ProfileImageView: View {
    var size: CGFloat = 200.0
    var image: UIImage?
    
    var body: some View {
        
        if let image = image {
            Image(uiImage: image)
                .resizable()
                .scaledToFit()
                .clipShape(Circle())
                .frame(width: size, height: size)
                .overlay(Circle().stroke(.primary, lineWidth: 3))
                .shadow(color: .primary.opacity(0.75), radius: 10, x: 0, y: 0)
        } else {
            Image(systemName: "person.fill")
                .font(.system(size: 96))
                .clipShape(Circle())
                .frame(width: size, height: size)
                .overlay(Circle().stroke(.primary, lineWidth: 3))
                .shadow(color: .primary.opacity(0.75), radius: 10, x: 0, y: 0)
        }
    }
}

struct ProfileImageView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ProfileImageView(size: 200.0, image: UIImage(named: "NoahPotts"))
                .previewLayout(.sizeThatFits)
                .padding()
            ProfileImageView(size: 200.0)
                .previewLayout(.sizeThatFits)
                .padding()
        }
    }
}
