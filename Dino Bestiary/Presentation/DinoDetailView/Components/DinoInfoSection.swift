struct DinoInfoSection: View {
    
    let title: String
    let text:  String
    
    var body: some View {
        VStack(alignment: .leading, spacing: 4) {
            Text(title)
                .font(.headline)
            
            Text(text)
                .font(.subheadline)
                .foregroundStyle(.secondary)
            
            Divider()
                .padding(.top, 12)
        }
    }
    
}