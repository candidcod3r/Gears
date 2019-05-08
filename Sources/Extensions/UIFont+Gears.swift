//
//  UIFont+Gears.swift￼
//  Gears
//
//  Created by Candid Cod3r on 5/3/19.
//  Copyright (c) 2019 Candid Cod3r.
//

extension UIFont {
    public static let helveticaNeue = UIFont.make(with: "HelveticaNeue")
    public static let helveticaNeueLight = UIFont.make(with: "HelveticaNeue-Light")
    public static let helveticaNeueMedium = UIFont.make(with: "HelveticaNeue-Medium")
    public static let appleSDGothicNeoLight = UIFont.make(with: "AppleSDGothicNeo-Light")
    public static let appleSDGothicNeoRegular = UIFont.make(with: "AppleSDGothicNeo-Regular")
    public static let arialRoundedMTBold = UIFont.make(with: "ArialRoundedMTBold")
    public static let kailasa = UIFont.make(with: "Kailasa")

    public static func make(with name: String, size: CGFloat = UIFont.systemFontSize) -> UIFont {
        return UIFont(name: name, size: size) ?? UIFont.systemFont(ofSize: size)
    }
}


