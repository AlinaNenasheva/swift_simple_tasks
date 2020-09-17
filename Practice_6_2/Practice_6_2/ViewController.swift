import UIKit

class ViewController: UIViewController {
  
    @IBOutlet weak var sizeTextField: UITextField!
    var x = 0
    var y = 0
    var size = 0
    var squareViews: [UIView] = []
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    @IBAction func fillButtonPressed(_ sender: Any) {
        createSquare()
    }
    @IBAction func sizeTextFieldEditChanged(_ sender: Any) {
        let text: String = sizeTextField.text ?? ""
        size = Int(text) != nil ? Int(text)! : 0
    }
    
    func createSquare(){
        let newSquareView = UIView()
        newSquareView.frame = CGRect(x: x, y: y, width: size, height: size)
        x += size
        if CGFloat(x + size) > view.frame.width {
            y += size
            x = 0
        }
        newSquareView.backgroundColor = UIColor(red: CGFloat.random(in: 0...1), green: CGFloat.random(in: 0...1), blue: CGFloat.random(in: 0...1), alpha: 1)
        squareViews.append(newSquareView)
        if CGFloat(y + size) < view.frame.height {
            createSquare()
        } else {
            for tempView in squareViews{
                view.addSubview(tempView)
            }
            return
        }
    }
    
}

