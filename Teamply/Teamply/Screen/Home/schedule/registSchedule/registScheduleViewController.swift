//
//  registScheduleViewController.swift
//  Teamply
//
//  Created by 아라 on 2023/01/26.
//

import UIKit
import MaterialComponents

class registScheduleViewController: UIViewController {
    // MARK: - IBOutlet
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var projectLabel: UILabel!
    @IBOutlet weak var typeLabel: UILabel!
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
    
    // MARK: Method
    func labelInit() {
        titleLabel.text = "일정추가"
        titleLabel.font = .head1
        titleLabel.textColor = .basic2
        
        projectLabel.text = "프로젝트 선택"
        projectLabel.font = .sub2
        projectLabel.textColor = .gray2
        projectLabel.isUserInteractionEnabled = true
        
        typeLabel.text = "일정 종류 선택"
        typeLabel.font = .sub2
        typeLabel.textColor = .gray2
        typeLabel.isUserInteractionEnabled = true
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
        timePicker.date = Date(timeIntervalSinceNow: interval!)
        timeField.font = .sub2
        timeField.textColor = .gray2
        configureDatePicker()
    }
    
    func contentFieldInit() {
        contentField.attributedPlaceholder = NSAttributedString(string: "내용을 입력하세요.", attributes: [NSAttributedString.Key.foregroundColor: UIColor.gray2!, NSAttributedString.Key.font: UIFont.body])
    }
    
    func configureDatePicker(){
        timePicker.preferredDatePickerStyle = .wheels
        timePicker.tintColor = .basic2
        timePicker.addTarget(self, action: #selector(datePickerValueDidChange(_:)), for: .valueChanged)
        
        timeField.inputView = timePicker
    }
    
    @objc private func datePickerValueDidChange(_ timePicker: UIDatePicker){
        timeField.font = .sub2
        timeField.textColor = .basic2
        timeField.text = timePicker.date.toString(format: "YYYY.MM.DD.E요일 / a HH:mm")
    }
    
    // MARK: - IBAction
    @IBAction func backToSchedule(_ sender: Any) {
        self.presentingViewController?.dismiss(animated: true)
    }
    
    @IBAction func submitButton(_ sender: Any) {
        self.view.window!.rootViewController?.dismiss(animated: true , completion: nil)
    }
    
    // MARK: - Gesture
    @IBAction func projectTap(_ sender: Any) {
        let nextVC = storyboard?.instantiateViewController(withIdentifier: "selectProjectVC") as! selectProjectViewController
        let bottomSheet: MDCBottomSheetController = MDCBottomSheetController(contentViewController: nextVC)
        let shapeGenerator = MDCRectangleShapeGenerator()
        let cornerTreatment = MDCRoundedCornerTreatment(radius: 20)
        
        shapeGenerator.topLeftCorner = cornerTreatment
        shapeGenerator.topRightCorner = cornerTreatment
        
        bottomSheet.setShapeGenerator(shapeGenerator, for: .preferred)
        bottomSheet.setShapeGenerator(shapeGenerator, for: .extended)
        bottomSheet.setShapeGenerator(shapeGenerator, for: .closed)
        bottomSheet.mdc_bottomSheetPresentationController?.preferredSheetHeight = 200
        bottomSheet.scrimColor = UIColor.basic2!.withAlphaComponent(0.7)
        
        nextVC.projectHandler = { name in
            self.projectLabel.text = name
            if name == "프로젝트 이름" {
                self.projectLabel.textColor = .gray2
            }
            else {
                self.projectLabel.textColor = .basic2
            }
        }
        nextVC.projectName = self.projectLabel.text!
        
        self.present(bottomSheet, animated: true, completion: nil)
    }
    
    @IBAction func scheduleTypeTap(_ sender: Any) {
        guard let nextVC = self.storyboard?.instantiateViewController(withIdentifier: "selectTypeVC") as? selectTypeViewController else { return }
        let bottomSheet: MDCBottomSheetController = MDCBottomSheetController(contentViewController: nextVC)
        
        let shapeGenerator = MDCRectangleShapeGenerator()
        let cornerTreatment = MDCRoundedCornerTreatment(radius: 15)
        
        shapeGenerator.topLeftCorner = cornerTreatment
        shapeGenerator.topRightCorner = cornerTreatment

        bottomSheet.setShapeGenerator(shapeGenerator, for: .preferred)
        bottomSheet.setShapeGenerator(shapeGenerator, for: .extended)
        bottomSheet.setShapeGenerator(shapeGenerator, for: .closed)
        bottomSheet.mdc_bottomSheetPresentationController?.preferredSheetHeight = 200
        bottomSheet.scrimColor = UIColor.basic2!.withAlphaComponent(0.7)
        
        bottomSheet.dismissOnDraggingDownSheet = false
        bottomSheet.dismissOnBackgroundTap = false
        
        nextVC.typeHandler = {type in
            self.typeLabel.text = type
            if type == "일정 종류 선택" {
                self.typeLabel.textColor = .gray2
            }
            else {
                self.typeLabel.textColor = .basic2
            }
        }
        
        nextVC.typeLabel = self.typeLabel.text
        
        self.present(bottomSheet, animated: true, completion: nil)
    }
}
