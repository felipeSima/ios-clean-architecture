//
//  FontPallet.swift
//  ios-base-architecture
//
//  Created by Felipe Silva Lima on 11/18/20.
//

import UIKit

extension UIFont {
    
    //App default font
    public static func defaultRegularFont(ofSize size:CGFloat) -> UIFont {
        return UIFont.montserratRegular(ofSize: size)
    }
    public static func defaultBoldFont(ofSize size:CGFloat) -> UIFont {
        return UIFont.montserratBold(ofSize: size)
    }
    public static func defaultLightFont(ofSize size:CGFloat) -> UIFont {
        return UIFont.montserratLight(ofSize: size)
    }
    
    //Font default sizes
    public static var small:CGFloat = 12
    public static var smallmd:CGFloat = 14
    public static var medium:CGFloat = 16
    public static var mediumxs:CGFloat = 18
    public static var large:CGFloat = 20
    public static var extraLarge:CGFloat = 22
    
    enum FontType {
        case regular
        case bold
        case light
    }
    
    //Montserrat
    public static func montserratBlack(ofSize size:CGFloat) -> UIFont {
        return UIFont(name: "Montserrat-Black", size: size)!
    }
    public static func montserratBlackItalic(ofSize size:CGFloat) -> UIFont {
        return UIFont(name: "Montserrat-BlackItalic", size: size)!
    }
    public static func montserratBold(ofSize size:CGFloat) -> UIFont {
        return UIFont(name: "Montserrat-Bold", size: size)!
    }
    public static func montserratBoldItalic(ofSize size:CGFloat) -> UIFont {
        return UIFont(name: "Montserrat-BoldItalic", size: size)!
    }
    public static func montserratExtraBold(ofSize size:CGFloat) -> UIFont {
        return UIFont(name: "Montserrat-ExtraBold", size: size)!
    }
    public static func montserratExtraBoldItalic(ofSize size:CGFloat) -> UIFont {
        return UIFont(name: "Montserrat-ExtraBoldItalic", size: size)!
    }
    public static func montserratExtraLight(ofSize size:CGFloat) -> UIFont {
        return UIFont(name: "Montserrat-ExtraLight", size: size)!
    }
    public static func montserratItalic(ofSize size:CGFloat) -> UIFont {
        return UIFont(name: "Montserrat-Italic", size: size)!
    }
    public static func montserratLight(ofSize size:CGFloat) -> UIFont {
        return UIFont(name: "Montserrat-Light", size: size)!
    }
    public static func montserratLightItalic(ofSize size:CGFloat) -> UIFont {
        return UIFont(name: "Montserrat-LightItalic", size: size)!
    }
    public static func montserratMedium(ofSize size:CGFloat) -> UIFont {
        return UIFont(name: "Montserrat-Medium", size: size)!
    }
    public static func montserratMediumItalic(ofSize size:CGFloat) -> UIFont {
        return UIFont(name: "Montserrat-MediumItalic", size: size)!
    }
    public static func montserratRegular(ofSize size:CGFloat) -> UIFont {
        return UIFont(name: "Montserrat-Regular", size: size)!
    }
    public static func montserratSemiBold(ofSize size:CGFloat) -> UIFont {
        return UIFont(name: "Montserrat-SemiBold", size: size)!
    }
    public static func montserratSemiBoldItalic(ofSize size:CGFloat) -> UIFont {
        return UIFont(name: "Montserrat-SemiBoldItalic", size: size)!
    }
    public static func montserratThin(ofSize size:CGFloat) -> UIFont {
        return UIFont(name: "Montserrat-Thin", size: size)!
    }
    public static func montserratThinItalic(ofSize size:CGFloat) -> UIFont {
        return UIFont(name: "Montserrat-ThinItalic", size: size)!
    }
    
}

