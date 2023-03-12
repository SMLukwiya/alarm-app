
import Foundation

enum Sounds: String, CaseIterable {
    case wake_up = "Go get it"
    case hustle_hard = "Hustling"
    
    func formatSoundName() -> String {
        String(describing: self)
            .replacingOccurrences(of: "_", with: " ").capitalized
    }
}
