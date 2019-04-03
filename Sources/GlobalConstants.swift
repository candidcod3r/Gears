//
//  GlobalConstants.swift
//  Gears
//
//  Created by Candid Cod3r on 4/2/19.
//  Copyright © 2019 Sparkles. All rights reserved.
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
