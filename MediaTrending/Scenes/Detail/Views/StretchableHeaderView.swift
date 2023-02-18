//
//  StretchableHeaderView.swift
//  MediaTrending
//
//  Created by Junhee Yoon on 2023/02/18.
//

import SwiftUI

struct StretchableHeaderView: View {
    
    var imagePath: String
    var initialHeaderHeight: CGFloat = UIScreen.main.bounds.height * 0.25
    
    private func getScrollOffset(_ geometry: GeometryProxy) -> CGFloat {
        geometry.frame(in: .global).minY
    }
    
    private func getOffsetForHeaderImage(_ geometry: GeometryProxy) -> CGFloat {
        let offset = getScrollOffset(geometry)
        
        if offset > 0 {
            return -offset
        }
        
        return 0
    }
    
    private func getHeightForHeaderImage(_ geometry: GeometryProxy) -> CGFloat {
        let offset = getScrollOffset(geometry)
        let imageHeight = geometry.size.height

        if offset > 0 {
            return imageHeight + offset
        }

        return imageHeight
    }
    
    var body: some View {
        
        GeometryReader { geometry in
            
            AsyncImage(url: URL(string: imagePath)) { phase in
                if let image = phase.image {
                    image
                        .resizable()
                        .scaledToFill()
                        .frame(width: geometry.size.width,
                               height: self.getHeightForHeaderImage(geometry))
                        .clipped()
                        .offset(x: 0, y: self.getOffsetForHeaderImage(geometry))
                    
                } else {
                    Image(systemName: "star.fill")
                }
            }
            
        }
        .frame(height: initialHeaderHeight)
    }
}

struct StretchableHeaderView_Previews: PreviewProvider {
    static var previews: some View {
        StretchableHeaderView(imagePath: "\(EndPoints.imageUrl)/uDgy6hyPd82kOHh6I95FLtLnj6p.jpg")
    }
}
