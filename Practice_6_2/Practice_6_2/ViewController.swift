import UIKit

class ViewController: UIViewController {
    
    var x = 0
    var y = 0
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    @IBAction func fillButtonPressed(_ sender: Any) {
        createSquare()
    }
    
    func createSquare(){
        let squareView = UIView()
        squareView.frame = CGRect(x: x, y: y, width: 100, height: 100)
        x += 100
        if CGFloat(x + 100) > squareView.frame.width {
            y += 100
        }
        squareView.backgroundColor = UIColor(red: CGFloat.random(in: 0...254), green: CGFloat.random(in: 0...254), blue: CGFloat.random(in: 0...254), alpha: 1)
        if CGFloat(y + 100) < squareView.frame.height {
            createSquare()
        } else {
            return
        }
    }
    
}

