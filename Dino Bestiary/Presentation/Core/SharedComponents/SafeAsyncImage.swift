//
//  SafeAsyncImage.swift
//  Dino Bestiary
//
//  Created by Renan Maganha on 26/05/25.
//

import SwiftUI

/// A wrapper around `AsyncImage` that safely loads an image from a URL string.
///
/// This view handles:
/// - Optional or malformed URL strings by showing a fallback image.
/// - Loading state with a `ProgressView`.
/// - Load failure with a placeholder image:
///
/// The image is always displayed with `.aspectRatio(.fit)`
/// and constrained to the specified height via `size`.
///
/// - Parameters:
///   - urlString: The URL of the image to load as a `String`.
///   - size: The height constraint for the loaded or fallback image.
struct SafeAsyncImage: View {
    let urlString: String?
    let size: CGFloat

    var body: some View {
        Group {
            if let urlString = urlString, let url = URL(string: urlString) {
                AsyncImage(url: url) { phase in
                    switch phase {
                    case .empty:
                        ProgressView()
                    case .success(let image):
                        image
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                    case .failure(_):
                        fallbackImage
                    @unknown default:
                        EmptyView()
                    }
                }
            } else {
                fallbackImage
            }
        }
        .frame(height: size)
    }

    private var fallbackImage: some View {
        Image(ImageResources.dinoPlaceholder)
            .resizable()
            .aspectRatio(contentMode: .fit)
            .foregroundColor(.gray)
    }
    
}

#Preview {
    VStack {
        // BROKEN URL
        SafeAsyncImage(
            urlString: "https://upload.wikimedia.org/wikipedia/commons/f/f0/Giganotosaurus_Carmen_Funes.jpg",
            size: 300
        )
        
        // GOOD IMAGE
        SafeAsyncImage(
            urlString: "https://upload.wikimedia.org/wikipedia/commons/9/94/Tyrannosaurus_Rex_Holotype.jpg",
            size: 300
        )
    }
}
