//
//  ErrorView.swift
//  Dino Bestiary
//
//  Created by Renan Maganha on 01/06/25.
//

import SwiftUI

/// A view used to present an error message to the user in a friendly and visually appealing way.
///
/// This view displays a themed image (usually a sad dinosaur) alongside a custom error message,
/// centered within the available space. It uses a consistent background color and layout styling
/// aligned with the rest of the app's visual identity.
///
/// - Parameters:
///   - errorMessage: The message to be displayed, usually describing what went wrong.
struct ErrorView: View {
    
    let errorMessage: String
    
    var body: some View {
        VStack {
            Image(ImageResources.sadDino)
                .resizable()
                .scaledToFit()
                .padding(32)
                .frame(maxWidth: 450)
            
            Text(errorMessage)
                .font(.body)
                .multilineTextAlignment(.center)
                .fontWeight(.semibold)
                .padding()
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(ColorResources.collectionBackground.value)
    }
    
}

#Preview {
    ErrorView(errorMessage: "Nothing to show")
}
