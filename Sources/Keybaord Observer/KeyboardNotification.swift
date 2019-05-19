//
//  KeyboardNotification.swift
//  Gears
//
//  Created by Candid Cod3r on 5/9/19.
//  Copyright © 2019 Sparkles. All rights reserved.
//

public struct KeyboardNotification {
    public let name: NSNotification.Name
    public let keyboardBeginFrame: CGRect
    public let keyboardEndFrame: CGRect
    public let animationCurve: UIView.AnimationCurve
    public let animationDuration: TimeInterval

    public var animationOptions: UIView.AnimationOptions {
        return UIView.AnimationOptions(rawValue: UInt(animationCurve.rawValue << 16))
    }

    public init(name: Notification.Name,
         keyboardBeginFrame: CGRect,
         keyboardEndFrame: CGRect,
         animationCurve: UIView.AnimationCurve,
         animationDuration: TimeInterval) {
        self.name = name
        self.keyboardBeginFrame = keyboardBeginFrame
        self.keyboardEndFrame = keyboardEndFrame
        self.animationCurve = animationCurve
        self.animationDuration = animationDuration
    }

    public init?(notification: Notification) {
        guard let userInfo = notification.userInfo else {
            return nil
        }

        guard let keyboardBeginFrame = (userInfo[UIResponder.keyboardFrameBeginUserInfoKey] as? NSValue)?.cgRectValue else {
            return nil
        }

        guard let keyboardEndFrame = (userInfo[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue else {
            return nil
        }

        guard let curveValue = (userInfo[UIResponder.keyboardAnimationCurveUserInfoKey] as? NSNumber)?.intValue,
            let animationCurve = UIView.AnimationCurve(rawValue: curveValue) else {
                return nil
        }

        guard let durationValue = (userInfo[UIResponder.keyboardAnimationDurationUserInfoKey] as? NSNumber)?.doubleValue else {
            return nil
        }

        self.init(
            name: notification.name,
            keyboardBeginFrame: keyboardBeginFrame,
            keyboardEndFrame: keyboardEndFrame,
            animationCurve: animationCurve,
            animationDuration: TimeInterval(durationValue))
    }
}
