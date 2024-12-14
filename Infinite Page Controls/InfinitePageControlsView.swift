//
//  InfinitePageControlsView.swift
//  Infinite Page Controls
//
//  Created by Kartiken Barnwal on 14/12/24.
//

import UIKit

protocol InfinitPageControlsNavigate {
    func next()
    func prev()
}

public class InfinitePageControlsView: UIView {
    
//    override init(frame: CGRect) {
//        super.init(frame: frame)
//        setup()
//    }
    
    enum States {
        case first
        case middle
        case last
    }
    
    var circleSize: CGFloat
    var spacing: CGFloat
    var totalCircles: Int
    var visibleCircles: Int
    var smallCircleRatio: CGFloat
    
    var circles: [UIView] = []
    var currentIndex: Int = 0
    
    required init?(coder: NSCoder) {
        circleSize = 50
        spacing = 20
        totalCircles = 10
        visibleCircles = 4
        smallCircleRatio = 0.5
        
        super.init(coder: coder)
        setup()
    }

    func setup() {
        
        let totalWidth = circleSize * CGFloat(visibleCircles) + spacing * CGFloat(visibleCircles - 1)
        
        var xOffset = (bounds.width - totalWidth) / 2
        let yOffset = (bounds.height - circleSize) / 2
        
        for i in 0..<visibleCircles {
            let circle = prepareCircleView()
            circle.tag = i
            circle.frame = CGRect(x: xOffset, y: yOffset, width: circleSize, height: circleSize)
            addSubview(circle)
            circles.append(circle)
            
            xOffset += circleSize + spacing
        }
        
        update(state: .first, index: 0)
        
    }
    
    func update(state: States, index: Int) {
        switch state {
        case .first:
            
            circles[visibleCircles - 1].transform = CGAffineTransform(scaleX: smallCircleRatio, y: smallCircleRatio)
            highlightACircle(index)
            
        default:
            break
        }
    }
    
    public func prevCircle() {
        currentIndex -= 1
        update(state: .first, index: currentIndex)
    }
    
    public func nextCircle() {
        currentIndex += 1
        update(state: .first, index: currentIndex)
    }
    
    func highlightACircle(_ index: Int) {
        for i in 0..<visibleCircles {
            circles[i].backgroundColor = (i == index) ? .white : .systemPink
        }
    }
    
    func prepareCircleView() -> UIView {
        let circle = UIView()
        circle.backgroundColor = .systemPink
        circle.clipsToBounds = true
        circle.layer.cornerRadius = circleSize / 2
        
        return circle
    }

}
