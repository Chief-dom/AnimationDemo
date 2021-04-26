//
//  AppVC.swift
//  AnimationDemo
//
//  Created by Dominik Huffield on 4/22/21.
//

import Foundation
import UIKit

class AppView: UIViewController {
    
    @IBOutlet var bubbles: [UIImageView]!
    var timer: Timer?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func startAnimation(_ sender: Any) {
        
        UIView.animate(withDuration: 10.0, delay: 0, usingSpringWithDamping: 0.1, initialSpringVelocity: 0.3, options: [], animations: {
            
            for b in self.bubbles {
                b.center.x = CGFloat(Int.random(in: max(Int(b.center.x) - 100, 0)...min(Int(b.center.x) + 100, 414)))
                b.center.y = CGFloat(Int.random(in: 0...896))
            }
            
        }, completion: nil)
        if timer == nil {
            timer = Timer.scheduledTimer(timeInterval: 9.5, target: self, selector: #selector(updateData), userInfo: nil, repeats: true)
        }
    }
    
    @objc func updateData() {
            startAnimation((Any).self)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
            if self.timer != nil {
                self.timer!.invalidate()
                self.timer = nil
            } else {
                startAnimation((Any).self)
            }
    }
    
}
