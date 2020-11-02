import UIKit

class GameViewController: UIViewController {

    var roadImage: UIImageView!
    var carImage: UIImageView!
    var obstacleImage: UIImageView!
    @IBOutlet weak var leftGrassImageView: UIImageView!
    @IBOutlet weak var rightGrassImageView: UIImageView!
    var settings = Settings()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        retriveSettings()
        navigationController?.setNavigationBarHidden(true, animated: true)
        roadImage = UIImageView(frame: CGRect(x: leftGrassImageView.frame.width, y: -500, width: view.frame.width - leftGrassImageView.frame.width - rightGrassImageView.frame.width, height: view.frame.height + 500))
        roadImage.image = UIImage(named: "roadimage")
        view.addSubview(roadImage)
        carImage = UIImageView(frame: CGRect(x: leftGrassImageView.frame.width + roadImage.frame.width/2 - 10, y: view.frame.height - 210, width: roadImage.frame.width/2, height: 200))
        switch settings.carColor {
        case "green":
             carImage.image = UIImage(named: "greencarimage")
        case "brown":
            carImage.image = UIImage(named: "browncarimage")
        case "blue":
            carImage.image = UIImage(named: "bluecarimage")
        default:
            carImage.image = UIImage(named: "bluecarimage")
        }
        view.addSubview(carImage)
        let rightSwipeGesture = UISwipeGestureRecognizer(target: self, action: #selector(processSwipe(_:)))
        view.addGestureRecognizer(rightSwipeGesture)
        let leftSwipeGesture = UISwipeGestureRecognizer(target: self, action: #selector(processSwipe(_:)))
        leftSwipeGesture.direction = .left
        view.addGestureRecognizer(leftSwipeGesture)
        let y = roadImage.frame.origin.y
        if Bool.random() {
            self.obstacleImage = self.generateObstacle()
            UIView.animate(withDuration: 2, animations: {
                 self.obstacleImage.frame.origin.y = self.view.frame.height + 40
            }) { (_) in
                self.animateObject()
            }
        } else {
            animateObject()
        }
        UIView.animate(withDuration: 0.25, animations: {
            self.roadImage.frame.origin.y = self.view.frame.origin.y
        }) { (_) in
            self.roadImage.frame.origin.y = y
            self.animateRoad(y: y)
        }
    }
    
    func animateObject() {
        if Bool.random() {
                   self.obstacleImage = self.generateObstacle()
                   UIView.animate(withDuration: 2, animations: {
                    if self.checkCrush() {
                        self.roadImage.layer.removeAllAnimations()
                        return
                    }
                        self.obstacleImage.frame.origin.y = self.view.frame.height + 40
                   }) { (_) in
                       self.animateObject()
                   }
        } else {
            animateObject()
        }
    }
    
    func checkCrush() -> Bool{
        if self.obstacleImage.frame.origin.x + 40 == self.carImage.frame.origin.x && self.obstacleImage.frame.origin.y + 40 == self.carImage.frame.origin.y{
            return true
        }
        return false
    }
    
    func animateRoad(y: CGFloat) {
        UIView.animate(withDuration: 0.25, animations: {
            self.roadImage.frame.origin.y = self.view.frame.origin.y
        }) { (_) in
            self.roadImage.frame.origin.y = y
            self.animateRoad(y: y)
        }
    }
    
    func generateObstacle() -> UIImageView{
        let obstacleImage: UIImageView
        let direction = Bool.random()
        if direction {
            obstacleImage = UIImageView(frame: CGRect(x: view.frame.width/2 - 80, y: -100, width: 40, height: 40))
            setObstacle(obstacleImage)
            view.addSubview(obstacleImage)
        } else {
            obstacleImage = UIImageView(frame: CGRect(x: view.frame.width/2 + 60, y: -40, width: 40, height: 40))
            setObstacle(obstacleImage)
            view.addSubview(obstacleImage)
        }
        return obstacleImage
    }
    
        func setObstacle(_ obstacleImage: UIImageView) {
        switch settings.obstacle {
        case "rock":
        obstacleImage.image = UIImage(named: "stoneimage")
        case "log":
        obstacleImage.image = UIImage(named: "logimage")
        case "grass":
        obstacleImage.image = UIImage(named: "grassimage")
        default:
        obstacleImage.image = UIImage(named: "stoneimage")
        }
    }
    
    func retriveSettings() {
        if let data = UserDefaults.standard.value(forKey: "SettingsKey") as? Data {
                   do{
                       let settings = try JSONDecoder().decode(Settings.self, from: data)
                       self.settings = settings
                   } catch {
                       print(error)
                    settings =  Settings()
                   }
               }else {
                   settings = Settings()
               }
    }
    
    @objc func processSwipe(_ swipeGesture: UISwipeGestureRecognizer) {
         switch swipeGesture.direction {
         case .left:
            carImage.frame.origin.x -= 120
            if carImage.frame.origin.x < roadImage.frame.origin.x {
                carImage.image = UIImage(named: "explosionimage")
                showAlert()
            }
         case .right:
            carImage.frame.origin.x += 120
            if carImage.frame.origin.x + carImage.frame.width > roadImage.frame.origin.x + roadImage.frame.width {
                carImage.image = UIImage(named: "explosionimage")
                showAlert()
            }
         default:
             print("")
        }
    }
    
    func showAlert() {
        let alert = UIAlertController(title: "You lost", message: nil, preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: "Go back to menu", style: .default, handler: { _ in
                    self.navigationController?.popToRootViewController(animated: true)
        }))
        self.present(alert, animated: true, completion: nil)
    }
    
    @IBAction func backToMenuButtonPressed(_ sender: Any) {
        navigationController?.popToRootViewController(animated: true)
    }
}
