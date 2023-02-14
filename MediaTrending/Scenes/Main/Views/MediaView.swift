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
            ZStack(alignment: .topTrailing) {
                ZStack(alignment: .bottomLeading) {
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
                    
                    HStack(spacing: 0) {
                        VStack {
                            Text("평점")
                                .font(.system(size: 13, weight: .regular))
                                .lineLimit(1)
                                .padding(3)
                        }
                        .frame(minWidth: 0, maxWidth: .infinity)
                        .background(Color.yellow)
                        
                        VStack {
                            Text("\(String(format: "%.1f", movie.voteAverage))")
                                .font(.system(size: 13, weight: .regular))
                                .lineLimit(1)
                                .padding(3)
                        }
                        .frame(minWidth: 0, maxWidth: .infinity)
                        
                    }
                    .frame(width: 70, height: .infinity, alignment: .center)
                    .background(Color.white)
                    .padding(8)
                }
                
                Button(action: {
                    print("Round Action")
                }) {
                    Image(systemName: "link")
                        .frame(width: 32, height: 32)
                        .foregroundColor(Color.black)
                        .background(Color.white)
                        .clipShape(Circle())
                        .offset(x: -12, y: 12)
                }
            }
            
            VStack(spacing: 0) {
                Text(movie.name)
                    .font(.system(size: 16, weight: .semibold))
                    .lineLimit(1)
                    .padding(3)
                
                Text(casts.map({ $0.name }).joined(separator: ", "))
                    .font(.system(size: 14))
                    .lineLimit(1)
                    .padding(3)
                    .foregroundColor(Color.gray)
                
                Spacer()
                    .frame(height: 8)
                
                Divider()
                    .frame(width: 280, height: 1.2, alignment: .center)
                    .background(Color.black)
                
                Spacer()
                    .frame(height: 4)
                
                HStack(spacing: 0) {
                    Spacer()
                        .frame(width: 10)
                    
                    Text("자세히 보기")
                        .foregroundColor(Color.init(uiColor: .darkGray))
                        .font(.system(size: 13, weight: .medium))
                        .lineLimit(1)
                        .padding(3)
                    
                    Spacer()
                    
                    Image(systemName: "chevron.forward")
                    
                    Spacer()
                        .frame(width: 10)
                }
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
