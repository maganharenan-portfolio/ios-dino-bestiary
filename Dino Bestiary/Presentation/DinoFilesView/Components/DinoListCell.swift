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