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
            left = newValue - frame.size.width
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
            top = newValue - frame.size.height
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

// MARK: - Convenience gesture action helpers

extension UIView {
    public func handleTap(numberOfTaps: Int = 1, _ action: @escaping (_ recognizer: UITapGestureRecognizer) -> Void) {
        // remove old gesture recognizer if present
        if let oldActionWrapper = objc_getAssociatedObject(self, &ViewKey.tapGesture) as? TapGestureActionWrapper {
            removeGestureRecognizer(oldActionWrapper.recognizer)
        }

        let gestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(handleTapGesture(_:)))
        gestureRecognizer.numberOfTapsRequired = numberOfTaps

        objc_setAssociatedObject(
            self,
            &ViewKey.tapGesture,
            GestureActionWrapper(recognizer: gestureRecognizer, action: action),
            objc_AssociationPolicy.OBJC_ASSOCIATION_RETAIN_NONATOMIC)

        isUserInteractionEnabled = true
        addGestureRecognizer(gestureRecognizer)
    }

    @objc private func handleTapGesture(_ recognizer : UITapGestureRecognizer) {
        let actionWrapper = objc_getAssociatedObject(self, &ViewKey.tapGesture) as? TapGestureActionWrapper
        actionWrapper?.action(recognizer)
    }

    public func handlePan(_ action: @escaping (_ recognizer: UIPanGestureRecognizer) -> Void) {
        // remove old gesture recognizer if present
        if let oldActionWrapper = objc_getAssociatedObject(self, &ViewKey.panGesture) as? PanGestureActionWrapper {
            removeGestureRecognizer(oldActionWrapper.recognizer)
        }

        let gestureRecognizer = UIPanGestureRecognizer(target: self, action: #selector(handlePanGesture(_:)))

        objc_setAssociatedObject(
            self,
            &ViewKey.panGesture,
            GestureActionWrapper(recognizer: gestureRecognizer, action: action),
            objc_AssociationPolicy.OBJC_ASSOCIATION_RETAIN_NONATOMIC)

        isUserInteractionEnabled = true
        addGestureRecognizer(gestureRecognizer)
    }

    @objc private func handlePanGesture(_ recognizer : UIPanGestureRecognizer) {
        let actionWrapper = objc_getAssociatedObject(self, &ViewKey.panGesture) as? PanGestureActionWrapper
        actionWrapper?.action(recognizer)
    }
}

fileprivate struct ViewKey {
    static var tapGesture: UInt8 = 0
    static var panGesture: UInt8 = 0
}

fileprivate class GestureActionWrapper<Recognizer: UIGestureRecognizer>: NSObject {
    var recognizer: Recognizer
    var action: (_ recognizer: Recognizer) -> Void

    init(recognizer: Recognizer, action: @escaping (_ recognizer: Recognizer) -> Void) {
        self.recognizer = recognizer
        self.action = action
    }
}

fileprivate typealias TapGestureActionWrapper = GestureActionWrapper<UITapGestureRecognizer>
fileprivate typealias PanGestureActionWrapper = GestureActionWrapper<UIPanGestureRecognizer>
