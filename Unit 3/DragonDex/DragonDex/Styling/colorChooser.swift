import SwiftUI
import Observation

@Observable
class ColorChooser {
    var backgroundColor: Color = .black
    var capsuleColor: Color = .gray
    var textColor: Color = .white
    var shadowColor: Color = .black

    init(backgroundColor: Color = .black) {
        self.backgroundColor = backgroundColor
        findColors()
    }

    func findColors() {
        let uiColor = UIColor(backgroundColor)

        var hue: CGFloat = 0
        var saturation: CGFloat = 0
        var brightness: CGFloat = 0
        var alpha: CGFloat = 0

        guard uiColor.getHue(&hue, saturation: &saturation, brightness: &brightness, alpha: &alpha) else {
            capsuleColor = .gray
            textColor = .white
            shadowColor = .black
            return
        }

        capsuleColor = Color(hue: hue, saturation: min(saturation + 0.2, 1.0), brightness: min(brightness + 0.2, 1.0))
        textColor = brightness < 0.5 ? .white : .black
        shadowColor = Color(hue: hue, saturation: saturation, brightness: max(brightness - 0.3, 0.0))
    }
}
