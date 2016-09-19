//
//  RootViewController.swift
//  ResearchSideMenu
//
//  Created by mothule on 2016/09/18.
//  Copyright © 2016年 mothule. All rights reserved.
//

import UIKit

class RootViewController: UIViewController {
    
//    var contentViewContainer:UIView!
//    var menuViewContainer:UIView!
    
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
        
        self.view.backgroundColor = UIColor.magentaColor()
        
        // コンテナ作成
//        let height = self.view.bounds.size.height
//        contentViewContainer = UIView(frame:CGRectMake(0,height/3,self.view.bounds.size.width, height/3))
//        menuViewContainer    = UIView(frame:CGRectMake(0,0,self.view.bounds.size.width, height/3))
//        contentViewContainer.backgroundColor = UIColor.blueColor()
//        menuViewContainer.backgroundColor = UIColor.brownColor()
        
//        // コンテナを子ビューとして追加
//        self.view.addSubview(contentViewContainer)
//        self.view.addSubview(menuViewContainer)
        
        // 各ViewControllerをロード
        self.menuViewController = self.storyboard?.instantiateViewControllerWithIdentifier("menu")
        self.contentViewController = self.storyboard?.instantiateViewControllerWithIdentifier("content")
        
        // メニューViewControllerを登録
        // 子ViewControllerとして追加.
        // ViewControllerのViewをコンテナに追加
        self.addChildViewController(self.menuViewController)
//        self.menuViewController.view.frame = menuViewContainer.frame
        self.view.addSubview(self.menuViewController.view)
        self.menuViewController.didMoveToParentViewController(self)
        
        // コンテンツViewControllerを登録
        // 子ViewControllerとして追加.
        // ViewControllerのViewをコンテナに追加
        self.addChildViewController(self.contentViewController)
        self.view.addSubview(self.contentViewController.view)
//        self.contentViewController.view.frame = CGRectMake(0, 0, contentViewContainer.frame.size.width, contentViewContainer.frame.size.height)
        self.contentViewController.didMoveToParentViewController(self)

        // メニューは非表示にする
        // コンテンツを前に出す
        self.menuViewController.view.hidden = true
        self.view.bringSubviewToFront(self.menuViewController.view)
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
}

extension UIViewController {
    func rootViewController() -> RootViewController? {
        var vc = self.parentViewController
        while(vc != nil){
            guard let viewController = vc else { return nil }
            if viewController is RootViewController {
                return viewController as? RootViewController
            }
            vc = viewController.parentViewController
        }
        return nil
    }
}

