//
//  ViewController.swift
//  DioLibs
//
//  Created by Rodolfo Navarro on 17/08/21.
//

import UIKit
import Lottie

class ViewController: UIViewController {
    
    @IBOutlet weak var animationView: AnimationView!
    override func viewDidLoad() {
        super.viewDidLoad()

        animationView.loopMode = .loop
        animationView.play()
    }

}

