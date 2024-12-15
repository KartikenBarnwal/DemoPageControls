//
//  ViewController.swift
//  Infinite Page Controls
//
//  Created by Kartiken Barnwal on 14/12/24.
//

import UIKit

class ViewController: UIViewController {

//    @IBOutlet weak var pageControls: InfinitePageControlsView!
    @IBOutlet weak var pageControlsView: UIView!
    @IBOutlet weak var indexLabel: UILabel!
    var pageControls: InfinitePageControlsView?
    
    @IBAction func goPrev(_ sender: Any) {
        if index == 0 { return }
        index -= 1
        indexLabel.text = String(index)
        pageControls!.prevCircle()
    }
    
    @IBAction func goNext(_ sender: Any) {
        if index == totalIndices - 1 { return }
        index += 1
        indexLabel.text = String(index)
        pageControls!.nextCircle()
    }
    
    var index: Int = 0
    let totalIndices: Int = 10
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupPageControls()
        index = 0
        indexLabel.text = "0"
    }
    
    func setupPageControls() {
        let config = InfinitePageControlsConfig(
//                    circleSize: 40,
//                    spacing: 15,
//                    totalCircles: 10,
//                    visibleCircles: 4,
//                    smallCircleRatio: 0.6
                )

        pageControls?.translatesAutoresizingMaskIntoConstraints = false
        pageControls = InfinitePageControlsView(frame: pageControlsView.bounds, config: config)
        pageControlsView.addSubview(pageControls!)
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


}

