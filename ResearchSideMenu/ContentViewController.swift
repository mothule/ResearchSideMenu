//
//  ContentViewController.swift
//  ResearchSideMenu
//
//  Created by mothule on 2016/09/19.
//  Copyright © 2016年 mothule. All rights reserved.
//

import Foundation
import UIKit

class ContentViewController : UIViewController{
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        print("ContentViewController.init(coder)");
    }
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: NSBundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        print("ContentViewController.init(nibName, bundle)");
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        print("ContentViewController.awakeFromNib");
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("ContentViewController.viewDidLoad");
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        print("ContentViewController.viewWillAppear(\(animated))");
    }
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        print("ContentViewController.viewDidAppear(\(animated))");
    }
    override func viewWillDisappear(animated: Bool) {
        super.viewWillDisappear(animated)
        print("ContentViewController.viewWillDisappear(\(animated))");
    }
    override func viewDidDisappear(animated: Bool) {
        super.viewDidDisappear(animated)
        print("ContentViewController.viewDidDisappear(\(animated))");
    }
    
    //TODO: Close/Open処理 をRootViewControllerに委譲させる.
    @IBAction func onTouchBootMenuButton(sender: UIButton) {
        print("ContentViewController.onTouchBootMenuButton")
        
        guard let rootViewController = rootViewController() else { return }
        
        let menuViewController = rootViewController.menuViewController
        menuViewController.beginAppearanceTransition(true, animated: true)
        rootViewController.menuViewController.view.hidden = false
        rootViewController.menuViewController.view.frame = CGRectOffset(menuViewController.view.frame, -menuViewController.view.frame.size.width, 0)
        UIView.animateWithDuration(0.3, delay: 0, usingSpringWithDamping: 0.8, initialSpringVelocity: 0.3, options: UIViewAnimationOptions.CurveEaseOut, animations: {
            let bounds = menuViewController.view.bounds
            self.rootViewController()!.menuViewController.view.frame = CGRectMake(-bounds.size.width / 2, 0, bounds.size.width, bounds.size.height)
        }, completion: {_ in
            self.rootViewController()!.menuViewController.endAppearanceTransition()
        })
    }
    
    @IBAction func onTouchCloseMenuButton(sender: UIButton) {
        
        guard let rootViewController = rootViewController() else {return }
        
        let menuViewController = rootViewController.menuViewController
        menuViewController.beginAppearanceTransition(false, animated: true)
        UIView.animateWithDuration(0.3, delay: 0, options: .CurveEaseOut, animations: { 
            menuViewController.view.frame = CGRectOffset(menuViewController.view.frame, -menuViewController.view.bounds.size.width / 2, 0)
            }, completion: {_ in
                menuViewController.endAppearanceTransition()
            })
    }

}