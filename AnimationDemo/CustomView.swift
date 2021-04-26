//
//  CustomView.swift
//  AnimationDemo
//
//  Created by Dominik Huffield on 4/22/21.
//

import Foundation
import UIKit

class CustomView: UIView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) ha not been implemented")
    }
    
    override func draw(_ rect: CGRect) {
        if let context = UIGraphicsGetCurrentContext() {
            
            context.setLineWidth(5.0)
            UIColor.red.set()
            
            let cent = CGPoint(x: frame.size.width/2, y: frame.size.height/2)
            let redius = (frame.size.width - 10)/2
            
            context.addArc(center: cent, radius: redius, startAngle: 0.0, endAngle: .pi * 2.0, clockwise: true)
          
            context.strokePath()
        }
    }
}
