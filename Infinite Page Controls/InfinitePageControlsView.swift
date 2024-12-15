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
        print("State: \(state), Circle index: \(index)")
        
        switch state {
        case .first:
            
            adjustCirclesSize(smallIndices: [visibleCircles - 1])
            highlightACircle(index)
            
        case .middle:
            
            animateCircleBackwards(index)
//            adjustCirclesSize(smallIndices: [0, visibleCircles - 1])
//            highlightACircle(index)
            
        case .last:
            
            adjustCirclesSize(smallIndices: [0])
            highlightACircle(index)
            
        }
    }
    
    public func prevCircle() {
        currentIndex -= 1
        if currentIndex < 0 { return }
        updateHelper()
    }
    
    public func nextCircle() {
        currentIndex += 1
        if currentIndex >= totalCircles { return }
        updateHelper()
    }
    
    func updateHelper() {
        var newState: States
        
        if currentIndex <= visibleCircles - 2 {
            newState = .first
            update(state: newState, index: currentIndex)
        } else if currentIndex >= (totalCircles - visibleCircles + 1) {
            newState = .last
            let tmpIndex = (currentIndex - (totalCircles - visibleCircles))
            update(state: newState, index: tmpIndex)
        } else {
            newState = .middle
            update(state: newState, index: visibleCircles - 2)
        }
    }
    
    func animateCircleBackwards(_ index: Int) {
        circles[index].backgroundColor = .systemPink
        circles[index + 1].backgroundColor = .white

        // Shift all circles to the new positions
        UIView.animate(withDuration: 0.5, animations: {
            let translation = CGAffineTransform(translationX: -1 * (self.circleSize + self.spacing), y: 0)
            
            for i in 0..<self.visibleCircles {
                // TODO: handle for i==0 to scale it even smaller
                if i == -1 {
                    // applying edge animation for second circle to also get smaller while its translating to left
                    let scaling = CGAffineTransform(scaleX: self.smallCircleRatio, y: self.smallCircleRatio)
                    self.circles[i].transform = translation.concatenating(scaling)
                } else {
                    // for rest of the circles
                    self.circles[i].transform = translation
                }
            }
            
        }) { _ in
            // Reset transformations
            for circle in self.circles {
                circle.transform = .identity
            }
            
            self.circles[index].backgroundColor = .white
            self.circles[index + 1].backgroundColor = .systemPink
            
            self.adjustCirclesSize(smallIndices: [0, self.visibleCircles - 1])
            
        }
    }
    
    func adjustCirclesSize(smallIndices: [Int]) {
        for i in 0..<visibleCircles {
            if smallIndices.contains(i) {
                circles[i].transform = CGAffineTransform(scaleX: smallCircleRatio, y: smallCircleRatio)
            } else {
                circles[i].transform = CGAffineTransform(scaleX: 1, y: 1)
            }
        }
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
