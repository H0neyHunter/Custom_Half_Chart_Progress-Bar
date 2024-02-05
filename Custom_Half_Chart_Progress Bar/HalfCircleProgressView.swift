//
//  HalfCircleProgressViewi.swift
//  Custom_Half_Chart_Progress Bar
//
//  Created by Ümit Örs on 29.12.2023.
//

import UIKit

class HalfCircleProgressView: UIView {
    private let shapeLayer = CAShapeLayer()
    private let trackLayer = CAShapeLayer()
    private let progressLabel = UILabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupCircularPath()
        setupProgressLabel()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupCircularPath()
        //setupProgressLabel()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        trackLayer.path = createCircularPath().cgPath
        shapeLayer.path = createCircularPath().cgPath
        //progressLabel.frame = CGRect(x: bounds.midX - 50, y: bounds.midY - 15, width: 100, height: 30)
    }
    
    private func createCircularPath() -> UIBezierPath {
        let circularPath = UIBezierPath(arcCenter: CGPoint(x: bounds.midX, y: bounds.midY + 45),
         radius: min(bounds.width - 10, bounds.height - 10) - 20,
         startAngle: .pi,
         endAngle: 0,
         clockwise: true)
         
         return circularPath
    }
    
    private func setupCircularPath() {
        trackLayer.path = createCircularPath().cgPath
        trackLayer.strokeColor = UIColor.blue.cgColor
        trackLayer.fillColor = UIColor.clear.cgColor
        trackLayer.lineWidth = 16.0
        trackLayer.strokeEnd = 1
        trackLayer.lineCap = .round
        layer.addSublayer(trackLayer)
        
        shapeLayer.path = createCircularPath().cgPath
        shapeLayer.strokeColor = UIColor.lightGray.cgColor
        shapeLayer.fillColor = UIColor.clear.cgColor
        shapeLayer.lineWidth = 16.0
        shapeLayer.strokeEnd = 0
        shapeLayer.lineCap = .round
        
        layer.addSublayer(shapeLayer)
    }
    
    private func setupProgressLabel() {
        progressLabel.textAlignment = .center
        progressLabel.font = UIFont.systemFont(ofSize: 16.0)
        addSubview(progressLabel)
    }
    
    func setProgress(to value: Float) {
        let animation = CABasicAnimation(keyPath: "strokeEnd")
        animation.toValue = value
        animation.duration = 1.0
        animation.fillMode = .forwards
        animation.isRemovedOnCompletion = false
        shapeLayer.add(animation, forKey: "progressAnimation")
        
        //progressLabel.text = "\(Int(value * 100))%"
    }
}
