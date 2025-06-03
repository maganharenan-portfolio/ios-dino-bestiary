# ``Dino_Bestiary``

A SwiftUI-based iOS app featuring a visual dinosaur bestiary

@Metadata {
    @DisplayName("Dino Bestiary")
    @TitleHeading("Application")
    @PageKind(sampleCode)
    @SupportedLanguage(swift)
    @Available(iOS, introduced: "16.4")
    @Available(iPadOS, introduced: "16.4")
}

## Overview

Dino Bestiary is a native iOS application crafted with SwiftUI that brings to life a vibrant collection of dinosaurs through custom-designed components and rich visual presentation. Data is locally sourced from JSON files and rendered in dynamic layouts, with support for both list and grid views.

The app embraces MVVM architecture, follows accessibility best practices, and includes localized strings for future internationalization. It is thoroughly tested across the board — including unit tests, UI tests, and snapshot tests — ensuring reliability and visual consistency on all supported devices, orientations, and color schemes.

Whether you’re browsing ancient predators or gentle herbivores, Dino Bestiary delivers a polished and immersive user experience — from launch screen to detail view.

## App Structure
```text
Dino Bestiary/
├── App/
│   └─── DinoBestiaryApp.swift       # App entry point
│
├── Configs/
│   └─┬─ Environment/                # App config, feature flags, environment variables
│     └─── <config>.swift
│
├── Data/
│   ├─┬─ Model/                      # Codable structs for JSON parsing
│   │ └─── <model name>.swift
│   └─┬─ Repository/                 # Concrete data loading (e.g., JSON)
│     └─── <repository class>.swift
│
├── Domain/
│   ├─┬─ Model/                       # Domain logic types (e.g., enums)
│   │ └─── <model name>.swift
│   └─┬─ Repository/                  # Protocols for abstraction
│     └─── <model name>.swift
│
├── Presentation/
│   ├─┬─ Core/                        # Shared UI Elements (e.g., styles, modifiers, components)
│   │ └─┬─ SharedComponents/          # Components shared across the app
│   │   └─── <component name>.swift
│   ├─┬─ <FEATURE NAME>/    
│   │ ├─── Components/                # Components used to compose the main view of the feature
│   │ ├─── <view_model class>.swift  
│   │ └─── <feature_name>View.swift
│   └── Utils/                        # UI Related Extensions, Constants, Adapters, etc
│
└── Utils/                            # Shared Extensions, Constants, Adapters, etc
```




