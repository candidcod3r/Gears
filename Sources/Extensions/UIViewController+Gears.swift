//
//  UIViewController+Gears.swift
//  Gears
//
//  Created by Candid Cod3r on 5/8/19.
//  Copyright © 2019 Sparkles. All rights reserved.
//

extension UIViewController {
    // Reference:
    // https://developer.apple.com/library/archive/featuredarticles/ViewControllerPGforiPhoneOS/ImplementingaContainerViewController.html
    public func addChildViewController(_ child: UIViewController?, fillView: Bool = true) {
        guard let child = child else {
            return
        }
        
        addChild(child)
        if fillView {
            child.view.frame = view.bounds
            child.view.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        }
        view.addSubview(child.view)
        child.didMove(toParent: self)
    }

    // Reference:
    // https://developer.apple.com/library/archive/featuredarticles/ViewControllerPGforiPhoneOS/ImplementingaContainerViewController.html
    public func removeFromParentViewcontroller() {
        guard parent != nil else {
            return
        }

        willMove(toParent: nil)
        view.removeFromSuperview()
        removeFromParent()
    }

    public var safeAreaInsets: UIEdgeInsets {
        if #available(iOS 11.0, *) {
            return view.safeAreaInsets
        } else {
            return .zero
        }
    }
}
