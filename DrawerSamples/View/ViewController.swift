//
//  ViewController.swift
//  DrawerSamples
//
//  Created by Akihiko Okubo on 2019/01/28.
//  Copyright © 2019年 akihiko.com. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var launchOverlay: UIView!
    @IBOutlet weak var launchImage: UIImageView!

    override func viewDidLoad() {
        super.viewDidLoad()
        launchImage.image = UIImage(named: "tw_launch")
    }
    
    override func viewDidAppear(_ animated: Bool) {
        
        //
        UIView.animate(withDuration: 0.2, delay: 1, options: [.curveLinear], animations: {
            self.launchOverlay.transform = CGAffineTransform(scaleX: 0.85, y: 0.85)
            self.view.layoutIfNeeded()
        }, completion: { _ in
            self.launchOverlay.backgroundColor = UIColor.clear

            UIView.animate(withDuration: 0.1, delay: 0, options: [.curveLinear], animations: {
                self.launchOverlay.transform = CGAffineTransform(scaleX: 60, y: 60)
                self.view.layoutIfNeeded()
            }, completion: { _ in
                self.launchOverlay.isHidden = true
            })
        })
    }

    @IBAction func showTwitterStyle(_ sender: Any) {
        performSegue(withIdentifier: "toTwitter", sender: nil)
    }
    
    @IBAction func showGoogleStyle(_ sender: Any) {
        performSegue(withIdentifier: "toGoogle", sender: nil)
    }
    
    @IBAction func showSlackStyle(_ sender: Any) {
        performSegue(withIdentifier: "toSlack", sender: nil)
    }
    
    
}

