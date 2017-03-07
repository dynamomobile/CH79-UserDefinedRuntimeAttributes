import UIKit

fileprivate var colorJSON: [String: Any] = {
    guard let url = Bundle.main.url(forResource: "colors", withExtension: "json"),
        let colorJSON = try! JSONSerialization.jsonObject(with: Data(contentsOf: url), options: .allowFragments) as? [String: Any]
        else { return [:] }

    return colorJSON
}()

fileprivate var swatchJSON: [String: Any] = {
    return colorJSON["swatches"] as! [String: Any]
}()

fileprivate var schemeJSON: [String: Any] = {
    return colorJSON["scheme"] as! [String: Any]
}()

fileprivate var colorDictionary: [String: UIColor] = {
    let initialDict: [String: UIColor]  = [
        "whiteColor": .white,
        "blackColor": .black,
        "clearColor": .clear
    ]

    return schemeJSON.reduce(initialDict) { dict, valuePair in
        var newDict = dict
        let color: UIColor

        let colorString = valuePair.value as! String

        if let colorHex = swatchJSON[colorString] as? String {
            color = UIColor(withHexString: colorHex)
        } else if let hex = Int(colorString, radix: 16) {
            color = UIColor(withHexString: colorString)
        } else {
            let rgbValues: [CGFloat] = colorString.components(separatedBy: " ")
                .map { Int($0) ?? 0 }
                .map { CGFloat($0) }
            color = UIColor(red: rgbValues[0]/255, green: rgbValues[1]/255, blue: rgbValues[2]/255, alpha: (rgbValues[safe: 3] ?? 100) / 100)
        }

        newDict[valuePair.key] = color
        return newDict
    }
}()

extension Array {
    subscript(safe index: Int) -> Element? {
        return indices ~= index ? self[index] : .none
    }
}

extension UIColor {
    static func colorFor(name: String) -> UIColor {
        var color = colorDictionary[name]
        if color == nil {
            if let colorHex = swatchJSON[name] as? String {
                color = UIColor(withHexString: colorHex)
            }
        }

        return color ?? UIColor.red
    }

    // MARK: - Hex convenience initializer
    convenience init(withHex hex: Int, alpha: CGFloat = 1.0) {
        self.init(red: CGFloat((hex >> 16) & 0xff) / 255.0,
                  green: CGFloat((hex >> 8) & 0xff) / 255.0,
                  blue: CGFloat(hex & 0xff) / 255.0,
                  alpha: alpha)
    }

    convenience init(withHexString hex: String, alpha: CGFloat = 1.0) {
        self.init(withHex: Int(hex, radix: 16) ?? 0xff0000, alpha: alpha)
    }
}
