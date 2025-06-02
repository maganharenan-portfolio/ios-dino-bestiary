//
//  DinoListView.swift
//  Dino Bestiary
//
//  Created by Renan Maganha on 26/05/25.
//

import SwiftUI

struct DinoFilesView: View {
    
    @StateObject var viewModel: DinoListViewModel
    
    init(viewModel: DinoListViewModel) {
        self._viewModel = StateObject(wrappedValue: viewModel)
    }
    
    var body: some View {
        NavigationView {
            Group {
                DinoListView(dinos: viewModel.dinoList)
            }
            .task {
                await viewModel.fetchDinos()
            }
            .navigationTitle(StringResources.dinoFilesTitle.localized)
        }
    }
    
}

struct DinoListCell: View {
    
    var dino: Dino
    
    var body: some View {
        HStack {
            SafeAsyncImage(urlString: dino.imageURL, size: 60)
                .frame(width: 80)
            
            VStack(alignment: .leading, spacing: 8) {
                Text(dino.name)
                    .font(.title3.bold())
                
                Text(dino.classificationAndPeriodText)
                    .font(.caption)
                    .foregroundStyle(.secondary)
                
                AggressivenessRate(rate: dino.aggressiveness)
            }
            .padding(.leading)
        }
        .padding(.horizontal)
        .frame(maxWidth: .infinity, alignment: .leading)
    }
    
}

#Preview {
    DinoFilesView(
        viewModel: DinoListViewModel(
            repository: JSONDinoFileRepository(resourceName: "dino-files")
        )
    )
}
