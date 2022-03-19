import UIKit
import Kingfisher

public class WalletCell : UITableViewCell {
    
    public static let indentifier = "WalletCell"
    
    private let iconImage: UIImageView = {
        let img = UIImageView()
        img.image = UIImage(named: "noImage")
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
    
    private let balanceLabel: UILabel = {
        let lbl = UILabel()
        lbl.textColor = Color.text.color
        lbl.font = UIFont.preferredFont(forTextStyle: .body)
        lbl.textAlignment = .left
        return lbl
    }()
    
    private let defaultLabel: PaddingLabel = {
        let lbl = PaddingLabel()
        lbl.layer.cornerRadius = 8
        lbl.layer.masksToBounds = true
        lbl.textColor = Color.text.color
        lbl.backgroundColor = Color.backgroundButton.color
        lbl.font = UIFont.preferredFont(forTextStyle: .footnote)
        lbl.textAlignment = .right
        lbl.text = "Default Wallet"
        return lbl
    }()
    
    private let deleteLabel: PaddingLabel = {
        let lbl = PaddingLabel()
        lbl.layer.cornerRadius = 8
        lbl.layer.masksToBounds = true
        lbl.textColor = Color.text.color
        lbl.backgroundColor = Color.deleted.color
        lbl.font = UIFont.preferredFont(forTextStyle: .footnote)
        lbl.textAlignment = .right
        lbl.text = "Deleted Wallet"
        return lbl
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        addSubview(iconImage)
        addSubview(stackViewVertical)
        stackViewVertical.addArrangedSubview(nameLabel)
        stackViewVertical.addArrangedSubview(symbolLabel)
        stackViewVertical.addArrangedSubview(balanceLabel)
        addSubview(defaultLabel)
        addSubview(deleteLabel)
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
        
        defaultLabel.anchor(top: self.topAnchor,
                            right: self.rightAnchor,
                            topConstant: 16,
                            rightConstant: 16)
        
        deleteLabel.anchor(top: defaultLabel.bottomAnchor,
                           right: self.rightAnchor,
                           topConstant: 16,
                           rightConstant: 16)
      
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public func bind(name: String?, symbol: String?, balance: String? = nil, defaultWallet: Bool? = false, deleted: Bool? = false) {
        nameLabel.text = name
        symbolLabel.text = symbol
        balanceLabel.text = balance?.convertDoubleToCurrency()
        defaultLabel.isHidden = !(defaultWallet ?? false)
        deleteLabel.isHidden = !(deleted ?? false)
    }
}
