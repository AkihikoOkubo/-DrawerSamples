//
//  MainContentsViewController.swift
//  DrawerSamples
//
//  Created by Akihiko Okubo on 2019/01/28.
//  Copyright © 2019年 akihiko.com. All rights reserved.
//

import Foundation
import UIKit

protocol DrawerOpenDelegate: class {
    func openDrawer()
}

class MainContentsViewController: UIViewController {
    weak var delegate: DrawerOpenDelegate?
    
    @IBAction func showDrawer(_ sender: Any) {
        delegate?.openDrawer()
    }
    
    @IBAction func backAction(_ sender: Any) {
        self.dismiss(animated: true)
    }
    
}
