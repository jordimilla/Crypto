import UIKit

public class RoundedRectButton: UIButton {

    public var selectedState: Bool = false

    public override func awakeFromNib() {
        super.awakeFromNib()
    }


    public override func layoutSubviews(){
        super.layoutSubviews()
        layer.borderWidth = 1
        layer.borderColor = selectedState ? UIColor.blue.cgColor : UIColor.gray.cgColor
        layer.cornerRadius = frame.height / 2
        backgroundColor = selectedState ? UIColor.blue : UIColor.white
        self.titleLabel?.textColor = selectedState ? UIColor.white : UIColor.black
        self.addTarget(self, action: #selector(onPress), for: .touchUpInside)
    }
    
    public func clear() {
        selectedState = false
        layoutSubviews()
    }

    @objc func onPress() {
        selectedState = true

    }
}
