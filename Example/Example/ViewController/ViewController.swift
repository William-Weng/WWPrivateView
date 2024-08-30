//
//  ViewController.swift
//  Example
//
//  Created by William.Weng on 2024/8/30.
//

import UIKit
import WWPrivateView

// MARK: - ViewController
final class ViewController: UIViewController {
    
    @IBOutlet weak var myImageView: UIImageView!
    @IBOutlet weak var myButton: UIButton!
    @IBOutlet weak var myLabel: UILabel!
    @IBOutlet weak var myPrivateView: WWPrivateView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        _ = myPrivateView.appendSubView(myButton)
        _ = myPrivateView.appendSubView(myLabel)
        _ = myPrivateView.appendSubView(myImageView)
    }
}
