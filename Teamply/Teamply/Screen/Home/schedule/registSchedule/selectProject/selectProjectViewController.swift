//
//  selectProjectViewController.swift
//  Teamply
//
//  Created by 아라 on 2023/01/27.
//

import UIKit

class selectProjectViewController: UIViewController {
    // MARK: - IBOutlet
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var submitButton: UIButton!
    
    // MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        componentInit()
    }
    
    func componentInit() {
        titleLabel.text = "프로젝트 선택"
        titleLabel.font = .sub2
        titleLabel.textColor = .basic2
        
        submitButton.setTitle("선택 완료", for: .normal)
        submitButton.setTitleColor(.basic1, for: .normal)
        submitButton.titleLabel?.font = .btn
        submitButton.backgroundColor = .basic2
        submitButton.titleLabel?.tintColor = .basic1
        submitButton.makeRound(radius: 10)
    }
    
    // MARK: Method
    
    // MARK: IBAction
    
    // MARK: Gesture
    
}
