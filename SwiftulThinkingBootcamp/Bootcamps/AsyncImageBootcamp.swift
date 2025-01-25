//
//  AsyncImageBootcamp.swift
//  SwiftulThinkingBootcamp
//
//  Created by Arun Kumar on 21/01/25.
//

/** Quick Notes
 1. AsyncImage don't resize based on frame, it will resize according to the Image dimensions. But it will effects the placeholder size.
 2. If you want to resize the image use `.resizable()` modifier on image and then apply frame either on `AsyncImage` or content `image` parameter.
 3. You can also add transition when Async image is chaning its state for ex:- placeholder to actual image.
 */

import SwiftUI

struct AsyncImageBootcamp: View {
    
    private let url = URL(string: "https://picsum.photos/400")
    
    var body: some View {
        asyncImage3
    }
    
    /// 1.
    private var aysncImage: some View {
        AsyncImage(url: url)
            .frame(width: 100, height: 100)
    }
    
    /// 2
    private var asyncImage2: some View {
        AsyncImage(url: url, content: { image in
            image.resizable()
        }, placeholder: {
            ProgressView()
        })
        .frame(width: 100, height: 100)
    }
    
    /// 3
    private var asyncImage3: some View {
        AsyncImage(url: url, transaction: .init(animation: .linear)) { phase in
            if let image = phase.image {
                image.resizable()
                    .scaledToFill()
            }
            else if phase.error != nil {
                Image(systemName: "photo.artframe")
                    .resizable()
                    .scaledToFill()
            }
            else {
                Image(systemName: "photo.fill")
                    .resizable()
                    .scaledToFill()
            }
        }
        .frame(width: 100, height: 100)
    }
}

#Preview {
    AsyncImageBootcamp()
}
