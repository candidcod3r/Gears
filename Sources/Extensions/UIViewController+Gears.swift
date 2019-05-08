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
    public func addChildViewController(_ child: UIViewController?) {
        guard let child = child else {
            return
        }
        
        addChild(child)
        child.view.frame = view.bounds
        child.view.autoresizingMask = [.flexibleWidth, .flexibleHeight]
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
}
