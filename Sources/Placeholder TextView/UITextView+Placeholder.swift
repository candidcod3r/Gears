//
//  UITextView+Placeholder.swift
//  Gears
//
//  Created by Candid Cod3r on 5/18/19.
//  Copyright © 2019 Sparkles. All rights reserved.
//

fileprivate struct Key {
    static var textView: UInt8 = 0
}

public class PlaceholderTextView: UITextView {

    struct Constant {
        static let defaultTextColor = UIColor(0xC1C1C1)
    }

    // MARK: - Public methods

    weak var superTextView: UITextView? {
        didSet {
            deregisterForNotifications(on: oldValue)
            registerForNotifications(on: superTextView)

            autoresizingMask = [.flexibleWidth, .flexibleHeight]
            superTextView?.addSubview(self)
            superTextView?.sendSubviewToBack(self)
            frame = superTextView?.bounds ?? .zero
        }
    }

    public override var text: String? {
        didSet {
            update()
        }
    }

    public override var textColor: UIColor? {
        didSet {
            update()
        }
    }

    public override var attributedText: NSAttributedString? {
        didSet {
            update()
        }
    }

    public override init(frame: CGRect, textContainer: NSTextContainer?) {
        super.init(frame: frame, textContainer: textContainer)

        commonInit()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)

        commonInit()
    }

    // MARK: - Private methods

    private func commonInit() {
        backgroundColor = .clear
        isUserInteractionEnabled = false
        isEditable = false
        scrollsToTop = false
        textColor = Constant.defaultTextColor
    }

    private func registerForNotifications(on textView: UITextView?) {
        guard let textView = textView else {
            return
        }

        // listen of text did change notification
        NotificationCenter.default.addObserver(
            self,
            selector: #selector(update),
            name: UITextView.textDidChangeNotification,
            object: textView)

        // listen for kvo changes on the UITextView
        for keyPath in PlaceholderTextView.observingKeyPaths {
            textView.addObserver(self, forKeyPath: keyPath, options: .new, context: nil)
        }
    }

    private func deregisterForNotifications(on textView: UITextView?) {
        guard let textView = textView else {
            return
        }

        // listen of text did change notification
        NotificationCenter.default.removeObserver(self)

        // listen for kvo changes on the UITextView
        for keyPath in PlaceholderTextView.observingKeyPaths {
            textView.removeObserver(self, forKeyPath: keyPath)
        }
    }

    private static var observingKeyPaths: [String] = {
        return [
            "attributedText",
            "font",
            "text",
            "textAlignment",
            "textContainerInset",
            "textContainer.lineFragmentPadding",
            "textContainer.exclusionPaths"]
    }()

    @objc private func update() {
        guard let superTextView = superTextView else {
            return
        }

        font = superTextView.font
        textAlignment = superTextView.textAlignment
        textContainerInset = superTextView.textContainerInset
        textContainer.exclusionPaths = superTextView.textContainer.exclusionPaths
        textContainer.lineFragmentPadding = superTextView.textContainer.lineFragmentPadding

        if superTextView.text.isEmpty {
            UIView.animate(withDuration: 0.1) {
                self.alpha = 1
            }
        } else {
            UIView.animate(withDuration: 0.1) {
                self.alpha = 0
            }
        }
    }

    override open func observeValue(forKeyPath keyPath: String?, of object: Any?, change: [NSKeyValueChangeKey : Any]?, context: UnsafeMutableRawPointer?) {
        update()
    }

    deinit {
        deregisterForNotifications(on: superTextView)
    }

}


extension UITextView {
    public var placeholderText: String? {
        get {
            return placeholderTextView.text
        }
        set {
            placeholderTextView.text = newValue
        }
    }

    public var attributedPlaceholderText: NSAttributedString? {
        get {
            return placeholderTextView.attributedText
        }
        set {
            placeholderTextView.attributedText = newValue
        }
    }

    public var placeholderColor: UIColor? {
        get {
            return placeholderTextView.textColor
        }
        set {
            placeholderTextView.textColor = newValue
        }
    }

    private var placeholderTextView: PlaceholderTextView {
        get {
            let textView: PlaceholderTextView? = getObject(for: &Key.textView)
            if let textView = textView {
                return textView
            } else {
                let placeholderTextView = PlaceholderTextView()
                placeholderTextView.superTextView = self

                setObject(placeholderTextView, for: &Key.textView)
                return placeholderTextView
            }
        }
    }
}
