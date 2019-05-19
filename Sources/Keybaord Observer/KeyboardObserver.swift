//
//  KeyboardObserver.swift
//  Gears
//
//  Created by Candid Cod3r on 5/9/19.
//  Copyright © 2019 Sparkles. All rights reserved.
//

/**
 Keyboard observer that listens on keyboard notifications and activates the observation block with or without
 animation. Typically this is intialized in a UIViewController and would call stopObserving on viewWillDisapper.
 */
open class KeyboardObserver {

    public static let defaultKeyboardHeight: CGFloat = 335

    public typealias KeyboardNotificationObservation = (KeyboardNotification) -> Void

    public static let notifications: [NSNotification.Name] = [
        UIResponder.keyboardWillShowNotification,
        UIResponder.keyboardDidShowNotification,
        UIResponder.keyboardWillHideNotification,
        UIResponder.keyboardDidHideNotification,
        UIResponder.keyboardWillChangeFrameNotification,
        UIResponder.keyboardDidChangeFrameNotification]

    // Last known keyboard notification
    public private(set) var lastKnownNotification: KeyboardNotification?

    // MARK: - Private properties

    private var observation: KeyboardNotificationObservation?
    private var isObserving: Bool = false

    deinit {
        stopObserving()
    }

    public init(observation: KeyboardNotificationObservation? = nil) {
        self.observation = observation
    }

    open func startObserving() {
        // stop the previous observers if any, just to be safe
        stopObserving()

        isObserving = true

        // subscribe to keyboard notifications
        KeyboardObserver.notifications.forEach {
            NotificationCenter.default.addObserver(self, selector: #selector(handleNotification(_:)), name: $0, object: nil)
        }
    }

    open func stopObserving() {
        isObserving = false

        // unsubscribe from keyboard notifications
        KeyboardObserver.notifications.forEach {
            NotificationCenter.default.removeObserver(self, name: $0, object: nil)
        }
    }

    open func observation(_ inAnimation: Bool = false, _ observation: @escaping KeyboardNotificationObservation) {
        if inAnimation {
            self.observation = KeyboardObserver.animationObservation(observation)
        } else {
            self.observation = observation
        }
    }

    // MARK: - Private methods

    @objc private func handleNotification(_ notification: Notification) {
        guard isObserving, let keyboardNotification = KeyboardNotification(notification: notification) else {
            return
        }

        lastKnownNotification = keyboardNotification
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

    public static func animate(_ notification: KeyboardNotification, _ block: @escaping (KeyboardNotification) -> Void) {
        let animation = animationObservation(block)
        animation(notification)
    }
}
