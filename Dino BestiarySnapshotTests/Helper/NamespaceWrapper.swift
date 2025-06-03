//
//  NamespaceWrapper.swift
//  Dino BestiarySnapshotTests
//
//  Created by Renan Maganha on 28/05/25.
//

import SwiftUI

struct NamespaceWrapper<Content: View>: View {
    
    @Namespace private var namespace
    let content: (Namespace.ID) -> Content

    init(@ViewBuilder content: @escaping (Namespace.ID) -> Content) {
        self.content = content
    }

    var body: some View {
        ZStack {
            content(namespace)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(ColorResources.collectionBackground.value)
    }
    
}
