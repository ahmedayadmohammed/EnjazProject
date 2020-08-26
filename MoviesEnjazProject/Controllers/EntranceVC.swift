//
//  EntranceVC.swift
//  MoviesEnjazProject
//
//  Created by Ahmed Ayad on 8/25/20.
//  Copyright © 2020 ahmed ayad. All rights reserved.
//


import UIKit
import paper_onboarding

class SplashScreen: UIViewController {
    
    @IBOutlet weak var enterButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        enterButton.isHidden = true
        setupPaperOnboardingView()
    
    }
    
 
    
    fileprivate let items = [
        OnboardingItemInfo(informationImage: UIImage(named: "EntroOne")!,
                           title: "Store",
                           description: "There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don’t look even slightly believable. If you are going to use a passage of Lorem Ipsum, you need to be sure there isn’t  non-characteristic words etc.",
                           pageIcon: UIImage(named: "EntroOne")!,
                           color: #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0),
                           titleColor: #colorLiteral(red: 0.4627665877, green: 0.5062865615, blue: 0.5219212174, alpha: 1), descriptionColor: #colorLiteral(red: 0.4627665877, green: 0.5062865615, blue: 0.5219212174, alpha: 1), titleFont: UIFont(name: "Futura-Medium", size: 16) ?? UIFont.systemFont(ofSize: 16)  , descriptionFont: UIFont(name: "Avenir-Light", size: 16) ?? UIFont.systemFont(ofSize: 16)),
        OnboardingItemInfo(informationImage: UIImage(named: "EntroTwo")!,
                           title: "Store",
                           description: "There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don’t look even slightly believable. If you are  Lorem Ipsum is therefore always free from repetition, injected humour, or non-characteristic words etc.",
                           pageIcon: UIImage(named: "EntroTwo")!,
                           color: #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0),
                           titleColor: #colorLiteral(red: 0.4627665877, green: 0.5062865615, blue: 0.5219212174, alpha: 1), descriptionColor: #colorLiteral(red: 0.4627665877, green: 0.5062865615, blue: 0.5219212174, alpha: 1), titleFont: UIFont(name: "Futura-Medium", size: 16) ?? UIFont.systemFont(ofSize: 16)  , descriptionFont:  UIFont(name: "Avenir-Light", size: 16) ?? UIFont.systemFont(ofSize: 16)),
        OnboardingItemInfo(informationImage: UIImage(named: "EntroThree")!,
                           title: "Store",
                           description: "There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don’t look even slightly believable. If you are  non-characteristic words etc.",
                           pageIcon: UIImage(named: "EntroThree")!,
                           color: #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0),
                           titleColor: #colorLiteral(red: 0.4627665877, green: 0.5062865615, blue: 0.5219212174, alpha: 1), descriptionColor:#colorLiteral(red: 0.4627665877, green: 0.5062865615, blue: 0.5219212174, alpha: 1),titleFont: UIFont(name: "Futura-Medium", size: 16) ?? UIFont.systemFont(ofSize: 16)  , descriptionFont: UIFont(name: "Avenir-Light", size: 16) ?? UIFont.systemFont(ofSize: 16))
        
    ]
    
    
    private func setupPaperOnboardingView() {
        let onboarding = PaperOnboarding()
        onboarding.delegate = self
        onboarding.dataSource = self
        onboarding.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(onboarding)
        view.addSubview(enterButton)
        
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
        return items[index]
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


extension SplashScreen {
    
 
}

// MARK: PaperOnboardingDelegate

extension SplashScreen: PaperOnboardingDelegate {
    func onboardingWillTransitonToIndex(_ index: Int) {
        enterButton.isHidden = index == 2 ? false : true
        
    }
    
    func onboardingConfigurationItem(_ item: OnboardingContentViewItem, index: Int) {
        
        // configure item
        //item.titleLabel?.backgroundColor = .redColor()
        //item.descriptionLabel?.backgroundColor = .redColor()
        //item.imageView = ...
    }
}
