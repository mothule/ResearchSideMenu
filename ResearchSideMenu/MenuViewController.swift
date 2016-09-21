//
//  MenuViewController.swift
//  ResearchSideMenu
//
//  Created by mothule on 2016/09/18.
//  Copyright © 2016年 mothule. All rights reserved.
//

import Foundation
import UIKit


class MenuViewController : UIViewController {
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        print("MenuViewController.init(coder)");
    }
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: NSBundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        print("MenuViewController.init(nibName, bundle)");
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        print("MenuViewController.awakeFromNib");
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("MenuViewController.viewDidLoad");
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        print("MenuViewController.viewWillAppear(\(animated))");
    }
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        print("MenuViewController.viewDidAppear(\(animated))");
    }
    override func viewWillDisappear(animated: Bool) {
        super.viewWillDisappear(animated)
        print("MenuViewController.viewWillDisappear(\(animated))");
    }
    override func viewDidDisappear(animated: Bool) {
        super.viewDidDisappear(animated)
        print("MenuViewController.viewDidDisappear(\(animated))");
    }

    @IBAction func onTouchCloseButton(sender: UIButton) {
        print("MenuViewController.onTouchSecondButton")

        guard let rootViewController = rootViewController() else {return }
        rootViewController.dismissMenuViewController()

    }
    
    @IBAction func onTouchContentButton(sender: UIButton) {
        print("MenuViewController.onTouchSecondButton")
        
        guard let rootViewController = rootViewController() else {return }
        rootViewController.dismissMenuViewController()
    }
    
    @IBAction func onTouchProfileButton(sender: UIButton) {
        print("MenuViewController.onTouchSecondButton")
        
        guard let rootViewController = rootViewController() else {return }
        rootViewController.dismissMenuViewController()
        
        //TODO: RootViewControllerにSetContentViewControllerメソッドを用意し、下記処理を抽出する.
        guard let contentViewController = rootViewController.contentViewController else {return }
        guard contentViewController.dynamicType != ProfileViewController.self else{return}
        
        contentViewController.willMoveToParentViewController(nil)
        contentViewController.view.removeFromSuperview()
        contentViewController.removeFromParentViewController()
        
        let profileViewController = self.storyboard!.instantiateViewControllerWithIdentifier("profile")
        rootViewController.contentViewController = profileViewController
        rootViewController.view.addSubview(profileViewController.view)
        rootViewController.view.bringSubviewToFront(rootViewController.menuViewController.view)
        rootViewController.addChildViewController(profileViewController)
        profileViewController.view.alpha = 0
        UIView.animateWithDuration(0.3, animations: {
            profileViewController.view.alpha = 1
        }, completion: { _ in
            profileViewController.didMoveToParentViewController(rootViewController)
        })
    }

}

