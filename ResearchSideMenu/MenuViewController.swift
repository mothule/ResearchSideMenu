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

//        willMoveToParentViewController(nil)
//        view.removeFromSuperview()
//        removeFromParentViewController()
    }
    
    @IBAction func onTouchContentButton(sender: UIButton) {
        print("MenuViewController.onTouchSecondButton")
        
        guard let rootViewController = rootViewController() else {return }
        rootViewController.dismissMenuViewController()
        //        willMoveToParentViewController(nil)
        //        view.removeFromSuperview()
        //        removeFromParentViewController()
    }
    
    @IBAction func onTouchProfileButton(sender: UIButton) {
        print("MenuViewController.onTouchSecondButton")
        
        guard let rootViewController = rootViewController() else {return }
        rootViewController.dismissMenuViewController()
        
        // TODO: ProfileViewController を RootViewController.contentViewControllerにセットする.
        // 既存ViewControllerの開放処理後、ProfileViewControllerの登録処理を行う.
        
        //        willMoveToParentViewController(nil)
        //        view.removeFromSuperview()
        //        removeFromParentViewController()
    }

}

