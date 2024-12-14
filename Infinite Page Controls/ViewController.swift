//
//  ViewController.swift
//  Infinite Page Controls
//
//  Created by Kartiken Barnwal on 14/12/24.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var pageControls: InfinitePageControlsView!
    
    @IBAction func goPrev(_ sender: Any) {
        index -= 1
        pageControls.prevCircle()
    }
    
    @IBAction func goNext(_ sender: Any) {
        index += 1
        pageControls.nextCircle()
    }
    
    var index: Int = 0
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        index = 0
    }


}

