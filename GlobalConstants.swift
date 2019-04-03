//
//  GlobalConstants.swift
//  Gears
//
//  Created by Candid Cod3r on 4/2/19.
//  Copyright © 2019 Sparkles. All rights reserved.
//

import Foundation
import UIKit

internal let PHONE = (UI_USER_INTERFACE_IDIOM() == .phone)
internal let PAD = (UI_USER_INTERFACE_IDIOM() == .pad)

internal let CAMERA_AVAILABLE = UIImagePickerController.isSourceTypeAvailable(.camera)

internal var SCREEN_SIZE: CGSize {
    return UIScreen.main.bounds.size
}

internal var MAIN_SCALE: CGFloat {
    return UIScreen.main.scale
}

internal var STATUSBAR_FRAME: CGRect {
    return UIApplication.shared.statusBarFrame
}

internal var CURRENT_TIME: TimeInterval {
    return NSDate().timeIntervalSince1970
}
