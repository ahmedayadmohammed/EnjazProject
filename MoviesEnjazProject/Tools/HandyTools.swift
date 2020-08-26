//
//  HandyTools.swift
//  MoviesEnjazProject
//
//  Created by Ahmed Ayad on 8/25/20.
//  Copyright © 2020 ahmed ayad. All rights reserved.
//

import Foundation
import UIKit
import SnapKit
import paper_onboarding
import SwiftKeychainWrapper


class Tools {
    static let storyboard = UIStoryboard(name: "Main", bundle: Bundle.main)
    static func viewControllerTitleCenter(vc: UIViewController, title: String){
        let label = UILabel()
        label.frame = CGRect(x: 10, y: vc.view.frame.origin.y, width: vc.view.frame.width, height: 90)
        label.center.x = vc.view.center.x
        label.textAlignment = .center
        label.textColor = #colorLiteral(red: 0.6000000238, green: 0.6000000238, blue: 0.6000000238, alpha: 1)
        label.font = UIFont(name: MovieFonts.AvenirNextRegular.rawValue, size: 22)
        label.numberOfLines = 2
        label.text = title
        vc.view.addSubview(label)
        label.snp.makeConstraints { (make) in
            make.centerX.equalToSuperview()
            make.centerY.equalToSuperview().multipliedBy(0.9)
            make.width.equalTo(vc.view.frame.width)
        }
        
    }
    
    static func goToHomeVc(vc:UIViewController) {
        guard let homeTab = storyboard.instantiateViewController(withIdentifier: "TabBarHome") as? TabBarHome else {return}
        Timer.scheduledTimer(withTimeInterval: 1, repeats: false) { (nil) in
            homeTab.modalPresentationStyle = .fullScreen
            vc.present(homeTab, animated: true, completion: nil)
        }
        
    }
    
    
    static func goToSplashScreen(vc:UIViewController) {
        guard let homeTab = storyboard.instantiateViewController(withIdentifier: "SplashScreen") as? SplashScreen else {return}
        Timer.scheduledTimer(withTimeInterval: 1, repeats: false) { (nil) in
            homeTab.modalPresentationStyle = .fullScreen
            vc.present(homeTab, animated: true, completion: nil)
        }
        
    }
    
    
   static func getData(key:String, completionHandler: @escaping (_ data: String) -> ()){
        if let data = KeychainWrapper.standard.string(forKey: key) {
            completionHandler(data)
        } else {
            print("data not found")
            completionHandler("")
        }
    }
    
    static func setData(key:String, data:String){
        KeychainWrapper.standard.set(data, forKey: key)
    }
    
    static func removeData(key:String...){
        for keys in key {
            KeychainWrapper.standard.removeObject(forKey: keys)
            
        }
    }
    
    
    
