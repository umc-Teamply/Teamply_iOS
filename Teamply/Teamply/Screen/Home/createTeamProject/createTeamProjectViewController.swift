//
//  createTeamProjectViewController.swift
//  Teamply
//
//  Created by 아라 on 2023/01/24.
//

import UIKit
import MaterialComponents

class createTeamProjectViewController: UIViewController {
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var okButton: UIButton!
    @IBOutlet weak var projectColorView: UIView!
    
    @IBOutlet weak var titleTextField: UITextField!
    @IBOutlet weak var headcountTextField: UITextField!
    @IBOutlet weak var dateTextField: UITextField!
    @IBOutlet weak var contentTextField: UITextField!
    @IBOutlet weak var contentFieldView: UIView!
    
    let datePicker = UIDatePicker()
    var startDate: Date?
    var paramColor = UIColor()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewInit()
        inputTitle()
        inputHeadcount()
        inputDate()
        inputContent()
    }
    
    func viewInit() {
        titleLabel.text = "팀프로젝트 만들기"
        titleLabel.font = .head2
        titleLabel.textColor = .basic2
        
        okButton.setTitle("확인", for: .normal)
        okButton.setTitleColor(.basic2, for: .normal)
        okButton.titleLabel?.font = .cap1
        
        projectColorView.layer.cornerRadius = projectColorView.layer.bounds.width/2
        projectColorView.clipsToBounds = true
        
        contentFieldView.makeRound(radius: 10)
    }
    
    func inputTitle() {
        titleTextField.attributedPlaceholder = NSAttributedString(string: "프로젝트 이름", attributes: [NSAttributedString.Key.foregroundColor: UIColor.gray2!, NSAttributedString.Key.font: UIFont.sub2])
        titleTextField.keyboardType = .default
        
        titleTextField.font = .sub2
        titleTextField.textColor = .basic2
    }
    
    func inputHeadcount() {
        headcountTextField.attributedPlaceholder = NSAttributedString(string: "프로젝트 참여 인원", attributes: [NSAttributedString.Key.foregroundColor: UIColor.gray2!, NSAttributedString.Key.font: UIFont.sub2])
        headcountTextField.keyboardType = .numberPad
        
        headcountTextField.font = .sub2
        headcountTextField.textColor = .basic2
    }
    
    func inputDate() {
        dateTextField.attributedPlaceholder = NSAttributedString(string: "프로젝트 기간", attributes: [NSAttributedString.Key.foregroundColor: UIColor.gray2!, NSAttributedString.Key.font: UIFont.sub2])
        configureDatePicker()
        
        dateTextField.font = .sub2
        dateTextField.textColor = .basic2
    }
    
    func inputContent() {
        contentTextField.attributedPlaceholder = NSAttributedString(string: "무엇을 하나요?", attributes: [NSAttributedString.Key.foregroundColor: UIColor.gray2!, NSAttributedString.Key.font: UIFont.sub2])
        
        contentTextField.font = .sub2
        contentTextField.textColor = .basic2
    }
    
    private func configureDatePicker(){
        self.datePicker.datePickerMode = .date
        self.datePicker.preferredDatePickerStyle = .wheels
        self.datePicker.addTarget(self, action: #selector(datePickerValueDidChange(_:)), for: .valueChanged)
        
        self.dateTextField.inputView = self.datePicker
    }
    
    @ objc private func datePickerValueDidChange(_ datePicker: UIDatePicker){
        let formmater = DateFormatter()
        formmater.dateFormat = "yyyy.MM.dd.E" //데이트 포멧형식 잡기
        formmater.locale = Locale(identifier: "ko_KR") // 한국어 표현
        self.startDate = datePicker.date
        self.dateTextField.text = formmater.string(from: datePicker.date)
    }
    
    
    @IBAction func backToHome(_ sender: Any) {
        self.presentingViewController?.dismiss(animated: true)
    }
    
    @IBAction func projectColorTap(_ sender: Any) {
        let vc = storyboard?.instantiateViewController(withIdentifier: "selectColorVC") as! selectProjectColorViewController
        let bottomSheet: MDCBottomSheetController = MDCBottomSheetController(contentViewController: vc)
        let shapeGenerator = MDCRectangleShapeGenerator()
        let cornerTreatment = MDCRoundedCornerTreatment(radius: 20)
        
        shapeGenerator.topLeftCorner = cornerTreatment
        shapeGenerator.topRightCorner = cornerTreatment

        bottomSheet.setShapeGenerator(shapeGenerator, for: .preferred)
        bottomSheet.setShapeGenerator(shapeGenerator, for: .extended)
        bottomSheet.setShapeGenerator(shapeGenerator, for: .closed)
        bottomSheet.mdc_bottomSheetPresentationController?.preferredSheetHeight = 200
        bottomSheet.scrimColor = UIColor.basic2!.withAlphaComponent(0.7)
        
        present(bottomSheet, animated: true, completion: nil)
    }
}
