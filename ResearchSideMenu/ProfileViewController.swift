//
//  ProfileViewController.swift
//  ResearchSideMenu
//
//  Created by mothule on 2016/09/19.
//  Copyright © 2016年 mothule. All rights reserved.
//

import Foundation
import UIKit

class ProfileViewController : UIViewController{
    @IBAction func onTouchBootMenuButton(_ sender: UIButton) {
        guard let rootViewController = rootViewController() else { return }
        rootViewController.presentMenuViewController()
    }
}
