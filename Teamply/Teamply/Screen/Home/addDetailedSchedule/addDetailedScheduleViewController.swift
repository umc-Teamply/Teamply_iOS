//
//  addDetailedScheduleViewController.swift
//  Teamply
//
//  Created by Lee Jinkyung on 2023/02/04.
//

import UIKit
import MaterialComponents

class addDetailedScheduleViewController: UIViewController {
  
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var headerView: UIView!
    @IBOutlet weak var scheduleTitleTextField: UITextField!
    @IBOutlet weak var periodTextField: UITextField!
    @IBOutlet weak var ToDoTextField: UITextField!
    @IBOutlet weak var participantButton: UIButton!
    @IBOutlet weak var participantLabel: UILabel!
    @IBOutlet weak var plusButton: UIButton!
    var projectColor: UIColor!
    
    private lazy var datePicker: DatePicker = {
        let picker = DatePicker()
        picker.setup()
        picker.didSelectDates = { [weak self] (startDate, endDate) in
            let text = Date.buildTimeRangeString(startDate: startDate, endDate: endDate)
            self?.periodTextField.text = text
        }
        return picker
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setaddDetailedScheduleStyle()
        periodTextField.inputView = datePicker.inputView

    }

    func setaddDetailedScheduleStyle(){
        headerView.backgroundColor = projectColor
        titleLabel.text = "일정 세부 보기"
        titleLabel.font = .head1
        titleLabel.textColor = .basic1
        
        scheduleTitleTextField.attributedPlaceholder = NSAttributedString(string: "일정 제목", attributes: [NSAttributedString.Key.foregroundColor: UIColor.gray2!, NSAttributedString.Key.font: UIFont.sub2])
        scheduleTitleTextField.keyboardType = .default
        scheduleTitleTextField.font = .sub2
        scheduleTitleTextField.textColor = .basic2
        
        periodTextField.attributedPlaceholder = NSAttributedString(string: "일정수행 기간", attributes: [NSAttributedString.Key.foregroundColor: UIColor.gray2!, NSAttributedString.Key.font: UIFont.sub2])
        periodTextField.keyboardType = .default
        periodTextField.font = .sub2
        periodTextField.textColor = .basic2
        
        ToDoTextField.attributedPlaceholder = NSAttributedString(string: "무엇을 하나요?", attributes: [NSAttributedString.Key.foregroundColor: UIColor.gray3!,NSAttributedString.Key.font: UIFont.body])
        ToDoTextField.addLeftPadding()
        
        participantLabel.text = "누가 하나요?"
        participantLabel.font = .body
        participantLabel.textColor = .gray3
        
        ToDoTextField.makeRound(radius: 10)
        participantButton.makeRound(radius: 10)
        plusButton.makeRound(radius: 10)
        
    }
    


    @IBAction func backButton(_ sender: Any) {
        self.presentingViewController?.dismiss(animated: true)
    }
    @IBAction func tappedParticipantButton(_ sender: Any) {
        let vc = storyboard?.instantiateViewController(withIdentifier: "selectParticipantVC") as! selectParticipantViewController
        let bottomSheet: MDCBottomSheetController = MDCBottomSheetController(contentViewController: vc)
        let shapeGenerator = MDCRectangleShapeGenerator()
        let cornerTreatment = MDCRoundedCornerTreatment(radius: 20)
        
        shapeGenerator.topLeftCorner = cornerTreatment
        shapeGenerator.topRightCorner = cornerTreatment
        
        bottomSheet.setShapeGenerator(shapeGenerator, for: .preferred)
        bottomSheet.setShapeGenerator(shapeGenerator, for: .extended)
        bottomSheet.setShapeGenerator(shapeGenerator, for: .closed)
        bottomSheet.mdc_bottomSheetPresentationController?.preferredSheetHeight = 275
        bottomSheet.scrimColor = UIColor.basic2!.withAlphaComponent(0.7)
        
        present(bottomSheet, animated: true, completion: nil)
        
        participantLabel.textColor = .clear
    }

    
}
//왼쪽 여ㅂ
extension UITextField {
    func addLeftPadding() {
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: 20, height: self.frame.height))
        self.leftView = paddingView
        self.leftViewMode = ViewMode.always
    }
}
