//
//  ViewController.swift
//  Infinite Page Controls
//
//  Created by Kartiken Barnwal on 14/12/24.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var pageControls: InfinitePageControlsView!
    @IBOutlet weak var indexLabel: UILabel!
    
    @IBAction func goPrev(_ sender: Any) {
        index -= 1
        if index < 0 { return }
        indexLabel.text = String(index)
        pageControls.prevCircle()
    }
    
    @IBAction func goNext(_ sender: Any) {
        index += 1
        if index >= totalIndices { return }
        indexLabel.text = String(index)
        pageControls.nextCircle()
    }
    
    var index: Int = 0
    let totalIndices: Int = 10
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        index = 0
        indexLabel.text = "0"
    }


}

