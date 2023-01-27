//
//  registScheduleViewController.swift
//  Teamply
//
//  Created by 아라 on 2023/01/26.
//

import UIKit

class registScheduleViewController: UIViewController {
    // MARK: - IBOutlet
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var projectLabel: UILabel!
    @IBOutlet weak var scheduleLabel: UILabel!
    @IBOutlet weak var contentField: UITextField!
    @IBOutlet weak var timeField: UITextField!
    @IBOutlet weak var saveButton: UIButton!
    
    // MARK: - Properties
    let timePicker = UIDatePicker()
    var selectionDate: String?
    var interval: Double?
    
    // MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        labelInit()
        buttonInit()
        timePickerInit()
        contentFieldInit()
    }
    
    func labelInit() {
        titleLabel.text = "일정추가"
        titleLabel.font = .head1
        titleLabel.textColor = .basic2
        
        projectLabel.text = "프로젝트 선택"
        projectLabel.font = .sub2
        projectLabel.textColor = .gray2
        
        scheduleLabel.text = "일정 종류 선택"
        scheduleLabel.font = .sub2
        scheduleLabel.textColor = .gray2
    }
    func buttonInit() {
        saveButton.setTitle("저장", for: .normal)
        saveButton.setTitleColor(.gray2, for: .normal)
        saveButton.titleLabel?.font = .cap1
    }
    func timePickerInit() {
        if let date = selectionDate {
          timeField.text = date
            timeField.sizeToFit()
        }
        
        timeField.font = .sub2
        timeField.textColor = .gray2
        configureDatePicker()
        
        timeField.font = .sub2
        timeField.textColor = .basic2
    }
    
    func contentFieldInit() {
        contentField.attributedPlaceholder = NSAttributedString(string: "내용을 입력하세요.", attributes: [NSAttributedString.Key.foregroundColor: UIColor.gray2!, NSAttributedString.Key.font: UIFont.body])
    }
    
    func configureDatePicker(){
        timePicker.datePickerMode = .time
        timePicker.preferredDatePickerStyle = .wheels
        timePicker.tintColor = .basic2
        timePicker.addTarget(self, action: #selector(datePickerValueDidChange(_:)), for: .valueChanged)
        
        timeField.inputView = timePicker
    }
    
    @objc private func datePickerValueDidChange(_ timePicker: UIDatePicker){
        timeField.text = timePicker.date.toString(format: "YYYY.MM.DD.E요일 / a HH:mm")
    }
    
    // MARK: - IBAction
    @IBAction func backToSchedule(_ sender: Any) {
        self.presentingViewController?.dismiss(animated: true)
    }
}
