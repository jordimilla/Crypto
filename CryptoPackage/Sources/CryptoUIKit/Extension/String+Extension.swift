import Foundation

extension String{
   func convertDoubleToCurrency() -> String {
       guard let amount = Double(self) else {
           return ""
       }
       let numberFormatter = NumberFormatter()
       numberFormatter.numberStyle = .currency
       numberFormatter.locale = Locale(identifier: Locale.current.identifier)
       return numberFormatter.string(from: NSNumber(value: amount)) ?? ""
   }
}
