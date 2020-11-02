import UIKit

class SettingsViewController: UIViewController {

    @IBOutlet weak var colorPickerView: UIView!
    @IBOutlet weak var obstaclePickerView: UIView!
    @IBOutlet weak var racerNameTextField: UITextField!
    var particularSettings = Settings()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        colorPickerView.setGradient(colors: [CGColor(srgbRed: 0, green: 1, blue: 0, alpha: 0.5), CGColor(srgbRed: 0, green: 0, blue: 1, alpha: 0.5), CGColor(srgbRed: 0.4, green: 0.25, blue: 0.13, alpha: 0.5)], startPoint: CGPoint(x: 0, y: 0.5), endPoint: CGPoint(x: 1, y: 0.5))
        colorPickerView.layer.cornerRadius = 10
        obstaclePickerView.setGradient(colors: [UIColor.lightGray.cgColor, UIColor.gray.cgColor, UIColor.darkGray.cgColor], startPoint: CGPoint(x: 0, y: 0.5), endPoint: CGPoint(x: 1, y: 0.5))
        obstaclePickerView.layer.cornerRadius = 10
    }
    
    @IBAction func racerNameEditingChanged(_ sender: Any) {
        particularSettings.racerName = racerNameTextField.text!
    }
    
    @IBAction func blueColorButtonPressed(_ sender: Any) {
        particularSettings.carColor = "blue"
    }
    
    @IBAction func greenColorButtonPressed(_ sender: Any) {
        particularSettings.carColor = "green"
    }
    
    @IBAction func brownColorButtonPressed(_ sender: Any) {
        particularSettings.carColor = "brown"
    }
    
    @IBAction func grassButtonPressed(_ sender: Any) {
        particularSettings.obstacle = "grass"
    }
    
    @IBAction func rockButtonPressed(_ sender: Any) {
        particularSettings.obstacle = "rock"
    }
    
    @IBAction func logButtonPressed(_ sender: Any) {
        particularSettings.obstacle = "log"
    }

    @IBAction func backToMenuButtonPressed(_ sender: Any) {
        navigationController?.popToRootViewController(animated: true)
        do{
            let data = try JSONEncoder().encode(particularSettings)
            UserDefaults.standard.setValue(data, forKey: "SettingsKey")
        } catch {
            print(error)
        }
    }
}
