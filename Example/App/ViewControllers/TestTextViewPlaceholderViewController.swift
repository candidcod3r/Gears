//
//  TestTextViewPlaceholderViewController.swift
//  Gears
//
//  Created by candidcod3r on 04/02/2019.
//  Copyright (c) 2019 candidcod3r. All rights reserved.
//

import UIKit
import Gears

class TestTextViewPlaceholderViewController: UIViewController {
    var textView: UITextView = {
        let textView = UITextView()
        textView.textColor = .black
        textView.font = UIFont.arialRoundedMTBold.withSize(17)
        textView.setBorders()
        textView.backgroundColor = UIColor(0xF7F7F7)
        return textView
    }()

    var textView2: UITextView = {
        let textView = UITextView()
        textView.textColor = .black
        textView.font = UIFont.arialRoundedMTBold.withSize(17)
        textView.setBorders()
        textView.backgroundColor = UIColor(0xF7F7F7)
        return textView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        view.handleTap { [weak self] (_) in
            self?.textView.resignFirstResponder()
            self?.textView2.resignFirstResponder()
        }

        view.backgroundColor = .white

        view.addSubview(textView)
        view.addSubview(textView2)

        if #available(iOS 11.0, *) {
            textView.frame = CGRect(x: 8, y: view.safeAreaInsets.top + 16, width: view.bounds.width - 16, height: 200)
            textView2.frame = CGRect(x: textView.frame.left, y: textView.bottom + 16, width: textView.frame.width, height: textView.frame.height)
        } else {
            textView.frame = CGRect(x: 8, y: 16, width: view.bounds.width - 16, height: 200)
            textView2.frame = CGRect(x: textView.frame.left, y: textView.bottom + 16, width: textView.frame.width, height: textView.frame.height)
        }

        textView.placeholderText = "Write text here..."
        textView2.attributedPlaceholderText = NSAttributedString(string: "Write text here...")
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)

        DispatchQueue.main.asyncAfter(deadline: .now() + .seconds(5)) {
            self.textView2.removeFromSuperview()
            self.textView2 = UITextView()

            self.textView.placeholderColor = UIColor(0x268BD2)
        }
    }


}

