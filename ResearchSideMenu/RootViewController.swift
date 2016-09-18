//
//  RootViewController.swift
//  ResearchSideMenu
//
//  Created by mothule on 2016/09/18.
//  Copyright © 2016年 mothule. All rights reserved.
//

import UIKit

class RootViewController: UIViewController {
    
    var contentViewContainer:UIView!
    var menuViewContainer:UIView!
    
    var contentViewController:UIViewController!
    var menuViewController:UIViewController!

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        print("RootViewController.init(coder)");
    }
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: NSBundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        print("RootViewController.init(nibName, bundle)");
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        print("RootViewController.awakeFromNib");
        
        contentViewContainer = UIView()
        menuViewContainer = UIView()
        
        self.view.addSubview(contentViewContainer)
        self.view.addSubview(menuViewContainer)
        
        self.menuViewController = self.storyboard?.instantiateViewControllerWithIdentifier("menu")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("RootViewController.viewDidLoad");
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        print("RootViewController.viewWillAppear\(animated))");
    }
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        print("RootViewController.viewDidAppear(\(animated))");
    }
    override func viewWillDisappear(animated: Bool) {
        super.viewWillDisappear(animated)
        print("RootViewController.viewWillDisappear(\(animated))");
    }
    override func viewDidDisappear(animated: Bool) {
        super.viewDidDisappear(animated)
        print("RootViewController.viewDidDisappear(\(animated))");
    }
    
    @IBAction func onTouchBootMenuButton(sender: UIButton) {
        print("RootViewController.onTouchBootMenuButton")
        self.addChildViewController(self.menuViewController)
        self.menuViewController.view.frame = self.view.bounds
        self.menuViewContainer.addSubview(self.menuViewController.view)
        self.menuViewController.didMoveToParentViewController(self)
        self.view.bringSubviewToFront(self.menuViewContainer)
    }
}

