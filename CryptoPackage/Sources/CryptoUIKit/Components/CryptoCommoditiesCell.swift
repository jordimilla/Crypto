import UIKit

public class CryptoCommoditiesCell : UITableViewCell {
    
    public static let indentifier = "CryptoCommoditiesCell"
    
    private let nameLabel : UILabel = {
        let lbl = UILabel()
        lbl.textColor = .black
        lbl.font = UIFont.boldSystemFont(ofSize: 16)
        lbl.textAlignment = .left
        return lbl
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        addSubview(nameLabel)
        setupContraints()
    }
    
    private func setupContraints() {
        nameLabel.anchor(top: self.topAnchor,
                                left: self.leftAnchor,
                                bottom: self.bottomAnchor,
                                right: self.rightAnchor)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public func bind(name: String) {
        nameLabel.text = name
    }
    
    
}
