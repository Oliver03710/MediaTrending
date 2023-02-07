//
//  MediaView.swift
//  MediaTrending
//
//  Created by Junhee Yoon on 2023/02/07.
//

import SwiftUI

struct MediaView: View {
    
    var movie: Movie
    var casts: [Cast]
    
    var body: some View {
        VStack(spacing: 0) {
            AsyncImage(url: URL(string: EndPoints.imageUrl + "\(movie.posterPath)")) { phase in
                if let image = phase.image {
                    image
                        .resizable()
                        .aspectRatio(1, contentMode: .fill)
                        .frame(width: 300, height: 300, alignment: .center)
                        .clipped()
                } else {
                    Image(systemName: "star.fill")
                        .frame(width: 300, height: 300)
                }
            }
            
            VStack(spacing: 0) {
                Text(movie.name)
                    .font(.system(size: 20, weight: .semibold))
                    .lineLimit(1)
                    .padding(3)
                
                Text(casts.map({ $0.name }).joined(separator: ", "))
                    .font(.system(size: 16))
                    .lineLimit(1)
                    .padding(3)
                    .foregroundColor(Color.gray)
            }
            .frame(width: 300, height: 100)
            .background(Color.white)
        }
        .frame(width: 300, height: 400)
        .cornerRadius(12)
        .shadow(radius: 3, y: 3)
    }
}

struct MediaView_Previews: PreviewProvider {
    static var previews: some View {
        MediaView(movie: Movie.getDummy(), casts: Cast.getDummy())
    }
}
