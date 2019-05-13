//
//  UIView+Gears.swift￼
//  Gears
//
//  Created by Candid Cod3r on 5/3/19.
//  Copyright (c) 2019 Candid Cod3r.
//

extension UIView {
    public var left: CGFloat {
        get {
            return frame.origin.x
        }
        set(newValue) {
            frame.origin.x = newValue
        }
    }
    
    public var right: CGFloat {
        get {
            return left + frame.size.width
        }
        set(newValue) {
            frame.origin.x = newValue - frame.size.width
        }
    }
    
    public var top: CGFloat {
        get {
            return frame.origin.y
        }
        set(newValue) {
            frame.origin.y = newValue
        }
    }
    
    public var bottom: CGFloat {
        get {
            return top + frame.size.height
        }
        set(newValue) {
            frame.origin.y = newValue - frame.size.height
        }
    }

    /**
     Corner radius of the view.
     */
    public var cornerRadius: CGFloat {
        get {
            return layer.cornerRadius
        }
        set {
            layer.masksToBounds = newValue > 0
            layer.cornerRadius = newValue
        }
    }

    /**
     Set borders for the view and subviews if applicable. Utility method helpful for debugging purposes.
     */
    public func setBorders(with color: UIColor? = nil, recursively: Bool = true) {
        let nonnilColor = color ?? .random
        layer.borderColor = nonnilColor.cgColor
        layer.borderWidth = 1

        guard recursively else {
            return
        }

        for subview in subviews {
            subview.setBorders(with: color, recursively: recursively)
        }
    }

    /**
     Add shadow to view.
     */
    public func addShadow(ofColor color: UIColor = UIColor(0xEAEAEA),
                          radius: CGFloat = 2,
                          offset: CGSize = .zero,
                          opacity: Float = 0.5) {
        layer.shadowColor = color.cgColor
        layer.shadowOffset = offset
        layer.shadowRadius = radius
        layer.shadowOpacity = opacity
        layer.masksToBounds = false
    }
}
