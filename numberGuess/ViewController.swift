import UIKit

class ViewController: UIViewController {

    var model = Model()
    
    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var button: UIButton!
    
    
    @IBAction func onChangeTextField(_ sender: UITextField) {
        print("text is now: \(sender.text)")
        button.isEnabled = model.isValidGuess(value: Int(sender.text!))
    }
    
    
    @IBAction func guessButton(_ sender: Any) {
        let inputNumber = model.compare(guessedString: textField.text!)
        let text: String?
        
        switch inputNumber {
        case -1:
            text = "HIGHER!"
        case 1:
            text = "LOWER!"
        default:
            text = "U GOT IT"
        }
        label.text = text
        model.countOfTries+=1
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        model.numberToGuess = Int.random(in: 0..<100)
        print("Zu erratene Zahl: \(model.numberToGuess)") 
    }
}
