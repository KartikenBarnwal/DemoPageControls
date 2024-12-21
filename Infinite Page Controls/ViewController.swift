//
//  ViewController.swift
//  Infinite Page Controls
//
//  Created by Kartiken Barnwal on 14/12/24.
//

import UIKit
import PageControlsForYou

class ViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {

    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var pageControlsView: PageControlsForYou!
    @IBOutlet weak var pageControlsWrapper: UIView!
    
    var pageControls: PageControlsForYou?
    
    var index: Int = 0
    let totalIndices: Int = 10
    let items = [1,2,3,4,5,6,7,8,9,10]
    var currentOffsetX: CGFloat = 0
    var previousContentOffsetX: CGFloat = 0
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(CustomCollectionViewCell.self, forCellWithReuseIdentifier: "cell")
        
        setupPageControlsProgrammatically()
        setupPageControlsFromStoryboard()
        index = 0
    }
    
    func setupPageControlsProgrammatically() {
        let config = PageControlsForYouConfig(circleSize: 20, spacing: 10, totalCircles: items.count, circleBackground: .gray, selectedCircleBackground: .black)

        pageControls?.translatesAutoresizingMaskIntoConstraints = false
        pageControls = PageControlsForYou(frame: pageControlsWrapper.bounds, config: config)
        pageControlsWrapper.addSubview(pageControls!)
    }
    
    func setupPageControlsFromStoryboard() {
        let config = PageControlsForYouConfig(circleSize: 20, spacing: 10, totalCircles: items.count, circleBackground: .gray, selectedCircleBackground: .black)
        
        pageControlsView.configure(with: config)
    }
    
    func goPrev() {
        if index == 0 { return }
        index -= 1
        
        // programmatic instance
        pageControls!.prevCircle()
        
        // storyboard instance
        pageControlsView.toCircle(index: index)
    }
    
    func goNext() {
        if index == totalIndices - 1 { return }
        index += 1
        
        // programmatic instance
        pageControls!.nextCircle()
        
        // storyboard instance
        pageControlsView.toCircle(index: index)
    }
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return items.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! CustomCollectionViewCell
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width, height: collectionView.frame.height)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    // Track movement when scrolling ends
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        let currentOffsetX = scrollView.contentOffset.x
        
        if currentOffsetX > previousContentOffsetX {
            print("Moved forward")
            goNext()
        } else if currentOffsetX < previousContentOffsetX {
            print("Moved backward")
            goPrev()
        } else {
            print("No movement")
        }
        
        previousContentOffsetX = currentOffsetX
    }

}

