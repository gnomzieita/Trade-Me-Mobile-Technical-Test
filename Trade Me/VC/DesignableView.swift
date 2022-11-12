//
//  DesignableView.swift
//  Trade Me
//
//  Created by Oleksii Aharkov on 10.11.2022.
//

import UIKit

@IBDesignable
class DesignableView: UIView {
}

extension UIView {
    func applyGradient(colours: [UIColor]) -> Void {
        self.applyGradient(colours: colours, locations: nil)
    }

    func applyGradient(colours: [UIColor], locations: [NSNumber]?) -> Void {
        let gradient: CAGradientLayer = CAGradientLayer()
        gradient.frame = self.bounds
        gradient.colors = colours.map { $0.cgColor }
        gradient.locations = locations
        self.layer.insertSublayer(gradient, at: 0)
    }
}

@IBDesignable
class GradientDesignableView: UIView {
    override class var layerClass: AnyClass { return CAGradientLayer.self }

    private var gradientLayer: CAGradientLayer { return layer as! CAGradientLayer }

    @IBInspectable var color1: UIColor = UIColor(red: 253.00/255.00, green: 177.00/255.00, blue: 79.00/255.00, alpha: 1) { didSet { updateColors() } }
    @IBInspectable var color2: UIColor = UIColor(red: 255.00/255.00, green: 89.00/255.00, blue: 62.00/255.00, alpha: 1)  { didSet { updateColors() } }

    override init(frame: CGRect = .zero) {
        super.init(frame: frame)
        configureGradient()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        configureGradient()
    }

    private func configureGradient() {
        gradientLayer.startPoint = CGPoint(x: 0.0, y: 0.0)
        gradientLayer.endPoint = CGPoint(x: 0.0, y: 1.0)
        updateColors()
    }

    private func updateColors() {
        gradientLayer.colors = [color1.cgColor, color2.cgColor]
    }
}
@IBDesignable
class DesignableButton: UIButton {
}

@IBDesignable
class DesignableLabel: UILabel {
}

@IBDesignable
class DesignableNavigationBar: UINavigationBar {
    @IBInspectable var firstColor: UIColor = UIColor.clear {
        didSet {
            self.setNeedsLayout()
        }
    }

    @IBInspectable var secondColor: UIColor = UIColor.clear {
        didSet {
            self.setNeedsLayout()
        }
    }
    override class var layerClass: AnyClass {
        get {
            return CAGradientLayer.self
        }
    }

    override func layoutSubviews() {
        let gradientLayer = CAGradientLayer()

        gradientLayer.colors = [firstColor.cgColor, secondColor.cgColor]
        gradientLayer.startPoint = CGPoint(x: 0, y: 0.5)
        gradientLayer.endPoint = CGPoint(x: 1, y: 0.5)
        gradientLayer.frame = self.bounds
        gradientLayer.frame = CGRect(x: 0, y: -20, width: self.bounds.width, height: 64)
        self.layer.insertSublayer(gradientLayer, at: 0)
    }
}

@IBDesignable
class DesignableCollectionView: UICollectionView {
}

@IBDesignable
class DesignableTabBar: UITabBar {
}

@IBDesignable
class DesignableImageView: UIImageView {
}

@IBDesignable
class DesignableTextField: UITextField {
}

extension UIView {

    @IBInspectable
    var cornerRadius: CGFloat {
        get {
            return layer.cornerRadius
        }
        set {
            layer.cornerRadius = newValue
        }
    }

    @IBInspectable
    var borderColor: UIColor? {
        get {
            if let color = layer.borderColor {
                return UIColor(cgColor: color)
            }
            return nil
        }
        set {
            if let color = newValue {
                layer.borderColor = color.cgColor
            } else {
                layer.borderColor = nil
            }
        }
    }

    @IBInspectable
    var borderWidth: CGFloat {
        get {
            return layer.borderWidth
        }
        set {
            layer.borderWidth = newValue
        }
    }
    
    @IBInspectable
    var shadowRadius: CGFloat {
        get {
            return layer.shadowRadius
        }
        set {
            layer.shadowRadius = newValue
        }
    }

    @IBInspectable
    var shadowOpacity: Float {
        get {
            return layer.shadowOpacity
        }
        set {
            layer.shadowOpacity = newValue
        }
    }

    @IBInspectable
    var shadowOffset: CGSize {
        get {
            return layer.shadowOffset
        }
        set {
            layer.shadowOffset = newValue
        }
    }

    @IBInspectable
    var shadowColor: UIColor? {
        get {
            if let color = layer.shadowColor {
                return UIColor(cgColor: color)
            }
            return nil
        }
        set {
            if let color = newValue {
                layer.shadowColor = color.cgColor
            } else {
                layer.shadowColor = nil
            }
        }
    }
}


