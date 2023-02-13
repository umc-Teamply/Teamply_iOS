//
//  BoxViewController.swift
//  Teamply
//
//  Created by 아라 on 2023/01/11.
//

import UIKit

class BoxViewController: UIViewController {
    // MARK: - IBOutlet
    @IBOutlet weak var titleLabel: UILabel!
    
    // MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        titleLabelInit()
    }

    // MARK: - Method
    func titleLabelInit() {
        titleLabel.text = "팀플 보관함"
        titleLabel.textColor = .basic2
        titleLabel.font = .head1
    }
    // MARK: - IBAction
}
