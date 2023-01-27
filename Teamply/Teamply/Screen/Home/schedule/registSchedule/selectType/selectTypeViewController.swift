//
//  selectTypeViewController.swift
//  Teamply
//
//  Created by 아라 on 2023/01/27.
//

import UIKit

class selectTypeViewController: UIViewController {
    // MARK: - IBOutlet
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var submitButton: UIButton!
    
    @IBOutlet weak var todoLabel: UILabel!
    @IBOutlet weak var scheduleLabel: UILabel!
    @IBOutlet weak var deadlineLabel: UILabel!
    
    // MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        componentInit()
    }
    
    func componentInit() {
        titleLabel.text = "일정 종류 선택"
        titleLabel.font = .sub2
        titleLabel.textColor = .basic2
        
        submitButton.setTitle("선택 완료", for: .normal)
        submitButton.setTitleColor(.basic1, for: .normal)
        submitButton.titleLabel!.font = .btn
        submitButton.titleLabel?.tintColor = .basic1
        submitButton.backgroundColor = .basic2
        submitButton.makeRound(radius: 10)
        
        todoLabel.text = "할 일"
        todoLabel.font = .sub1
        todoLabel.textColor = .basic1
        todoLabel.backgroundColor = .gray2
        todoLabel.makeRound(radius: 4.95)
        
        scheduleLabel.text = "일정"
        scheduleLabel.font = .sub1
        scheduleLabel.textColor = .basic1
        scheduleLabel.backgroundColor = .gray2
        scheduleLabel.makeRound(radius: 4.95)
        
        deadlineLabel.text = "마감일"
        deadlineLabel.font = .sub1
        deadlineLabel.textColor = .basic1
        deadlineLabel.backgroundColor = .gray2
        deadlineLabel.makeRound(radius: 4.95)
    }
    // MARK: Method
    
    // MARK: IBAction
}
