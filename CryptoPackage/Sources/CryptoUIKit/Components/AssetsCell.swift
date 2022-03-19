import UIKit
import Kingfisher

public class AssetsCell : UITableViewCell {
    
    public static let indentifier = "AssetsCell"
    
    private let iconImage: UIImageView = {
        let img = UIImageView()
        img.contentMode = .scaleAspectFit
        return img
    }()
    
    private let stackViewVertical: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.alignment = .fill
        stack.spacing = 8
        return stack
    }()
    
    private let nameLabel: UILabel = {
        let lbl = UILabel()
        lbl.textColor = Color.text.color
        lbl.font = UIFont.preferredFont(forTextStyle: .body)
        lbl.textAlignment = .left
        return lbl
    }()
    
    private let symbolLabel: UILabel = {
        let lbl = UILabel()
        lbl.textColor = Color.text.color
        lbl.font = UIFont.preferredFont(forTextStyle: .body)
        lbl.textAlignment = .left
        return lbl
    }()
    
    private let priceLabel: UILabel = {
        let lbl = UILabel()
        lbl.textColor = Color.text.color
        lbl.font = UIFont.preferredFont(forTextStyle: .body)
        lbl.textAlignment = .left
        return lbl
    }()
    
    private let hasWalletLabel: PaddingLabel = {
        let lbl = PaddingLabel()
        lbl.layer.cornerRadius = 8
        lbl.layer.masksToBounds = true
        lbl.textColor = Color.text.color
        lbl.backgroundColor = Color.backgroundButton.color
        lbl.font = UIFont.preferredFont(forTextStyle: .footnote)
        lbl.textAlignment = .right
        lbl.text = "Has Wallet"
        return lbl
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        addSubview(iconImage)
        addSubview(stackViewVertical)
        stackViewVertical.addArrangedSubview(nameLabel)
        stackViewVertical.addArrangedSubview(symbolLabel)
        stackViewVertical.addArrangedSubview(priceLabel)
        addSubview(hasWalletLabel)
        setupContraints()
    }
    
    private func setupContraints() {
        iconImage.anchor(left: self.leftAnchor,
                         leftConstant: 16,
                         widthConstant: 50,
                         heightConstant: 50)
        
        iconImage.anchorCenterYToSuperview()
        
        stackViewVertical.anchor(left: iconImage.rightAnchor,
                                 right: self.rightAnchor,
                                 leftConstant: 24)
        
        stackViewVertical.anchorCenterYToSuperview()
        
        hasWalletLabel.anchor(right: self.rightAnchor,
                         rightConstant: 16)
        hasWalletLabel.anchorCenterYToSuperview()
      
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public func bind(name: String?, icon: String?, symbol: String?, price: String? = nil, hasWallet: Bool? = false) {
        nameLabel.text = name
        loadSVG(icon: icon)
        symbolLabel.text = symbol
        priceLabel.text = price?.convertDoubleToCurrency()
        hasWalletLabel.isHidden = !(hasWallet ?? false)
        
    }
    
    private func loadSVG(icon: String?) {
        guard let url = icon else { return }
        let svgUrl = URL(string: url)
        let processor = SVGProcessor(size: CGSize(width: 50, height: 50))
        iconImage.kf.setImage(with: svgUrl, options: [.processor(processor)])
    }
}
