//
//  CircularProgressView.swift
//  Exercise8_Design
//
//  Created by Karina Kovaleva on 22.07.23.
//

import UIKit

class CircularProgressView: UIView {
    
    private var progress: Double = 0
    
    private var progressLine = CAShapeLayer()
    private var containerLine = CAShapeLayer()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.createCircularPath()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func createCircularPath() {
        let circularPath = UIBezierPath(arcCenter: CGPoint(x: self.frame.size.width / 2,
                                                           y: self.frame.size.height / 2),
                                        radius: 80,
                                        startAngle: -.pi / 2,
                                        endAngle: 3 * .pi / 2,
                                        clockwise: true)
        
        self.containerLine.path = circularPath.cgPath
        self.containerLine.fillColor = UIColor.clear.cgColor
        self.containerLine.lineCap = .round
        self.containerLine.lineWidth = 10.0
        self.containerLine.strokeColor = UIColor(red: 41/255, green: 119/255, blue: 125/255, alpha: 1.0).cgColor
        
        self.progressLine.path = circularPath.cgPath
        self.progressLine.fillColor = UIColor.clear.cgColor
        self.progressLine.lineCap = .round
        self.progressLine.lineWidth = 20.0
        self.progressLine.strokeEnd = 0
        self.progressLine.strokeColor = UIColor(red: 137/255, green: 183/255, blue: 185/255, alpha: 1.0).cgColor
        
        self.layer.addSublayer(self.containerLine)
        self.layer.addSublayer(self.progressLine)
    }
    
    public func progressAnimation() {
        let circularProgressAnimation = CABasicAnimation(keyPath: "strokeEnd")
        circularProgressAnimation.duration = 1
        progress = .random(in: 0...100) / 100
        circularProgressAnimation.toValue = progress
        circularProgressAnimation.fillMode = .forwards
        circularProgressAnimation.isRemovedOnCompletion = false
        self.progressLine.add(circularProgressAnimation, forKey: "progressAnimation")
    }
    
    public func getProgressValue() -> Int {
        Int((self.progress * 100).rounded())
    }
}
