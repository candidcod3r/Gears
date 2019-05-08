//
//  FontName.swift￼
//  Gears
//
//  Created by Candid Cod3r on 5/3/19.
//  Copyright (c) 2019 Candid Cod3r.
//

public final class Font: UIFont {
    public static let helveticaNeue = Font.make(with: "HelveticaNeue")
    public static let helveticaNeueLight = Font.make(with: "HelveticaNeue-Light")
    public static let helveticaNeueMedium = Font.make(with: "HelveticaNeue-Medium")
    public static let appleSDGothicNeoLight = Font.make(with: "AppleSDGothicNeo-Light")
    public static let appleSDGothicNeoRegular = Font.make(with: "AppleSDGothicNeo-Regular")
    public static let arialRoundedMTBold = Font.make(with: "ArialRoundedMTBold")
    public static let kailasa = Font.make(with: "Kailasa")

    public static func make(with name: String, size: CGFloat = UIFont.systemFontSize) -> UIFont {
        return UIFont(name: name, size: size) ?? UIFont.systemFont(ofSize: size)
    }
}


