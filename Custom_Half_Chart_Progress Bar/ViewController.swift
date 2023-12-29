//
//  ViewController.swift
//  Custom_Half_Chart_Progress Bar
//
//  Created by Ümit Örs on 29.12.2023.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var circleChart: HalfCircleProgressView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        circleChart.setProgress(to: 1.0)
    }


}

