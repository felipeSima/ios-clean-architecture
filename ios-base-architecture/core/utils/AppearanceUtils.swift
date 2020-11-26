//
//  AppearanceUtils.swift
//  ios-base-architecture
//
//  Created by Felipe Silva Lima on 11/26/20.
//

import UIKit
import SkeletonView

struct AppearanceUtils {
    
    public static func GetLogoImage() -> UIImageView {
        let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 30, height: 30))
        imageView.contentMode = .scaleAspectFit
        imageView.image = UIImage(named: "logoView")?.scaledTo(size: imageView.frame.size)
        return imageView
    }
    
    public static func removeShadowFrom(navigationController:UINavigationController?){
        navigationController?.navigationBar.shadowImage = UIImage()
    }
    
    public static func SetupAppearanceGlobal(){
        ApplyAppearanceForUITabBar()
        ApplyAppearanceForUINavigationBar()
        ApplySkeletonAppearance()
    }
    
    public static func ApplyAppearanceForUINavigationBar(){
        UINavigationBar.appearance().tintColor = .yellow
        UINavigationBar.appearance().barStyle = .black
        
        let tileTextAttributes:[NSAttributedString.Key: NSObject] = [.foregroundColor: UIColor.white, .font: UIFont.defaultRegularFont(ofSize: 18)]
        let largeTitleTextAttributes:[NSAttributedString.Key: NSObject] = [.foregroundColor: UIColor.white, .font: UIFont.defaultBoldFont(ofSize: 25)]
        let buttonTextAttributes:[NSAttributedString.Key: NSObject] = [.foregroundColor: UIColor.yellow ,.font: UIFont.defaultRegularFont(ofSize: 17)]
        
        if #available(iOS 13.0, *) {
            let navBarAppearance = UINavigationBarAppearance()
            navBarAppearance.configureWithOpaqueBackground()
            navBarAppearance.titleTextAttributes = tileTextAttributes
            navBarAppearance.largeTitleTextAttributes = largeTitleTextAttributes
            navBarAppearance.backgroundColor = .background
            navBarAppearance.shadowColor = .clear
            
            let buttonAppearance = UIBarButtonItemAppearance()
            buttonAppearance.normal.titleTextAttributes = buttonTextAttributes
            navBarAppearance.buttonAppearance = buttonAppearance
            navBarAppearance.backButtonAppearance = buttonAppearance
            
            UINavigationBar.appearance().standardAppearance = navBarAppearance
            UINavigationBar.appearance().scrollEdgeAppearance = navBarAppearance
            
        }
        else{
            UINavigationBar.appearance().backgroundColor = .background
            UINavigationBar.appearance().barTintColor = .background
            UINavigationBar.appearance().isTranslucent = false
            UINavigationBar.appearance().titleTextAttributes = tileTextAttributes
            UINavigationBar.appearance().largeTitleTextAttributes = largeTitleTextAttributes
            UINavigationBar.appearance().shadowImage = UIImage()
            
            UIBarButtonItem.appearance().setTitleTextAttributes(buttonTextAttributes, for: .normal)
            UIBarButtonItem.appearance().setTitleTextAttributes(buttonTextAttributes, for: .highlighted)
        }
    }
    
    public static func ApplyAppearanceForUITabBar(){
        UITabBar.appearance().tintColor = .yellow
        
        let buttonTextAttributes:[NSAttributedString.Key: NSObject] = [.font: UIFont.defaultRegularFont(ofSize: 11)]
        UITabBarItem.appearance().setTitleTextAttributes(buttonTextAttributes, for: .normal)
    }
    
    public static func ApplySkeletonAppearance(){
        SkeletonAppearance.default.tintColor = UIColor.gray
        SkeletonAppearance.default.multilineHeight = 10
        SkeletonAppearance.default.multilineSpacing = 15
    }
}
