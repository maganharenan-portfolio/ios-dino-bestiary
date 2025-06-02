struct DinoListView: View {
    
    @StateObject var viewModel: DinoListViewModel
    
    init(viewModel: DinoListViewModel) {
        self._viewModel = StateObject(wrappedValue: viewModel)
    }
    
    var body: some View {
        NavigationView {
            List {
                ForEach(viewModel.dinoList) { dino in
                    NavigationLink {
                        DinoDetailView(dino: dino)
                    } label: {
                        DinoListCell(dino: dino)
                    }
                }
            }
            .task {
                await viewModel.fetchDinos()
            }
            .navigationTitle(StringResources.dinoFilesTitle.localized)
        }
    }
    
}