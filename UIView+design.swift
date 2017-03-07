import UIKit

// These are the UIView extensions that work as recipients for 'User Defined Runtime Attributes'
// Here is just a small sample of UIView subclasses and usages. Be creative and add you own! :)
private extension UIView {

    //      _______  _      __        _
    //     /  _/ _ )(_) ___/ /__ ___ (_)__ ____
    //    _/ // _  |   / _  / -_|_-</ / _ `/ _ \
    //   /___/____(_)  \_,_/\__/___/_/\_, /_//_/
    //                               /___/
    @IBInspectable dynamic var design: String {
        get {
            // Ever reading it? then add a stored property with associatedObject I guess
            return ""
        }
        set {
            
            //     __  _________       __  __
            //    / / / /  _/ _ )__ __/ /_/ /____  ___
            //   / /_/ // // _  / // / __/ __/ _ \/ _ \
            //   \____/___/____/\_,_/\__/\__/\___/_//_/
            //
            if self.isKind(of: UIButton.self) {
                if let button = self as? UIButton {
                    if newValue.contains(":") {
                        let components = newValue.components(separatedBy: ":")
                        button.setTitleColor(UIColor.colorFor(name: components[0]), for: UIControlState.normal)
                        button.backgroundColor = UIColor.colorFor(name: components[1])
                    } else {
                        button.backgroundColor = UIColor.colorFor(name: newValue)
                    }
                }
                
            //     __  ____________        __  _____     __   __
            //    / / / /  _/_  __/____ __/ /_/ __(_)__ / /__/ /
            //   / /_/ // /  / / / -_) \ / __/ _// / -_) / _  /
            //   \____/___/ /_/  \__/_\_\\__/_/ /_/\__/_/\_,_/
            //
            } else if self.isKind(of: UITextField.self) {
                if let textField = self as? UITextField {
                    if newValue.contains(":") {
                        let components = newValue.components(separatedBy: ":")
                        textField.textColor = UIColor.colorFor(name: components[0])
                        textField.backgroundColor = UIColor.colorFor(name: components[1])
                    } else {
                        textField.backgroundColor = UIColor.colorFor(name: newValue)
                    }
                }

            //     __  ________        __       __
            //    / / / /  _/ /  ___ _/ /  ___ / /
            //   / /_/ // // /__/ _ `/ _ \/ -_) /
            //   \____/___/____/\_,_/_.__/\__/_/
            //
            } else if self.isKind(of: UILabel.self) {
                if let label = self as? UILabel {
                    label.textColor = UIColor.colorFor(name: newValue)
                }
            } else if self.isKind(of: UISwitch.self) {
                if let sw = self as? UISwitch {
                    sw.onTintColor = UIColor.colorFor(name: newValue)
                }

            // TODO: Add more cases for other subclasses of UIView

            // Defaults to setting background color
            } else {
                backgroundColor = UIColor.colorFor(name: newValue)
            }
        }
    }

    //      _______  _      __        _         _______ __  __
    //     /  _/ _ )(_) ___/ /__ ___ (_)__ ____/_  __(_) /_/ /__
    //    _/ // _  |   / _  / -_|_-</ / _ `/ _ \/ / / / __/ / -_)
    //   /___/____(_)  \_,_/\__/___/_/\_, /_//_/_/ /_/\__/_/\__/
    //                               /___/
    @IBInspectable dynamic var designTitle: String {
        get {
            // Ever reading it? then add a stored property with associatedObject I guess
            return ""
        }
        set {

            //     __  _________       __  __
            //    / / / /  _/ _ )__ __/ /_/ /____  ___
            //   / /_/ // // _  / // / __/ __/ _ \/ _ \
            //   \____/___/____/\_,_/\__/\__/\___/_//_/
            //
            if self.isKind(of: UIButton.self), let button = self as? UIButton {
                // TODO: Maybe use the title itsel?
                button.setTitle( NSLocalizedString(newValue, comment: "designTitle: \(newValue)") , for:.normal)
                button.setTitle( NSLocalizedString(newValue, comment: "designTitle: \(newValue)") , for:.highlighted)

            //     __  ________        __       __
            //    / / / /  _/ /  ___ _/ /  ___ / /
            //   / /_/ // // /__/ _ `/ _ \/ -_) /
            //   \____/___/____/\_,_/_.__/\__/_/
            //
            } else if self.isKind(of: UILabel.self), let label = self as? UILabel {
                // TODO: Maybe use the title itsel?
                label.text = NSLocalizedString(newValue, comment: "designTitle: \(newValue)")
            
            } else {
                
                // TODO: Add more cases for other subclasses of UIView, ie UILabel
                
            }
        }
    }

    //      _______  _      __        _           ___  __             __        __   __
    //     /  _/ _ )(_) ___/ /__ ___ (_)__ ____  / _ \/ /__ ________ / /  ___  / /__/ /__ ____
    //    _/ // _  |   / _  / -_|_-</ / _ `/ _ \/ ___/ / _ `/ __/ -_) _ \/ _ \/ / _  / -_) __/
    //   /___/____(_)  \_,_/\__/___/_/\_, /_//_/_/  /_/\_,_/\__/\__/_//_/\___/_/\_,_/\__/_/
    //                               /___/
    @IBInspectable dynamic var designPlaceholder: String {
        get {
            // Ever reading it? then add a stored property with associatedObject I guess
            return ""
        }
        set {
            
            //     __  __________                 __   ___
            //    / / / /  _/ __/__ ___ _________/ /  / _ )___ _____
            //   / /_/ // /_\ \/ -_) _ `/ __/ __/ _ \/ _  / _ `/ __/
            //   \____/___/___/\__/\_,_/_/  \__/_//_/____/\_,_/_/
            //
            if self.isKind(of: UISearchBar.self), let searchBar = self as? UISearchBar {
                
                // TODO: Maybe use the placeholder itself?
                searchBar.placeholder = NSLocalizedString(newValue, comment: "designPlaceholder: \(newValue)")
                
            } else {
                
                // TODO: Add more cases for other subclasses of UIView
                
            }
        }
    }
}

extension UIButton {

    //      _______  _      __        _           ____              __
    //     /  _/ _ )(_) ___/ /__ ___ (_)__ ____  / __/  _____ ___  / /_
    //    _/ // _  |   / _  / -_|_-</ / _ `/ _ \/ _/| |/ / -_) _ \/ __/
    //   /___/____(_)  \_,_/\__/___/_/\_, /_//_/___/|___/\__/_//_/\__/
    //                               /___/
    @IBInspectable dynamic var designEvent: String {
        get {
            // Ever reading it? the add a stored property with associatedObject I guess
            return ""
        }
        set {
            // Associated object that holds the action call
            class ActionDispatch : NSObject {
                let event: String
                init(object: NSObject, event e: String) {
                    event = e
                    super.init()
                    objc_setAssociatedObject(object, "designEvent", self, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
                }
                func postAction() {
                    SimpleEventHandler.defaultHandler.handle(event: .userInput, eventData: ["event": event])
                }
            }
            
            addTarget(ActionDispatch.init(object: self, event: newValue),
                      action: #selector(ActionDispatch.postAction),
                      for: .touchUpInside)
        }
    }
}
