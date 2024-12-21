//
//  ViewController.swift
//  Infinite Page Controls
//
//  Created by Kartiken Barnwal on 14/12/24.
//

import UIKit
import PageControls

class ViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {

    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var pageControlsView: PageControlsForYouView!
    @IBOutlet weak var pageControlsWrapper: UIView!
    
    var pageControls: PageControlsForYouView?
    
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
        
        setupPageControls()
        index = 0
    }
    
    func setupPageControls() {
        let config = PageControlsForYouConfig(circleSize: 20, spacing: 10, totalCircles: items.count, circleBackground: .gray, selectedCircleBackground: .black)

        pageControls?.translatesAutoresizingMaskIntoConstraints = false
        pageControls = PageControlsForYouView(frame: pageControlsWrapper.bounds, config: config)
        pageControlsWrapper.addSubview(pageControls!)
    }
    
    
    // M - 2
    /*
    pageControls = InfinitePageControlsView(config: config)
    pageControls?.translatesAutoresizingMaskIntoConstraints = false
    pageControlsView.addSubview(pageControls!)

    NSLayoutConstraint.activate([
        pageControls!.leadingAnchor.constraint(equalTo: pageControlsView.leadingAnchor),
        pageControls!.trailingAnchor.constraint(equalTo: pageControlsView.trailingAnchor),
        pageControls!.topAnchor.constraint(equalTo: pageControlsView.topAnchor),
        pageControls!.bottomAnchor.constraint(equalTo: pageControlsView.bottomAnchor)
    ])
     */
    
    func goPrev() {
        if index == 0 { return }
        index -= 1
        pageControls!.prevCircle()
    }
    
    func goNext() {
        if index == totalIndices - 1 { return }
        index += 1
        pageControls!.nextCircle()
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

