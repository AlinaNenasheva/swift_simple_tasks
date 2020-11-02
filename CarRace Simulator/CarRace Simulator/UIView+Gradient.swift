import Foundation

import UIKit

extension UIView {
    func setGradient(colors: [CGColor], startPoint: CGPoint? = nil, endPoint: CGPoint? = nil, type: CAGradientLayerType = .axial) {
        let gradientLayer = CAGradientLayer()
        gradientLayer.colors = colors
        if let startPoint = startPoint {
            gradientLayer.startPoint = startPoint
        }
        if let endPoint = endPoint {
            gradientLayer.endPoint = endPoint
        }
        gradientLayer.type = type
        gradientLayer.frame = self.bounds
        self.layer.insertSublayer(gradientLayer, at: 0)
        gradientLayer.cornerRadius = 10
    }
}
