//
//  DetailCellView.swift
//  MediaTrending
//
//  Created by Junhee Yoon on 2023/02/14.
//

import SwiftUI

struct DetailCellView: View {
    
    var imagePath: String?
    var name: String
    var position: String?
    
    var body: some View {
        HStack {
            AsyncImage(url: URL(string: EndPoints.imageUrl + "\(imagePath ?? "")")) { phase in
                if let image = phase.image {
                    image
                        .resizable()
                        .aspectRatio(0.8, contentMode: .fit)
                        .frame(width: 70, height: 120, alignment: .center)
                        .clipped()
                    
                } else {
                    Image(systemName: "star.fill")
                        .frame(width: 70, height: 120)
                }
            }

            VStack(alignment: .leading) {
                Text(name)
                
                Spacer()
                    .frame(height: 6)
                
                HStack {
                    Text(position ?? "")
                        .foregroundColor(Color.gray)
                }
            }
        }
    }
}

struct DetailCellView_Previews: PreviewProvider {
    static var previews: some View {
        DetailCellView(imagePath: Cast.getDummy()[0].profilePath,
                       name: Cast.getDummy()[0].name,
                       position: Cast.getDummy()[0].character)
    }
}
