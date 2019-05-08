//
//  GradientView.swift
//  Alamofire
//
//  Created by Candid Cod3r on 5/8/19.
//  Copyright © 2019 Sparkles. All rights reserved.
//

/**
 Helper GradientView that can be added to any view to create gradient background effect. Gradient is implemented with
 a view instead of layer since the view can be auto resized when its superview frame is modified.
 */
open class GradientView: UIView {
    private let gradientLayer = CAGradientLayer()

    public override init(frame: CGRect) {
        super.init(frame: frame)

        setup()
    }

    public required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)

        setup()
    }

    open override func layoutSubviews() {
        gradientLayer.frame = bounds

        super.layoutSubviews()
    }

    private func setup() {
    }

    private func insertGradientLayerIfNeeded() {
        if gradientLayer.superlayer == nil {
            layer.insertSublayer(gradientLayer, at: 0)
        }
    }

    fileprivate func setColors(_ colors: [UIColor]) {
        insertGradientLayerIfNeeded()
        gradientLayer.type = .axial
        gradientLayer.startPoint = CGPoint(x: 0, y: 0.5)
        gradientLayer.endPoint = CGPoint(x: 1, y: 0.5)
        gradientLayer.colors = colors.map { $0.cgColor }
    }
}

extension UIView {
    public func addGradientView(with colors: [UIColor]) {
        guard colors.count > 0 else {
            gradientView?.removeFromSuperview()
            return
        }

        makeGradientViewIfNeeded()

        guard let gradientView = gradientView else {
            return
        }
        
        sendSubviewToBack(gradientView)
        gradientView.setColors(colors)
    }
}


extension UIView {
    fileprivate struct Key {
        static var gradientView = "com.gears.view.gradientView"
    }

    fileprivate var gradientView: GradientView? {
        get {
            return objc_getAssociatedObject(self, &Key.gradientView) as? GradientView
        }
        set {
            objc_setAssociatedObject(self, &Key.gradientView, newValue, .OBJC_ASSOCIATION_RETAIN)
        }
    }

    fileprivate func makeGradientViewIfNeeded() {
        gradientView = gradientView ?? GradientView()
        gradientView?.autoresizingMask = [.flexibleWidth, .flexibleHeight]

        guard let gradientView = gradientView else {
            return
        }

        if gradientView.superview == nil {
            addSubview(gradientView)
        }
    }
}
