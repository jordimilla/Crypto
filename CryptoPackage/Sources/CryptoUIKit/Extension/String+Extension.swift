import Foundation

extension String{
   func convertDoubleToCurrency() -> String {
       let amount1 = Double(self)
       let numberFormatter = NumberFormatter()
       numberFormatter.numberStyle = .currency
       numberFormatter.locale = Locale(identifier: Locale.current.identifier)
       return numberFormatter.string(from: NSNumber(value: amount1!))!
   }
}
