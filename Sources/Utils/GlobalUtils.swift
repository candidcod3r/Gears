//
//  Global.swift
//  Gears
//
//  Created by Candid Cod3r on 5/3/19.
//  Copyright (c) 2019 Candid Cod3r.
//

import Foundation
import UIKit

public let PHONE = (UI_USER_INTERFACE_IDIOM() == .phone)
public let PAD = (UI_USER_INTERFACE_IDIOM() == .pad)
public let CAMERA_AVAILABLE = UIImagePickerController.isSourceTypeAvailable(.camera)
public let MAIN_SCALE = UIScreen.main.scale

public var SCREEN_SIZE: CGSize {
    return UIScreen.main.bounds.size
}

public var STATUSBAR_FRAME: CGRect {
    return UIApplication.shared.statusBarFrame
}

public var CURRENT_TIME: TimeInterval {
    return NSDate().timeIntervalSince1970
}

public func Localized(_ key: String, _ comment: String = "", _ args: CVarArg...) -> String {
    return String(format: NSLocalizedString(key, comment: comment), args)
}

public func Font(name: FontName, size: CGFloat) -> UIFont {
    if let font = UIFont(name: name.rawValue, size: size) {
        return font
    } else {
        return UIFont.systemFont(ofSize: size)
    }
}
