//
//  DrawerViewController.swift
//  DrawerSamples
//
//  Created by Akihiko Okubo on 2019/01/28.
//  Copyright © 2019年 akihiko.com. All rights reserved.
//

import Foundation
import UIKit

protocol DrawerCloseDelegate: class {
    func closeDrawer()
}

class DrawerViewController: UIViewController {
    weak var delegate: DrawerCloseDelegate?
    
    @IBOutlet weak var overlay: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        overlay.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(closeDrawer)))
    }
    
    @objc func closeDrawer() {
        delegate?.closeDrawer()
    }
}
