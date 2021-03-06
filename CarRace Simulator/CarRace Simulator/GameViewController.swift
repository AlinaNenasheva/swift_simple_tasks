import UIKit

class GameViewController: UIViewController {

    var roadImage: UIImageView!
    var carImage: UIImageView!
    var obstacleImages = [UIImageView]()
    @IBOutlet weak var leftGrassImageView: UIImageView!
    @IBOutlet weak var rightGrassImageView: UIImageView!
    @IBOutlet weak var scoreLabel: UILabel!
    var settings = Settings()
    var inProccess = true
    var score = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        retriveSettings()
        navigationController?.setNavigationBarHidden(true, animated: true)
        roadImage = UIImageView(frame: CGRect(x: leftGrassImageView.frame.width, y: -600, width: view.frame.width - leftGrassImageView.frame.width - rightGrassImageView.frame.width, height: view.frame.height + 600))
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
//        obstacleImages.append(self.generateObstacle())
        Timer.scheduledTimer(withTimeInterval: 1, repeats: false) { (_) in
            if let obstacle = self.obstacleImages.last {
                self.animateObject(obstacle)
                
            }
        }
        createObjects()
        Timer.scheduledTimer(withTimeInterval: 0.1, repeats: true) { (_) in
            self.inProccess = self.checkCrush()
        }
        UIView.animate(withDuration: 0.25, animations: {
            self.roadImage.frame.origin.y = self.view.frame.origin.y
        }) { (_) in
            self.roadImage.frame.origin.y = y
            self.animateRoad(y: y)
        }
    }

    
    func createObjects() {
        Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { (timer) in
            if !self.inProccess {
                timer.invalidate()
            }
            let obstacle = self.generateObstacle()
            self.obstacleImages.append(obstacle)
            self.animateObject(obstacle)
        }
    }
    
    func animateObject(_ view: UIView) {
        UIView.animate(withDuration: 0.01, animations: {
            if let obstacle = self.obstacleImages.last {
                obstacle.frame.origin.y += 3
            }
        }) { (_) in
            if let obstacle = self.obstacleImages.last {
                if self.inProccess && obstacle.frame.origin.y < self.view.frame.height {
                    self.animateObject(view)
                }
            }
        }
    }
        
//        if Bool.random() && (obstacleImages.last?.frame.origin.y)! < view.frame.height {
//            UIView.animate(withDuration: 0.01, animations: {
//                self.obstacleImages.last?.frame.origin.y += 3
//            }) { (_) in
//                self.animateObject(view)
//            }
//        } else {
//            if inProccess {
//                animateObject(view)
//            } else {
//                return
//            }
//        }
//    }
    
    func checkCrush() -> Bool {
        if (self.obstacleImages.last?.frame.intersects(self.carImage.frame)) ?? false {
            showAlert()
            carImage.contentMode = .scaleAspectFill
            carImage.image = UIImage(named: "explosionimage")
            return false
        } else {
            return true
        }
    }
    
    func animateRoad(y: CGFloat) {
        if inProccess {
        UIView.animate(withDuration: 0.25, animations: {
            self.roadImage.frame.origin.y = self.view.frame.origin.y
        }) { (_) in
            self.roadImage.frame.origin.y = y
            self.animateRoad(y: y)
            }
        } else {
            return
        }
    }
    
    func generateObstacle() -> UIImageView {
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
                carImage.contentMode = .scaleAspectFill
                carImage.image = UIImage(named: "explosionimage")
                showAlert()
            }
         case .right:
            carImage.frame.origin.x += 120
            if carImage.frame.origin.x + carImage.frame.width > roadImage.frame.origin.x + roadImage.frame.width {
                carImage.contentMode = .scaleAspectFill
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
