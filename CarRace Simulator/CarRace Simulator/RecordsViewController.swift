import UIKit

class RecordsViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
         navigationController?.setNavigationBarHidden(true, animated: true)

    }
    

    @IBAction func backToMenuButtonPressed(_ sender: Any) {
        navigationController?.popToRootViewController(animated: true)
    }

}
