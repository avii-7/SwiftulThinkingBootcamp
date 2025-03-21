//
//  SoundBootcamp.swift
//  SwiftulThinkingBootcamp
//
//  Created by Arun on 21/03/25.
//

import SwiftUI
import AVKit

final class SoundManager {
    
    private init() { }
    
    static let shared = SoundManager()
    
    var player: AVAudioPlayer?
    
    func playSound1() {
        
        guard let url = Bundle.main.url(forResource: "sound1", withExtension: "mp3") else { return }
        
        do {
            self.player = try AVAudioPlayer(contentsOf: url)
            self.player?.play()
        }
        catch {
            print("Error while playing sound \(error.localizedDescription)")
        }
    }
    
    func playSound2() {
        
        guard let url = Bundle.main.url(forResource: "sound2", withExtension: "mp3") else { return }
        
        do {
            self.player = try AVAudioPlayer(contentsOf: url)
            self.player?.play()
        }
        catch {
            print("Error while playing sound \(error.localizedDescription)")
        }
    }
}

struct SoundBootcamp: View {
    
    private let soundManager = SoundManager.shared
    
    var body: some View {
        VStack(spacing: 20) {
            Button("Play Sound 1") {
                soundManager.playSound1()
            }
            
            Button("Play Sound 2") {
                soundManager.playSound2()
            }
        }
    }
}

#Preview {
    SoundBootcamp()
}
