//
//  TwitterRootViewController.swift
//  DrawerSamples
//
//  Created by Akihiko Okubo on 2019/01/28.
//  Copyright © 2019年 akihiko.com. All rights reserved.
//

import Foundation
import UIKit

class TwitterRootViewController: UIViewController {
    
    @IBOutlet weak var mainContainer: UIView!
    @IBOutlet weak var drawerConteiner: UIView!
    
    @IBOutlet weak var mainLeading: NSLayoutConstraint!
    @IBOutlet weak var drawerLeading: NSLayoutConstraint!
    
    var drawerContentWidth = CGFloat(0)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        drawerContentWidth = view.frame.width*0.8
        drawerLeading.constant = -view.frame.width
        mainLeading.constant = 0
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toDrawer" {
            let vc = segue.destination as! DrawerViewController
            vc.delegate = self
        }
        
        if segue.identifier == "toMain" {
            let vc = segue.destination as! MainContentsViewController
            vc.delegate = self
        }
    }
    
}

extension TwitterRootViewController: DrawerOpenDelegate {
    func openDrawer() {
        UIView.animate(withDuration: 0.2) {
            self.drawerLeading.constant = 0
            self.mainLeading.constant = self.drawerContentWidth
            self.mainContainer.alpha = 0.4
            self.view.layoutIfNeeded()
        }
    }
}

extension TwitterRootViewController: DrawerCloseDelegate {
    func closeDrawer() {
        UIView.animate(withDuration: 0.2) {
            self.drawerLeading.constant = -self.view.frame.width
            self.mainLeading.constant = 0
            self.mainContainer.alpha = 1
            self.view.layoutIfNeeded()
        }
    }
}
