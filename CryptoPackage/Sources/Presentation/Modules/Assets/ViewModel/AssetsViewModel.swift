import Domain
import Foundation
import Combine

final class AssetsViewModel {
    
    private let getCollectionUseCase: QueryUseCase<NotUseCaseParams, Collection>

    @Observable var collectionObservable: Resource<Collection>? = .none
    
    init(getCollectionUseCase: QueryUseCase<NotUseCaseParams, Collection>){
        
        self.getCollectionUseCase = getCollectionUseCase
    }
    
    public func requestCollection() {
        
        let collection = Collection(cryptoCoin: [CryptoCoin(name: "Bitcoin", icon: "https://bitpanda-assets.s3-eu-west-1.amazonaws.com/static/cryptocoin/btc.svg", symbol: "BTC", price: "8936.50"),
                                                 CryptoCoin(name: "Litecoin", icon: "https://bitpanda-assets.s3-eu-west-1.amazonaws.com/static/cryptocoin/ltc.svg", symbol: "LTC", price: "66.32")],
                                    commodities: [Commodities(name: "Bitcoin Com", icon: "https://bitpanda-assets.s3-eu-west-1.amazonaws.com/static/cryptocoin/btc.svg", symbol: "BTC", price: "8936.50"),
                                                  Commodities(name: "Litecoin Com", icon: "https://bitpanda-assets.s3-eu-west-1.amazonaws.com/static/cryptocoin/ltc.svg", symbol: "LTC", price: "66.32")],
                                    fiats: [Fiat(name: "Euro", icon: "https://bitpanda-assets.s3-eu-west-1.amazonaws.com/static/fiat/eur.svg", symbol: "EUR", hasWallets: true),
                                            Fiat(name: "US Dollar", icon: "https://bitpanda-assets.s3-eu-west-1.amazonaws.com/static/fiat/usd.svg", symbol: "USD", hasWallets: true)])
        
        self.collectionObservable = .success(collection)
        
//        getCollectionUseCase.execute(
//            onSuccess: { [unowned self] collectionList in
//                print(collectionList)
//            },
//            onError: { error in
//                print(error)
//            }
//        )
    }
}
