//
//  DinoMock.swift
//  Dino Bestiary
//
//  Created by Renan Maganha on 27/05/25.
//

import Foundation
@testable import Dino_Bestiary

extension Dino {
    
    static let mock = Dino(
        id: UUID().uuidString,
        name: "Velociraptor",
        classification: .carnivore,
        size: .medium,
        period: .lateCretaceous,
        aggressiveness: 9,
        description: "Fast, deadly, and always hunting in packs.",
        notableBehaviour: "High-speed ambush and flanking",
        funFact: "Velociraptors likely had feathers, similar to modern birds.",
        discoverySite: DiscoverySite(
            location: "Gobi Desert, Mongolia",
            coordinates: Coordinates(latitude: 44.5, longitude: 103.5)
        ),
        fossilLocation: FossilLocation(
            name: "American Museum of Natural History",
            coordinates: Coordinates(latitude: 40.7813, longitude: -73.9735),
            website: "https://www.amnh.org"
        ),
        imageURL: "https://static.wikia.nocookie.net/jurassicpark/images/b/b8/Velociraptor-info-graphic.png/revision/latest?cb=20150420212958"
    )
    
    static let mockVerbose = Dino(
        id: UUID().uuidString,
        name: "Velociraptorus Maximus Incredibilis of the Desolate Eastern Badlands of Mongolian Antiquity",
        classification: .carnivore,
        size: .medium,
        period: .lateCretaceous,
        aggressiveness: 9,
        description: """
            A cunning, ferocious, intelligent and utterly relentless predator, renowned for its capacity to hunt in coordinated packs using alarmingly complex tactics that would put modern-day military units to shame. Known to ambush prey larger than itself with surgical precision and synchronized movements, emerging from dense foliage while communicating via strategic vocalizations.
            """,
        notableBehaviour: "Delta formation ambush strategy with synchronized lateral movement and feigned retreats designed to disorient and isolate prey targets",
        funFact: "Despite its Hollywood reputation, the real Velociraptor was about the size of a turkey and covered in feathers; paleontologists believe it may have performed ritualistic dances with brightly colored plumage for mating displays or intimidation.",
        discoverySite: DiscoverySite(
            location: "Advanced Paleontological Excavation Zone of the Southern Central Ömnögovi Desert Region, Gobi, Mongolia",
            coordinates: Coordinates(latitude: 44.5, longitude: 103.5)
        ),
        fossilLocation: FossilLocation(
            name: "International Institute for Advanced Fossil Research and Evolutionary Reconstruction, New York Division, Sector 7",
            coordinates: Coordinates(latitude: 40.7813, longitude: -73.9735),
            website: "https://www.amnh.org"
        ),
        imageURL: "https://static.wikia.nocookie.net/jurassicpark/images/b/b8/Velociraptor-info-graphic.png/revision/latest?cb=20150420212958"
    )
    
    static let mockNullOptionals = Dino(
        id: UUID().uuidString,
        name: "Velociraptor",
        classification: .carnivore,
        size: .medium,
        period: .lateCretaceous,
        aggressiveness: 9,
        description: "Fast, deadly, and always hunting in packs.",
        notableBehaviour: nil,
        funFact: nil,
        discoverySite: nil,
        fossilLocation: nil,
        imageURL: nil
    )
    
    static let mockArray: [Dino] = (1...30).map { _ in
        Dino(
            id: UUID().uuidString,
            name: "Velociraptor",
            classification: .carnivore,
            size: .medium,
            period: .lateCretaceous,
            aggressiveness: 9,
            description: "Fast, deadly, and always hunting in packs.",
            notableBehaviour: nil,
            funFact: nil,
            discoverySite: nil,
            fossilLocation: nil,
            imageURL: nil
        )
    }
    
    static let mockArrayVerbose: [Dino] = (1...30).map { _ in
        Dino(
            id: UUID().uuidString,
            name: "Velociraptorus Maximus Incredibilis of the Desolate Eastern Badlands of Mongolian Antiquity",
            classification: .carnivore,
            size: .medium,
            period: .lateCretaceous,
            aggressiveness: 9,
            description: "Fast, deadly, and always hunting in packs.",
            notableBehaviour: nil,
            funFact: nil,
            discoverySite: nil,
            fossilLocation: nil,
            imageURL: nil
        )
    }
    
}
