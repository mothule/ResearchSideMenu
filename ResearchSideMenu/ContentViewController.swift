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
    @IBAction func onTouchBootMenuButton(sender: UIButton) {
        guard let rootViewController = rootViewController() else { return }
        rootViewController.presentMenuViewController()
    }
    
    @IBAction func onTouchCloseMenuButton(sender: UIButton) {
        guard let rootViewController = rootViewController() else {return }
        rootViewController.dismissMenuViewController()
    }
}
