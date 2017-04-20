//
//  IncrementView.swift
//  WinkWink
//
//  Created by trvslhlt on 4/19/17.
//  Copyright © 2017 travis holt. All rights reserved.
//

import UIKit

class IncrementView: AppView {

    private let increments: Int
    private let completeColor: UIColor
    private let incompleteColor: UIColor
    private let separation: CGFloat = 25
    private let radius: CGFloat = 8
    private var incrementLayers = [CALayer]()
    private var currentIncrement = 0
    
    init(increments: Int, completeColor: UIColor, incompleteColor: UIColor) {
        self.increments = increments
        self.completeColor = completeColor
        self.incompleteColor = incompleteColor
        super.init(frame: CGRect.zero)
        backgroundColor = UIColor.clear
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func set(increment: Int) {
        if increment < 0  {
            currentIncrement = 0
        }
        if increment > increments {
            currentIncrement = increments
        }
        currentIncrement = increment
        updateIncrementLayers()
    }
    
    func updateIncrementLayers() {
        incrementLayers.forEach { $0.removeFromSuperlayer() }
        incrementLayers.removeAll()
        
        let centers = incrementCenters()
        for (idx, center) in centers.enumerated() {
            let circlePath = UIBezierPath(
                arcCenter: CGPoint(x: center.x,y: center.y),
                radius: radius,
                startAngle: 0,
                endAngle:CGFloat(M_PI * 2),
                clockwise: true)
            
            let shapeLayer = CAShapeLayer()
            shapeLayer.path = circlePath.cgPath
            
            let fillColor: CGColor
            if idx < currentIncrement {
                fillColor = completeColor.cgColor
            } else if idx == currentIncrement {
                fillColor = UIColor.clear.cgColor
            } else {
                fillColor = incompleteColor.cgColor
            }
            
            let strokeColor = idx <= currentIncrement ? completeColor.cgColor : incompleteColor.cgColor
            shapeLayer.fillColor = fillColor
            shapeLayer.strokeColor = strokeColor
            shapeLayer.lineWidth = 3
            
            layer.addSublayer(shapeLayer)
            incrementLayers.append(shapeLayer)
        }

    }
    
    private func incrementCenters() -> [CGPoint] {
        let viewCenterX = bounds.midX
        let viewCenterY = bounds.midY
        var centerX = viewCenterX - ((CGFloat(increments - 1) / 2) * separation)
        var centers = [CGPoint]()
        for _ in 0..<increments {
            let center = CGPoint(x: centerX, y: viewCenterY)
            centers.append(center)
            centerX += separation
        }
        return centers
    }
    
    override func draw(_ rect: CGRect) {
        super.draw(rect)
        updateIncrementLayers()
    }
    
}
