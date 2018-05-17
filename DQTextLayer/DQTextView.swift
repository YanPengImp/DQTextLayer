//
//  DQTextView.swift
//  DQTextLayer
//
//  Created by Imp on 2018/4/28.
//  Copyright © 2018年 jingbo. All rights reserved.
//

import UIKit
//import QuartzCore

class DQTextView: UIView {
    var textLayer: CATextLayer?
    var shapeLayer: CAShapeLayer?

    override init(frame: CGRect) {
        super.init(frame: frame)
        initViews()
        startAnimation()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }

    func initViews() {
        let backlayer = CALayer.init()
        backlayer.frame = self.bounds
        backlayer.backgroundColor = UIColor.green.cgColor
        self.layer.addSublayer(backlayer)
        textLayer = CATextLayer.init()
        textLayer!.string = "是我入戏太深，结局却一个人"
        textLayer!.fontSize = 20
        textLayer!.foregroundColor = UIColor.red.cgColor
        textLayer!.alignmentMode = kCAAlignmentJustified
        textLayer!.isWrapped = true
        textLayer!.frame = self.bounds
        backlayer.mask = textLayer
        shapeLayer = CAShapeLayer.init()
        shapeLayer!.frame = self.bounds
        shapeLayer!.strokeStart = 0
        shapeLayer!.strokeEnd = 1
        shapeLayer!.fillColor = UIColor.red.cgColor
        shapeLayer!.strokeColor = UIColor.red.cgColor
        shapeLayer!.path = layoutPath(shapeLayer!.strokeStart, shapeLayer!.strokeEnd)
        backlayer.addSublayer(shapeLayer!)
    }

    func layoutPath(_ strokeStart: CGFloat, _ strokeEnd: CGFloat) -> CGPath {
        return UIBezierPath.init(rect: CGRect.init(x: 0, y: 0, width: self.frame.size.width * strokeEnd, height: self.frame.size.height)).cgPath
    }

    func startAnimation() {
        let a = CABasicAnimation.init(keyPath: "path")
        a.duration = 7
        a.repeatCount = Float(INT_MAX)
        a.fromValue = layoutPath(0, 0)
        a.toValue = layoutPath(0, 1)
        shapeLayer?.add(a, forKey: "frame")
    }
}
