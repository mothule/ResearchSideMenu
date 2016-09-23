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
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
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
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        print("ContentViewController.viewWillAppear(\(animated))");
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        print("ContentViewController.viewDidAppear(\(animated))");
    }
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        print("ContentViewController.viewWillDisappear(\(animated))");
    }
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        print("ContentViewController.viewDidDisappear(\(animated))");
    }
    

    @IBAction func onTouchBootMenuButton(sender: UIButton) {
        print("ContentViewController.onTouchBootMenuButton")
        guard let rootViewController = rootViewController() else { return }
        rootViewController.presentMenuViewController()
    }
    
    @IBAction func onTouchCloseMenuButton(sender: UIButton) {
        print("ContentViewController.onTouchCloseMenuButton")
        guard let rootViewController = rootViewController() else {return }
        rootViewController.dismissMenuViewController()
    }

}
