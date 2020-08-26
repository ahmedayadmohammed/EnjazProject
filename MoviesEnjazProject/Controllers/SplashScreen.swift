//
//  EntranceVC.swift
//  MoviesEnjazProject
//
//  Created by Ahmed Ayad on 8/25/20.
//  Copyright © 2020 ahmed ayad. All rights reserved.
//


import UIKit
import paper_onboarding
import SwiftKeychainWrapper
class SplashScreen: UIViewController {
    
    @IBOutlet weak var startButton: UIButton!
    
    var entered = "Entered"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupPaperOnboardingView()
        UIView.appearance().semanticContentAttribute = .forceLeftToRight
        
    }
    
    
    @IBAction func startButtonAction(_ sender: Any) {
        Tools.setData(key: "entered", data: entered)
        guard let homeTab = storyboard?.instantiateViewController(withIdentifier: "TabBarHome") as? TabBarHome else {return}
        homeTab.modalPresentationStyle = .fullScreen
        self.present(homeTab, animated: true, completion: nil)
    }
    
    
    private func setupPaperOnboardingView() {
        let onboarding = PaperOnboarding()
        onboarding.delegate = self
        onboarding.dataSource = self
        onboarding.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(onboarding)
        view.addSubview(startButton)
        
        // Add constraints
        for attribute: NSLayoutConstraint.Attribute in [.left, .right, .top, .bottom] {
            let constraint = NSLayoutConstraint(item: onboarding,
                                                attribute: attribute,
                                                relatedBy: .equal,
                                                toItem: view,
                                                attribute: attribute,
                                                multiplier: 1,
                                                constant: 0)
            view.addConstraint(constraint)
        }
    }
    
    
    
    
    
}
// MARK: PaperOnboardingDataSource

extension SplashScreen: PaperOnboardingDataSource {
    
    func onboardingItem(at index: Int) -> OnboardingItemInfo {
        if localize == "ar" {
            return Tools.itemsArabic[index]
        } else {
             return Tools.itemsEnglish[index]
        }
       
    }
    
    func onboardingItemsCount() -> Int {
        return 3
    }
    
    func onboardinPageItemRadius() -> CGFloat {
        return 2
    }
    
    func onboardingPageItemSelectedRadius() -> CGFloat {
        return 10
    }
    func onboardingPageItemColor(at index: Int) -> UIColor {
        return [UIColor.white, UIColor.red, UIColor.green][index]
    }
}

// MARK: PaperOnboardingDelegate

extension SplashScreen: PaperOnboardingDelegate {
    func onboardingWillTransitonToIndex(_ index: Int) {
        startButton.isHidden = index == 2 ? false : true
        
    }
}
