
import Foundation
import AVFoundation

var audioPlayer: AVAudioPlayer? = AVAudioPlayer()

func playSound(sound: String, typeExt: String = "", volume: Float = 1.0) {
    if let path = Bundle.main.path(forResource: sound, ofType: typeExt) {
        do {
            audioPlayer = try AVAudioPlayer(contentsOf: URL(fileURLWithPath: path))
            
            // set volume
            audioPlayer?.setVolume(volume, fadeDuration: 0.2)
            
            // play sound
            audioPlayer?.play()
        } catch {
            print("AUDIO ERROR")
        }
    }
}

func stopSound() {
    audioPlayer?.stop() 
}
