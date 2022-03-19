import UIKit
import CryptoKit

public class RoundedRectButton: UIButton {

    public var selectedState: Bool = false

    public override func awakeFromNib() {
        super.awakeFromNib()
    }


    public override func layoutSubviews(){
        super.layoutSubviews()
        layer.borderWidth = 1
        layer.borderColor = selectedState ? Color.backgroundButton.color.cgColor : Color.line.color.cgColor
        layer.cornerRadius = frame.height / 2
        backgroundColor = selectedState ? Color.backgroundButton.color : Color.background.color
        self.titleLabel?.textColor = selectedState ? Color.text.color : Color.text.color
        self.addTarget(self, action: #selector(onPress), for: .touchUpInside)
    }
    
    public func activateButton(state: Bool) {
        selectedState = state
        layoutSubviews()
    }

    @objc func onPress() {
        selectedState = true
    }
}
