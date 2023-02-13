//
//  createTeamProjectViewController.swift
//  Teamply
//
//  Created by 아라 on 2023/01/24.
//

import UIKit
import MaterialComponents

class createTeamProjectViewController: UIViewController, UITextFieldDelegate {
    
    // MARK: - IBOutlet
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var okButton: UIButton!
    @IBOutlet weak var projectColorView: UIView!
    
    @IBOutlet weak var titleTextField: UITextField!
    @IBOutlet weak var headcountTextField: UITextField!
    @IBOutlet weak var dateTextField: UITextField!
    @IBOutlet weak var contentTextField: UITextField!
    @IBOutlet weak var contentFieldView: UIView!
    
    // MARK: - Properties
    private lazy var datePicker: DatePicker = {
        let picker = DatePicker()
        picker.setup()
        picker.didSelectDates = { [weak self] (startDate, endDate) in
            let text = Date.buildTimeRangeString(startDate: startDate, endDate: endDate)
            self?.dateTextField.text = text
        }
        return picker
    }()
    var paramColor: UIColor?
    
    // MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        viewInit()
        textFieldInit()
        self.contentTextField.delegate = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        if let color = paramColor {
            projectColorView.backgroundColor = color
        }
    }
    
    // MARK: - Method
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
    
    func textFieldInit() {
        titleTextField.attributedPlaceholder = NSAttributedString(string: "프로젝트 이름", attributes: [NSAttributedString.Key.foregroundColor: UIColor.gray2!, NSAttributedString.Key.font: UIFont.sub2])
        titleTextField.keyboardType = .default
        titleTextField.font = .sub2
        titleTextField.textColor = .basic2
        
        headcountTextField.attributedPlaceholder = NSAttributedString(string: "프로젝트 참여 인원", attributes: [NSAttributedString.Key.foregroundColor: UIColor.gray2!, NSAttributedString.Key.font: UIFont.sub2])
        headcountTextField.keyboardType = .numberPad
        headcountTextField.font = .sub2
        headcountTextField.textColor = .basic2
        
        dateTextField.attributedPlaceholder = NSAttributedString(string: "프로젝트 기간", attributes: [NSAttributedString.Key.foregroundColor: UIColor.gray2!, NSAttributedString.Key.font: UIFont.sub2])
        dateTextField.inputView = datePicker.inputView
        dateTextField.font = .sub2
        dateTextField.textColor = .basic2
        
        contentTextField.attributedPlaceholder = NSAttributedString(string: "무엇을 하나요?", attributes: [NSAttributedString.Key.foregroundColor: UIColor.gray2!, NSAttributedString.Key.font: UIFont.sub2])
        
        contentTextField.font = .sub2
        contentTextField.textColor = .basic2
    }
    
    @objc func textFieldShouldReturn(_ codeTextField: UITextField) -> Bool {
        contentTextField.resignFirstResponder()
        return true
    }
    
    // MARK: - IBAction
    @IBAction func backToHome(_ sender: Any) {
        self.presentingViewController?.dismiss(animated: true)
    }
    
    @IBAction func submitTeamProjectData(_ sender: Any) {
        postCreateProject()
        self.view.window?.rootViewController?.dismiss(animated: false, completion: {
            let homeVC = HomeViewController()
            let appDelegate = UIApplication.shared.delegate as! AppDelegate
            appDelegate.window?.rootViewController?.present(homeVC, animated: true)
        })
    }
    
    // MARK: - Gesture
    @IBAction func projectColorTap(_ sender: Any) {
        let nextVC = storyboard?.instantiateViewController(withIdentifier: "selectColorVC") as! selectColorViewController
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
        
            
        nextVC.colorHandler = {color in
            self.projectColorView.backgroundColor = color
        }
        
        let c = self.projectColorView.backgroundColor!
        let idx = nextVC.colors.firstIndex(of: c)
        nextVC.index = idx ?? 0
        
        self.present(bottomSheet, animated: true, completion: nil)
    }
}

extension createTeamProjectViewController {
    func postCreateProject() {
        guard var title = titleTextField.text else { return }
        guard var contents = contentTextField.text else { return }
        guard let headcount = Int(headcountTextField.text!) else { return }
        guard let color = projectColorView.backgroundColor else { return }
        guard let period = dateTextField.text else { return }
        
        var colorName = color.accessibilityName
        
        switch colorName {
        case "red orange":
            colorName = "team1"
        case "orange":
            colorName = "team2"
        case "blue green":
            colorName = "team3"
        case "cyan":
            colorName = "team4"
        case "blue":
            colorName = "team5"
        case "magenta":
            colorName = "team6"
        default:
            colorName = "gray2"
        }
        
        let endIndex = period.index(period.startIndex, offsetBy: 11)
        let startRange = ...endIndex
        var startDate = String(period[startRange])
        
        let startIndex = period.index(period.startIndex, offsetBy: 15)
        let endRange = startIndex...
        var endDate = String(period[endRange])
        
        title = title.addSingleQuote(s: title)
        contents = contents.addSingleQuote(s: contents)
        colorName = colorName.addSingleQuote(s: colorName)
        startDate = startDate.addSingleQuote(s: startDate)
        endDate = endDate.addSingleQuote(s: endDate)

        let createProjectRequest: CreateProjectRequest = CreateProjectRequest(title: title, headcount: headcount, startAt: startDate, endAt: endDate, contents: contents, color: colorName)
        
        AddProjectAPI.shared.createProject(param: createProjectRequest) { result, error in
            if let error = error {
                print(error)
            } else {
                let projectId = result?.data?.projectId
                print(projectId)
            }
            
        }
    }
}
