//
//  ViewController.swift
//  AnimationDemo
//
//  Created by Dominik Huffield on 4/22/21.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var bubbles: [UIImageView]!
    
    
    var position = 0
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        for t in touches {
            startAnimation((Any).self)
        }
    }

    @IBAction func startAnimation(_ sender: Any) {
        
        UIView.animate(withDuration: 3.0, delay: 0, usingSpringWithDamping: 2, initialSpringVelocity: 0, options: [], animations: {
            
            for b in self.bubbles {
                b.center.x = CGFloat(Int.random(in: 0...414))
                b.center.y = CGFloat(Int.random(in: 0...896))
            }
            
        }, completion: nil)
        
        Timer.scheduledTimer(timeInterval: 3.0, target: self, selector: #selector(updateData), userInfo: nil, repeats: true)
    }
    
    @objc func updateData() {
            startAnimation((Any).self)
    }
}

