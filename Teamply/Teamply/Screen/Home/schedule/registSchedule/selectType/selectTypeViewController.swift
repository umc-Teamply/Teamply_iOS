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
    @IBOutlet weak var sessionLabel: UILabel!
    
    // MARK: - Properties
    var typeHandler: ((String) -> ())?
    var typeLabel: String?
    var todoFlag = false
    var scheduleFlag = false
    var deadlineFlag = false
    var sessionFalg = false
    
    // MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        componentInit()
        typeInit()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        if typeLabel == "할 일" {
            todoLabel.backgroundColor = .basic2
            todoFlag = true
            scheduleFlag = false
            deadlineFlag = false
            sessionFalg = false
        } else if typeLabel == "일정" {
            scheduleLabel.backgroundColor = .basic2
            todoFlag = false
            scheduleFlag = true
            deadlineFlag = false
            sessionFalg = false
        } else if typeLabel == "마감일" {
            deadlineLabel.backgroundColor = .basic2
            todoFlag = false
            scheduleFlag = false
            deadlineFlag = true
            sessionFalg = false
        } else if typeLabel == "회의" {
            sessionLabel.backgroundColor = .basic2
            todoFlag = false
            scheduleFlag = false
            deadlineFlag = false
            sessionFalg = true
        }
    }
    
    // MARK: Method
    func componentInit() {
        titleLabel.text = "일정 종류 선택"
        titleLabel.font = .sub2
        titleLabel.textColor = .basic2
        
        submitButton.setTitle("선택 완료", for: .normal)
        submitButton.setTitleColor(.basic1, for: .normal)
        submitButton.titleLabel!.font = .btn
        submitButton.backgroundColor = .basic2
        submitButton.makeRound(radius: 10)
    }

    func typeInit() {
        todoLabel.text = "할 일"
        todoLabel.font = .sub1
        todoLabel.textColor = .basic1
        todoLabel.makeRound(radius: 4.95)
        todoLabel.isUserInteractionEnabled = true
        todoLabel.backgroundColor = .gray2
        
        scheduleLabel.text = "일정"
        scheduleLabel.font = .sub1
        scheduleLabel.textColor = .basic1
        scheduleLabel.makeRound(radius: 4.95)
        scheduleLabel.isUserInteractionEnabled = true
        scheduleLabel.backgroundColor = .gray2
        
        deadlineLabel.text = "마감일"
        deadlineLabel.font = .sub1
        deadlineLabel.textColor = .basic1
        deadlineLabel.makeRound(radius: 4.95)
        deadlineLabel.isUserInteractionEnabled = true
        deadlineLabel.backgroundColor = .gray2
        
        sessionLabel.text = "회의"
        sessionLabel.font = .sub1
        sessionLabel.textColor = .basic1
        sessionLabel.makeRound(radius: 4.95)
        sessionLabel.isUserInteractionEnabled = true
        sessionLabel.backgroundColor = .gray2
    }
    
    
    // MARK: IBAction
    @IBAction func submitType(_ sender: Any) {
        typeHandler?(self.typeLabel!)
        self.presentingViewController?.dismiss(animated: true)
    }
    
    // MARK: - Gesture
    @IBAction func todoTap(_ sender: Any) {
        typeInit()
        if todoFlag {
            todoFlag = false
            typeLabel = "일정 종류 선택"
        }
        else {
            typeLabel = todoLabel.text!
            todoLabel.backgroundColor = .basic2
            todoFlag = true
            scheduleFlag = false
            deadlineFlag = false
            sessionFalg = false
        }
    }
    
    @IBAction func scheduleTap(_ sender: Any) {
        typeInit()
        if scheduleFlag {
            scheduleFlag = false
            typeLabel = "일정 종류 선택"
        }
        else {
            typeLabel = scheduleLabel.text!
            scheduleLabel.backgroundColor = .basic2
            todoFlag = false
            scheduleFlag = true
            deadlineFlag = false
            sessionFalg = false
        }
    }
    
    @IBAction func deadlineTap(_ sender: Any) {
        typeInit()
        if deadlineFlag {
            deadlineFlag = false
            typeLabel = "일정 종류 선택"
        }
        else {
            typeLabel = deadlineLabel.text!
            deadlineLabel.backgroundColor = .basic2
            todoFlag = false
            scheduleFlag = false
            deadlineFlag = true
            sessionFalg = false
        }
    }
    
    @IBAction func sessionTap(_ sender: Any) {
        typeInit()
        if sessionFalg {
            sessionFalg = false
            typeLabel = "일정 종류 선택"
        }
        else {
            typeLabel = sessionLabel.text!
            sessionLabel.backgroundColor = .basic2
            todoFlag = false
            scheduleFlag = false
            deadlineFlag = false
            sessionFalg = true
        }
    }
    
}
