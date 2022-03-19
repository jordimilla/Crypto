import UIKit

public struct Color {
    public var color: UIColor
    
    public init(_ colorName: String) {
        self.color = UIColor(named: colorName)
            ?? UIColor.black
    }
}

public extension Color {
    
    static let background = Color("Background")
    static let backgroundInverted = Color("BackgroundInverted")
    static let text = Color("Text")
    static let line = Color("Line")
    static let backgroundButton = Color("BackgroundButton")
}
