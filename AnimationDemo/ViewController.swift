//
//  ViewController.swift
//  AnimationDemo
//
//  Created by Dominik Huffield on 4/22/21.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var bubbles: [UIImageView]!
    var timer: Timer?
    
    var position = 0
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


    @IBAction func startAnimation(_ sender: Any) {
        
        UIView.animate(withDuration: 7.0, delay: 0, usingSpringWithDamping: 0.6, initialSpringVelocity: 0.1, options: [], animations: {
            
            for b in self.bubbles {
                b.center.x = CGFloat(Int.random(in: 0...414))
                b.center.y = CGFloat(Int.random(in: 0...896))
            }
            
        }, completion: nil)
        if timer == nil {
            timer = Timer.scheduledTimer(timeInterval: 3, target: self, selector: #selector(updateData), userInfo: nil, repeats: true)
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

