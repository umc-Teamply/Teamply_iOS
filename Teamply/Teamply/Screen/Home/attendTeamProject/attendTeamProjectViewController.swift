//
//  attendTeamProjectViewController.swift
//  Teamply
//
//  Created by 아라 on 2023/01/24.
//

import UIKit
import MaterialComponents

class attendTeamProjectViewController: UIViewController, UITextFieldDelegate{
    // MARK: - IBOutlet
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var subTitleLabel: UILabel!
    @IBOutlet weak var codeTextField: UITextField!
    @IBOutlet weak var backgroundView: UIView!
    @IBOutlet weak var okButton: UIButton!
    
    // MARK: - Properties
    let messageLabel = UILabel()
    
    // MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        self.codeTextField.delegate = self
        
        setComponentInit()
        setInputFieldInit()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        NotificationCenter.default.post(name: NSNotification.Name("attendTeamProjectVC"), object: nil, userInfo: nil)
    }
    
    // MARK: - Method
    func setComponentInit() {
        titleLabel.text = "팀 프로젝트 참가하기"
        titleLabel.font = .head2
        titleLabel.textColor = .basic2
        
        subTitleLabel.text = "초대코드 입력하기"
        subTitleLabel.font = .sub2
        subTitleLabel.textColor = .basic2
        
        okButton.setTitle("확인", for: .normal)
        okButton.setTitleColor(.basic1, for: .normal)
        okButton.titleLabel?.font = .btn
        okButton.makeRound(radius: 10)
    }
    
    func setInputFieldInit() {
        codeTextField.attributedPlaceholder = NSAttributedString(string: "초대코드를 입력하세요", attributes: [NSAttributedString.Key.foregroundColor: UIColor.gray2!, NSAttributedString.Key.font: UIFont.sub2])
        codeTextField.font = .sub2
        codeTextField.textColor = .basic2
        codeTextField.keyboardType = .default
        
        backgroundView.backgroundColor = .gray0
        backgroundView.makeRound(radius: 15)
    }
    
    func isExistCode() -> Bool {
        if codeTextField.text == "123" {
            return false
        }
        return true
    }
    
    func setNotExistCodeView() {
        backgroundView.backgroundColor = .basic1
        backgroundView.layer.borderWidth = 1
        backgroundView.layer.borderColor = UIColor.team1?.cgColor
        
        messageLabel.text = "없는 초대코드 입니다. 다시 입력해주세요."
        messageLabel.font = .cap3
        messageLabel.textColor = .team1
        messageLabel.textAlignment = .left
        messageLabel.numberOfLines = 1
        messageLabel.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(messageLabel)
        
        let safeArea = view.safeAreaLayoutGuide
        
        messageLabel.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor, constant: 42.55).isActive = true
        messageLabel.topAnchor.constraint(equalTo: backgroundView.bottomAnchor, constant: 6).isActive = true
    }
    
    func makeBottomSheet(){
        let nextVC = storyboard?.instantiateViewController(withIdentifier: "SelectNoneColorVC") as! SelectNoneColorViewController
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
        
        self.present(bottomSheet, animated: true, completion: nil)
    }
    
    func textFieldDidEndEditing(_ contentField: UITextField) {
        codeTextField.addTarget(self, action: #selector(textFieldDidChange(textField:)),
                                for: UIControl.Event.editingChanged)
    }
    
    @objc func textFieldDidChange(textField: UITextField){
        backgroundView.layer.borderWidth = 0
        messageLabel.text = ""
        setInputFieldInit()
    }
    
    @objc func textFieldShouldReturn(_ codeTextField: UITextField) -> Bool {
        codeTextField.resignFirstResponder()
        
        return true
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
    }
    
    // MARK: - IBAction
    @IBAction func backToHome(_ sender: Any) {
        self.presentingViewController?.dismiss(animated: true)
    }
    
    @IBAction func submitInviteCode(_ sender: Any) {
        if isExistCode() {
            makeBottomSheet()
        }
        else { setNotExistCodeView() }
    }
}
