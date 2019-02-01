//
//  SlackStyleVIewController.swift
//  DrawerSamples
//
//  Created by Akihiko Okubo on 2019/01/28.
//  Copyright © 2019年 akihiko.com. All rights reserved.
//

import Foundation
import UIKit

class SlackRootViewController: UIViewController {
    
    @IBOutlet weak var drawerContainer: UIView!
    @IBOutlet weak var mainContainer: UIView!
    @IBOutlet weak var drawerLeading: NSLayoutConstraint!
    @IBOutlet weak var mainLeading: NSLayoutConstraint!
    
    var drawerContentWidth = CGFloat(0)
    var drawerOffset = CGFloat(50)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        drawerContentWidth = view.frame.width*0.8
        drawerLeading.constant = -drawerOffset
        mainLeading.constant = 0
        view.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(close)))
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toMain" {
            let vc = segue.destination as! MainContentsViewController
            vc.delegate = self
        }
    }
    
    @objc func close() {
        UIView.animate(withDuration: 0.2) {
            self.drawerLeading.constant = -self.drawerOffset
            self.mainLeading.constant = 0
            self.mainContainer.alpha = 1
            self.view.layoutIfNeeded()
        }
    }
    
    
}

extension SlackRootViewController: DrawerOpenDelegate {
    func openDrawer() {
        UIView.animate(withDuration: 0.2) {
            self.drawerLeading.constant = 0
            self.mainLeading.constant = self.drawerContentWidth
            self.view.layoutIfNeeded()
        }
    }
}
