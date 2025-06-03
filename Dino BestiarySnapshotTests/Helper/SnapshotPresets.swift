//
//  SnapshotPresets.swift
//  Dino Bestiary
//
//  Created by Renan Maganha on 31/05/25.
//

import SnapshotTesting
import SwiftUI

class SnapshotPresets {

    static func all<Value: View>() -> [Snapshotting<Value, UIImage>] {
        return [
            // iPhone Settings
            // Light Mode
            .image(layout: .device(config: .iPhoneSe(.portrait)), traits: .init(userInterfaceStyle: .light)),
            .image(layout: .device(config: .iPhoneSe(.landscape)), traits: .init(userInterfaceStyle: .light)),
            .image(layout: .device(config: .iPhone13(.portrait)), traits: .init(userInterfaceStyle: .light)),
            .image(layout: .device(config: .iPhone13(.landscape)), traits: .init(userInterfaceStyle: .light)),
            .image(layout: .device(config: .iPhone13ProMax(.portrait)), traits: .init(userInterfaceStyle: .light)),
            .image(layout: .device(config: .iPhone13ProMax(.landscape)), traits: .init(userInterfaceStyle: .light)),
            
            // Dark Mode
            .image(layout: .device(config: .iPhoneSe(.portrait)), traits: .init(userInterfaceStyle: .dark)),
            .image(layout: .device(config: .iPhoneSe(.landscape)), traits: .init(userInterfaceStyle: .dark)),
            .image(layout: .device(config: .iPhone13(.portrait)), traits: .init(userInterfaceStyle: .dark)),
            .image(layout: .device(config: .iPhone13(.landscape)), traits: .init(userInterfaceStyle: .dark)),
            .image(layout: .device(config: .iPhone13ProMax(.portrait)), traits: .init(userInterfaceStyle: .dark)),
            .image(layout: .device(config: .iPhone13ProMax(.landscape)), traits: .init(userInterfaceStyle: .dark)),
            
            // iPad Settings
            // Light Mode
            .image(layout: .device(config: .iPadMini(.portrait)), traits: .init(userInterfaceStyle: .light)),
            .image(layout: .device(config: .iPadMini(.landscape)), traits: .init(userInterfaceStyle: .light)),
            .image(layout: .device(config: .iPad10_2(.portrait)), traits: .init(userInterfaceStyle: .light)),
            .image(layout: .device(config: .iPad10_2(.landscape)), traits: .init(userInterfaceStyle: .light)),
            .image(layout: .device(config: .iPadPro12_9(.portrait)), traits: .init(userInterfaceStyle: .light)),
            .image(layout: .device(config: .iPadPro12_9(.landscape)), traits: .init(userInterfaceStyle: .light)),

            // Dark Mode
            .image(layout: .device(config: .iPadMini(.portrait)), traits: .init(userInterfaceStyle: .dark)),
            .image(layout: .device(config: .iPadMini(.landscape)), traits: .init(userInterfaceStyle: .dark)),
            .image(layout: .device(config: .iPad10_2(.portrait)), traits: .init(userInterfaceStyle: .dark)),
            .image(layout: .device(config: .iPad10_2(.landscape)), traits: .init(userInterfaceStyle: .dark)),
            .image(layout: .device(config: .iPadPro12_9(.portrait)), traits: .init(userInterfaceStyle: .dark)),
            .image(layout: .device(config: .iPadPro12_9(.landscape)), traits: .init(userInterfaceStyle: .dark)),
        ]
    }
    
}