    static let itemsEnglish = [
        OnboardingItemInfo(informationImage: UIImage(named: "EntroOne")!,
                           title: "Watch With family",
                           description: "Now with Enjaz Movie you can watch limitless movies and series just with one tap from your Iphone or ipad",
                           pageIcon: UIImage(named: "EntroOne")!,
                           color: #colorLiteral(red: 0.2137817144, green: 0.2774567902, blue: 0.3096762002, alpha: 1),
                           titleColor: #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1), descriptionColor: #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1), titleFont: UIFont(name: "Futura-Medium", size: 16) ?? UIFont.systemFont(ofSize: 16)  , descriptionFont: UIFont(name: "Avenir-Light", size: 16) ?? UIFont.systemFont(ofSize: 16)),
        OnboardingItemInfo(informationImage: UIImage(named: "EntroTwo")!,
                           title: "Thinking of movies ?",
                           description: "Don't think about what movie you want to watch tonight just open the application and start your selection",
                           pageIcon: UIImage(named: "EntroTwo")!,
                           color: #colorLiteral(red: 0.3999083042, green: 0.6186562777, blue: 0.4631912708, alpha: 1),
                           titleColor: #colorLiteral(red: 0.02842428535, green: 0.09785170108, blue: 0.2477530837, alpha: 1), descriptionColor: #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1), titleFont: UIFont(name: "Futura-Medium", size: 16) ?? UIFont.systemFont(ofSize: 16)  , descriptionFont:  UIFont(name: "Avenir-Light", size: 16) ?? UIFont.systemFont(ofSize: 16)),
        OnboardingItemInfo(informationImage: UIImage(named: "EntroThree")!,
                           title: "Find Someone",
                           description: "are you hestating to call you friends to watch with you some movies..? , just get them arround you to let them know about your new Movies and series application",
                           pageIcon: UIImage(named: "EntroThree")!,
                           color: #colorLiteral(red: 0.5486203432, green: 0.6952663064, blue: 0.997618258, alpha: 1),
                           titleColor: #colorLiteral(red: 0.03529411765, green: 0.09411764706, blue: 0.2117647059, alpha: 1), descriptionColor:#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1),titleFont: UIFont(name: "Futura-Medium", size: 16) ?? UIFont.systemFont(ofSize: 16)  , descriptionFont: UIFont(name: "Avenir-Light", size: 16) ?? UIFont.systemFont(ofSize: 16))
        
    ]
    
    
    static let itemsArabic = [
        OnboardingItemInfo(informationImage: UIImage(named: "EntroOne")!,
                           title: "مشاهدة مع العائلة",
                           description: "الآن مع Enjaz Movie يمكنك مشاهدة أفلام ومسلسلات لا حدود لها بنقرة واحدة من جهاز iPhone أو iPad",
                           pageIcon: UIImage(named: "EntroOne")!,
                           color: #colorLiteral(red: 0.2137817144, green: 0.2774567902, blue: 0.3096762002, alpha: 1),
                           titleColor: #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1), descriptionColor: #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1), titleFont: UIFont(name: "Futura-Medium", size: 16) ?? UIFont.systemFont(ofSize: 16)  , descriptionFont: UIFont(name: "Avenir-Light", size: 16) ?? UIFont.systemFont(ofSize: 16)),
        OnboardingItemInfo(informationImage: UIImage(named: "EntroTwo")!,
                           title: "هل تفكر في فلم معين",
                           description: "لا تفكر في الفيلم الذي تريد مشاهدته الليلة ، فقط افتح التطبيق وابدأ اختيارك",
                           pageIcon: UIImage(named: "EntroTwo")!,
                           color: #colorLiteral(red: 0.3999083042, green: 0.6186562777, blue: 0.4631912708, alpha: 1),
                           titleColor: #colorLiteral(red: 0.02842428535, green: 0.09785170108, blue: 0.2477530837, alpha: 1), descriptionColor: #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1), titleFont: UIFont(name: "Futura-Medium", size: 16) ?? UIFont.systemFont(ofSize: 16)  , descriptionFont:  UIFont(name: "Avenir-Light", size: 16) ?? UIFont.systemFont(ofSize: 16)),
        OnboardingItemInfo(informationImage: UIImage(named: "EntroThree")!,
                           title: "أبحث عن شخص للمشاهدة",
                           description: "هل تهاجرون لدعوتكم الأصدقاء لمشاهدة بعض الأفلام معكم ..؟ ، فقط اجعلهم يدور حولك لإعلامهم بتطبيق الأفلام والمسلسلات الجديد",
                           pageIcon: UIImage(named: "EntroThree")!,
                           color: #colorLiteral(red: 0.5486203432, green: 0.6952663064, blue: 0.997618258, alpha: 1),
                           titleColor: #colorLiteral(red: 0.03529411765, green: 0.09411764706, blue: 0.2117647059, alpha: 1), descriptionColor:#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1),titleFont: UIFont(name: "Futura-Medium", size: 16) ?? UIFont.systemFont(ofSize: 16)  , descriptionFont: UIFont(name: "Avenir-Light", size: 16) ?? UIFont.systemFont(ofSize: 16))
        
    ]
    
    
    
    
    
    
}


