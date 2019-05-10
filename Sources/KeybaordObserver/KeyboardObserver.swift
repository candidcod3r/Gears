//
//  KeyboardObserver.swift
//  Gears
//
//  Created by Candid Cod3r on 5/9/19.
//  Copyright © 2019 Sparkles. All rights reserved.
//

public enum KeyboardState {
    case initial
    case showing
    case shown
    case hiding
    case hidden
    case changing
}

/**
 Keyboard observer that listens on keyboard notifications and activates the observation block with or without
 animation. Typically this is intialized in a UIViewController and would call stopObserving on viewWillDisapper.
 */
open class KeyboardObserver {
    public typealias KeyboardNotificationObservation = (KeyboardNotification) -> Void

    public static let notifications: [NSNotification.Name] = [
        UIResponder.keyboardWillShowNotification,
        UIResponder.keyboardDidShowNotification,
        UIResponder.keyboardWillHideNotification,
        UIResponder.keyboardDidHideNotification,
        UIResponder.keyboardWillChangeFrameNotification,
        UIResponder.keyboardDidChangeFrameNotification]

    fileprivate var observation: KeyboardNotificationObservation?

    deinit {
        stopObserving()
    }

    open func startObserving() {
        // stop the previous observers if any, just to be safe
        stopObserving()

        KeyboardObserver.notifications.forEach {
            NotificationCenter.default.addObserver(self, selector: #selector(handleNotification(_:)), name: $0, object: nil)
        }
    }

    open func stopObserving() {
        observation = nil

        KeyboardObserver.notifications.forEach {
            NotificationCenter.default.removeObserver(self, name: $0, object: nil)
        }
    }

    open func observation(_ observation: @escaping KeyboardNotificationObservation, inAnimation: Bool = false) {
        if inAnimation {
            self.observation = KeyboardObserver.animationObservation(observation)
        } else {
            self.observation = observation
        }
    }

    // MARK:- Private methods

    @objc private func handleNotification(_ notification: Notification) {
        guard let keyboardNotification = KeyboardNotification(notification: notification) else {
            return
        }

        observation?(keyboardNotification)
    }

    fileprivate static func animationObservation(_ observation: KeyboardNotificationObservation?) -> KeyboardNotificationObservation {
        return { (notification: KeyboardNotification) in
            UIView.animate(
                withDuration: notification.animationDuration,
                delay: 0,
                options: [notification.animationOptions, .beginFromCurrentState],
                animations: {
                    observation?(notification)
            },
                completion: nil)
        }
    }
}
