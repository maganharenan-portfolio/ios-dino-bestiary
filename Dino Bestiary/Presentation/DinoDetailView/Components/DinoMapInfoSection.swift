struct DinoMapInfoSection: View {
    
    let title: String
    let place: String
    let coordinates: Coordinates
    let website: String?
    
    var body: some View {
        VStack(alignment: .leading, spacing: 4) {
            Text(title)
                .font(.headline)

            if let website = website, let locationURL = URL(string: website) {
                Link(destination: locationURL) {
                    HStack {
                        Image(systemName: IconResources.websiteIcon.rawValue)
                            .imageScale(.small)
                        
                        Text(place)
                            .font(.subheadline)
                    }
                }
            } else {
                Text(place)
                    .font(.subheadline)
                    .foregroundStyle(.secondary)
            }
            
            LocationMap(coordinate: coordinates)
                .padding(.vertical, 8)

            Text(StringResources.coordinatesLabel.localized(with:
                coordinates.latitude,
                coordinates.longitude)
            )
            .font(.caption)
            .foregroundColor(.secondary.opacity(0.6))
        }
    }
    
}
