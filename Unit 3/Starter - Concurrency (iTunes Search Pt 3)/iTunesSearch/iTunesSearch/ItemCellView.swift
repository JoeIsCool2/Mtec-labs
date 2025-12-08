//
//  ItemCellView.swift
//  iTunesSearch
//
//  Created by Jane Madsen on 11/3/25.
//

import SwiftUI
import AVFoundation

struct ItemCellView: View {
    let name: String
    let artist: String
    @State var player: AVPlayer?
    @State var isPlaying = false

    let item: SearchResult

    var body: some View {
        HStack {
            if let image = item.artworkUrl100 {
                AsyncImage(url: URL(string: image)) { image in
                           image
                               .resizable()
                       } placeholder: {
                           ProgressView() 
                       }
                       .frame(width: 75, height: 75)
            }
            VStack(alignment: .leading) {
                Text(name)
                    .font(.headline)
                Text(artist)
                    .font(.subheadline)
                    .foregroundColor(.secondary)
            }
            Spacer()
            if let previewUrl = item.previewUrl {
                Button {
                    guard let url = URL(string: previewUrl) else {
                        // Handle invalid URL
                        print("Invalid URL")
                        return
                    }
                    let playerItem = AVPlayerItem(url: url)
                    player = AVPlayer(playerItem: playerItem)
                    if isPlaying {
                        player?.pause()
                        isPlaying = false
                    } else {
                        player?.play()
                        isPlaying = true
                    }


                } label: {
                    if isPlaying {
                        Image(systemName: "pause.circle")
                    } else {
                        Image(systemName: "play.circle")
                    }
                }
            }
        }
        .padding(.vertical, 8)
    }
}
