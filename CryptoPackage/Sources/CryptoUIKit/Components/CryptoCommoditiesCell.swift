import UIKit

public class CryptoCommoditiesCell : UITableViewCell {
    
    public static let indentifier = "CryptoCommoditiesCell"
    
    
    private let iconImage: UIImageView = {
        let img = UIImageView()
        img.contentMode = .scaleAspectFit
        img.image = UIImage(named: "noImage")
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
        lbl.font = UIFont.boldSystemFont(ofSize: 16)
        lbl.textAlignment = .left
        return lbl
    }()
    
    private let symbolLabel: UILabel = {
        let lbl = UILabel()
        lbl.textColor = Color.text.color
        lbl.font = UIFont.boldSystemFont(ofSize: 16)
        lbl.textAlignment = .left
        return lbl
    }()
    
    private let priceLabel: UILabel = {
        let lbl = UILabel()
        lbl.textColor = Color.text.color
        lbl.font = UIFont.boldSystemFont(ofSize: 16)
        lbl.textAlignment = .left
        return lbl
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        addSubview(iconImage)
        addSubview(stackViewVertical)
        stackViewVertical.addArrangedSubview(nameLabel)
        stackViewVertical.addArrangedSubview(symbolLabel)
        stackViewVertical.addArrangedSubview(priceLabel)

        setupContraints()
    }
    
    private func setupContraints() {
        iconImage.anchor(top: self.topAnchor,
                         left: self.leftAnchor,
                         topConstant: 16,
                         leftConstant: 16,
                         widthConstant: 50,
                         heightConstant: 50)
        
        stackViewVertical.anchor(top: iconImage.topAnchor,
                                 left: iconImage.rightAnchor,
                                 right: self.rightAnchor,
                                 leftConstant: 24)
        
      
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public func bind(name: String?, icon: String?, symbol: String?, price: String?) {
        nameLabel.text = name
//        iconImage.image = UIImage(named: icon ?? "noImage")
        symbolLabel.text = symbol
        priceLabel.text = price
    }
    
    
}
