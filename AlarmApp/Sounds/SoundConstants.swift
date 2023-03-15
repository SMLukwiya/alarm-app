
import Foundation

enum Sounds: String, CaseIterable, Codable {
case acoustic_guitar = "acoustic-guitar-1.mp3"
case drumbit = "drumbit-1.mp3"
case smooth_guitar = "smooth-guitar-1.mp3"
case soft_piano = "soft-piano.mp3"
case trap_loop = "tra-loop.mp3"
case trap_loop_1 = "trap-loop-2.mp3"
case witchy_cackie = "witchy-cackie.mp3"
    
    func formatSoundName() -> String {
        String(describing: self)
            .replacingOccurrences(of: "_", with: " ").capitalized
    }
}

