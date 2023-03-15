
import Foundation

enum Sounds: String, CaseIterable, Codable {
    case acoustic_guitar = "acoustic-guitar.mp3"
    case drumbit = "drumbit.mp3"
    case smooth_guitar = "smooth-guitar.mp3"
    case soft_piano = "soft-piano.mp3"
    case trap_loop = "tra-loop.mp3"
    case trap_loop_1 = "trap-loop-1.mp3"
    case witchy_cackie = "witchy-cackie.mp3"
}

extension String {
    var formatSoundName: String {
        var result = String(describing: self)
            .replacingOccurrences(of: "_", with: " ").capitalized
        
        let periodIndex = result.firstIndex(of: ".")
        
        if let periodIndex = periodIndex {
            result.removeSubrange(periodIndex...)
        }
        
        return result
    }
}
