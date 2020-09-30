import UIKit

class ViewController: UIViewController {
  
    @IBOutlet weak var sizeTextField: UITextField!
    
    var text = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    @IBAction func fillButtonPressed(_ sender: Any) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let viewController = storyboard.instantiateViewController(identifier: String(describing: CubesDisplayViewController.self)) as! CubesDisplayViewController
        viewController.size = Int(text) != nil ? Int(text)! : 0
        self.present(viewController, animated: true)
    }
    
    @IBAction func sizeTextFieldEditChanged(_ sender: Any) {
        text = sizeTextField.text ?? ""
    }
    
    
}

