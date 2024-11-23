//
//  videoView.swift
//  NetflixProyectoFinal
//
//  Created by Alumno on 20/11/24.
//

import SwiftUI
import AVKit

struct videoView: View {
    
    let videourl: String
    
    var body: some View {
        let url = GetVideoUrl()
        
        VideoPlayer(player: AVPlayer(url: url))
                    
    }
    
    private func GetVideoUrl() -> URL {
            guard let videoPath = Bundle.main.path(forResource: videourl, ofType: "mp4") else {
                fatalError("Video file not found.")
            }
            return URL(fileURLWithPath: videoPath)
        }
}

#Preview {
    videoView(videourl: moviesDos.videoUrl)
}
