//
//  AnimeDetailsView.swift
//  AnimeDetailsFeature
//
//  Created by Oks on 21/9/2026.
//

import SwiftUI

public struct AnimeDetailsView: View {
    
    // TODO get from ViewModel
    private let animeDetails: AnimeDetails
    
    public init(id: Int) {
        self.animeDetails = AnimeDetails(
            id: id,
            title: "Title for Anime \(id)",
            description: "Description for Anime \(id)",
        )
    }
    
    public var body: some View {
        VStack(alignment: .leading) {
            Text("ID: \(animeDetails.id)")
                .font(.headline)
            
            Text(animeDetails.description)
                .font(.body)
        }
        .padding()
        .navigationTitle(animeDetails.title)
        .frame(
            maxWidth: .infinity,
            maxHeight: .infinity,
            alignment: .topLeading
        )
    }
}

#Preview {
    AnimeDetailsView(
        id: 1,
    )
}
