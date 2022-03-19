import Foundation

public struct CommodityWallet: Equatable {
    
    public let name: String
    public let symbol: String
    public let balance: String
    public let defaultWallet: Bool
    public let deleted: Bool
    
    public init(name: String, symbol: String, balance: String, defaultWallet: Bool, deleted: Bool) {
        self.name = name
        self.symbol = symbol
        self.balance = balance
        self.defaultWallet = defaultWallet
        self.deleted = deleted
    }
}
