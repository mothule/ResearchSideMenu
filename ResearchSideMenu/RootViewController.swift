//
//  RootViewController.swift
//  ResearchSideMenu
//
//  Created by mothule on 2016/09/18.
//  Copyright © 2016年 mothule. All rights reserved.
//

import UIKit

class RootViewController: UIViewController {
    
    var contentViewController:UIViewController!
    var menuViewController:UIViewController!

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        print("RootViewController.init(coder)");
    }
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        print("RootViewController.init(nibName, bundle)");
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        print("RootViewController.awakeFromNib");
        
        // 各ViewControllerをロード
        self.menuViewController = self.storyboard?.instantiateViewController(withIdentifier: "menu")
        self.contentViewController = self.storyboard?.instantiateViewController(withIdentifier: "content")
        
        // メニューViewControllerを登録
        // 子ViewControllerとして追加.
        // ViewControllerのViewをコンテナに追加
        self.addChildViewController(self.menuViewController)
        self.view.addSubview(self.menuViewController.view)
        self.menuViewController.didMove(toParentViewController: self)
        
        // コンテンツViewControllerを登録
        // 子ViewControllerとして追加.
        // ViewControllerのViewをコンテナに追加
        self.addChildViewController(self.contentViewController)
        self.view.addSubview(self.contentViewController.view)
        self.contentViewController.didMove(toParentViewController: self)

        // メニューは非表示にする
        // コンテンツを前に出す
        self.menuViewController.view.isHidden = true
        self.view.bringSubview(toFront: self.menuViewController.view)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("RootViewController.viewDidLoad");
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        print("RootViewController.viewWillAppear\(animated))");
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        print("RootViewController.viewDidAppear(\(animated))");
    }
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        print("RootViewController.viewWillDisappear(\(animated))");
    }
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        print("RootViewController.viewDidDisappear(\(animated))");
    }
    
    // メニューViewControllerの表示
    func presentMenuViewController(){
        menuViewController.beginAppearanceTransition(true, animated: true)
        self.menuViewController.view.isHidden = false
        self.menuViewController.view.frame = menuViewController.view.frame.offsetBy(dx: -menuViewController.view.frame.size.width, dy: 0)
        UIView.animate(withDuration: 0.3, delay: 0, usingSpringWithDamping: 0.8, initialSpringVelocity: 0.3, options: UIViewAnimationOptions.curveEaseOut, animations: {
            let bounds = self.menuViewController.view.bounds
            self.menuViewController.view.frame = CGRect(x:-bounds.size.width / 2, y:0, width:bounds.size.width, height:bounds.size.height)
        }, completion: {_ in
            self.menuViewController.endAppearanceTransition()
        })
    }
    
    // メニューViewControllerの非表示
    func dismissMenuViewController(){

        self.menuViewController.beginAppearanceTransition(false, animated: true)
        UIView.animate(withDuration: 0.3, delay: 0, options: .curveEaseOut, animations: {
            self.menuViewController.view.frame = self.menuViewController.view.frame.offsetBy(dx: -self.menuViewController.view.bounds.size.width / 2, dy: 0)
        }, completion: {_ in
            self.menuViewController.view.isHidden = true
            self.menuViewController.endAppearanceTransition()
        })
    }
}

extension UIViewController {
    func rootViewController() -> RootViewController? {
        var vc = self.parent
        while(vc != nil){
            guard let viewController = vc else { return nil }
            if viewController is RootViewController {
                return viewController as? RootViewController
            }
            vc = viewController.parent
        }
        return nil
    }
}

