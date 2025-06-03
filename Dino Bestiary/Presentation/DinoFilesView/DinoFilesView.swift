//
//  DinoListView.swift
//  Dino Bestiary
//
//  Created by Renan Maganha on 26/05/25.
//

import SwiftUI

/// The main entry view for the dinosaur collection screen.
///
/// This view is responsible for:
/// - Loading the list of dinosaurs using the provided `DinoFilesViewModel`.
/// - Displaying a loading indicator while data is being fetched.
/// - Presenting an error view in case something goes wrong.
/// - Showing either a grid or list of dinosaurs, based on the current display mode.
/// - Offering a toggle button in the navigation bar to switch between list and grid.
///
/// The layout leverages a matched geometry namespace to enable smooth transitions
/// between the list/grid views and the detail view.
///
/// - Parameters:
///   - viewModel: The view model responsible for handling the dinosaur data and UI state.
struct DinoFilesView: View {
    
    @StateObject var viewModel: DinoFilesViewModel
    @Namespace private var dinoFileLayout
    
    init(viewModel: DinoFilesViewModel) {
        self._viewModel = StateObject(wrappedValue: viewModel)
    }
    
    var body: some View {
        NavigationView {
            ZStack {
                if viewModel.isLoading {
                    ProgressView()
                } else if let error = viewModel.errorMessage {
                    ErrorView(errorMessage: error)
                } else {
                    switch viewModel.displayType {
                    case .grid: DinoGridView(
                        dinos: viewModel.dinoList,
                        dinoFileLayout: dinoFileLayout
                    ).transition(.opacity)
                    case .list: DinoListView(
                        dinos: viewModel.dinoList,
                        dinoFileLayout: dinoFileLayout
                    ).transition(.opacity)
                    }
                }
            }
            .animation(.easeInOut(duration: 0.3), value: viewModel.displayType)
            .background(ColorResources.collectionBackground.value)
            .task {
                await viewModel.fetchDinos()
            }
            .navigationTitle(StringResources.dinoFilesTitle.localized)
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button(action: {
                        viewModel.toggleDisplayType()
                    }) {
                        Image(systemName: IconResources.getDisplayTypeIcon(
                            type: viewModel.displayType
                        ))
                    }
                    .accessibilityIdentifier(AccessibilityID.toggleDisplayButton)
                }
            }
        }
        .background(ColorResources.collectionBackground.value)
    }
}

#Preview {
    DinoFilesView(
        viewModel: DinoFilesViewModel(
            repository: JSONDinoFileRepository(
                resourceName: FileResources.dinoFiles
            )
        )
    )
}
