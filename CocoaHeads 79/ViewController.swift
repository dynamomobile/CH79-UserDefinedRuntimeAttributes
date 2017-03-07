import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        SimpleEventHandler.defaultHandler.add(id: "main.vc", forEvent: .userInput) {
            (eventData) in
            print("eventData = \(eventData)")
        }

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

}
