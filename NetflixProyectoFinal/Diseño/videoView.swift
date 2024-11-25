//
//  videoView.swift
//  NetflixProyectoFinal
//
//  Created by Alumno on 20/11/24.
//

import SwiftUI
import AVKit

struct videoView: View {
    var body: some View {
        let videoPath = Bundle.main.path(forResource: "video", ofType: "mp4")!
        let videoURL = URL(fileURLWithPath: videoPath)
        
        VideoPlayer(player: AVPlayer(url: videoURL))
            .frame(height: 300)
            .cornerRadius(10)
            .padding()
    }
}

#Preview {
    videoView()
}
