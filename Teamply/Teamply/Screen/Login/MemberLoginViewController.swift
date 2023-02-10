//
//  MemberLoginViewController.swift
//  Teamply
//
//  Created by Lee Jinkyung on 2023/02/10.
//

import UIKit

class MemberLoginViewController: UIViewController {
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var pwLabel: UILabel!
    @IBOutlet weak var emailLabel: UILabel!
    @IBOutlet weak var sendCodeLabel: UILabel!
    @IBOutlet weak var checkCodeLabel: UILabel!
    
    @IBOutlet weak var agreeLabel: UILabel!
    @IBOutlet weak var TermsofUseLabel: UILabel!
    @IBOutlet weak var haveTo0Label: UILabel!
    @IBOutlet weak var personalInfoLabel: UILabel!
    @IBOutlet weak var haveTo1Label: UILabel!
    @IBOutlet weak var snsAgreeLabel: UILabel!
    @IBOutlet weak var joinLabel: UILabel!
    
    @IBOutlet weak var detail0Label: UILabel!
    @IBOutlet weak var detail1Label: UILabel!
    @IBOutlet weak var detail2Label: UILabel!
    
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var pwTextField: UITextField!
    @IBOutlet weak var pwAgainTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var codeTextField: UITextField!
    
    @IBOutlet weak var sendCodeButton: UIButton!
    @IBOutlet weak var checkCodeButton: UIButton!
    @IBOutlet weak var detail0Button: UIButton!
    @IBOutlet weak var detail1Button: UIButton!
    @IBOutlet weak var detail2Button: UIButton!
    
    @IBOutlet weak var TermsofUseButton: UIImageView!
    @IBOutlet weak var personalInfoButton: UIImageView!
    @IBOutlet weak var snsAgreeButton: UIImageView!
    
    @IBOutlet weak var joinButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        componentStyle()
        
        TermsofUseButton.image = UIImage(named: "check_circle")
        personalInfoButton.image = UIImage(named: "check_circle")
        snsAgreeButton.image = UIImage(named: "check_circle")
        
    }
    
    func componentStyle() {
        titleLabel.text = "회원가입"
        titleLabel.font = .head2
        titleLabel.textColor = .basic2
        
        nameLabel.text = "이름"
        nameLabel.font = .sub2
        nameLabel.textColor = .basic2
        
        pwLabel.text = "비밀번호"
        pwLabel.font = .sub2
        pwLabel.textColor = .basic2
        
        emailLabel.text = "이메일"
        emailLabel.font = .sub2
        emailLabel.textColor = .basic2
        
        sendCodeLabel.text = "인증번호 전송"
        sendCodeLabel.font = .sub2
        sendCodeLabel.textColor = .basic2
        
        sendCodeButton.backgroundColor = .basic1
        sendCodeButton.layer.borderWidth = 1
        sendCodeButton.layer.borderColor = UIColor(named: "basic2")?.cgColor
        
        checkCodeLabel.text = "인증번호 확인"
        checkCodeLabel.font = .sub2
        checkCodeLabel.textColor = .basic2
 
        checkCodeButton.backgroundColor = .basic1
        checkCodeButton.layer.borderWidth = 1
        checkCodeButton.layer.borderColor = UIColor(named: "basic2")?.cgColor
        
        agreeLabel.text = "약관 동의"
        agreeLabel.font = .sub2
        agreeLabel.textColor = .basic2
        
        TermsofUseLabel.text = "이용약관 동의"
        TermsofUseLabel.font = .body
        TermsofUseLabel.textColor = .basic2
        
        haveTo0Label.text = "(필수)"
        haveTo0Label.font = .body
        haveTo0Label.textColor = .team1
        
        personalInfoLabel.text = "개인정보 수집 및 이용 동의"
        personalInfoLabel.font = .body
        personalInfoLabel.textColor = .basic2
        
        haveTo1Label.text = "(필수)"
        haveTo1Label.font = .body
        haveTo1Label.textColor = .team1
        
        snsAgreeLabel.text = "SNS 수신 동의"
        snsAgreeLabel.font = .body
        snsAgreeLabel.textColor = .basic2
        
        detail0Label.text = "자세히 보기"
        detail0Label.font = .cap3
        detail0Label.textColor = .gray3
        
        detail1Label.text = "자세히 보기"
        detail1Label.font = .cap3
        detail1Label.textColor = .gray3
        
        detail2Label.text = "자세히 보기"
        detail2Label.font = .cap3
        detail2Label.textColor = .gray3
        
        
        joinLabel.text = "가입하기"
        joinLabel.font = .body
        joinLabel.textColor = .basic1
        
        nameTextField.makeRound(radius: 15)
        pwTextField.makeRound(radius: 15)
        pwAgainTextField.makeRound(radius: 15)
        emailTextField.makeRound(radius: 15)
        codeTextField.makeRound(radius: 15)
        sendCodeButton.makeRound(radius: 10)
        checkCodeButton.makeRound(radius: 10)
        joinButton.makeRound(radius: 10)
        
        nameTextField.attributedPlaceholder = NSAttributedString(string: "실명으로 작성하시길 권장드려요!", attributes: [NSAttributedString.Key.foregroundColor: UIColor.gray2!, NSAttributedString.Key.font: UIFont.sub2])
        nameTextField.keyboardType = .default
        nameTextField.font = .sub2
        nameTextField.textColor = .basic2
        nameTextField.addleftPadding()
        
        pwTextField.attributedPlaceholder = NSAttributedString(string: "8자 이상으로 입력해주세요.", attributes: [NSAttributedString.Key.foregroundColor: UIColor.gray2!, NSAttributedString.Key.font: UIFont.sub2])
        pwTextField.keyboardType = .default
        pwTextField.font = .sub2
        pwTextField.textColor = .basic2
        pwTextField.addleftPadding()
        
        pwAgainTextField.attributedPlaceholder = NSAttributedString(string: "비밀번호 재입력", attributes: [NSAttributedString.Key.foregroundColor: UIColor.gray2!, NSAttributedString.Key.font: UIFont.sub2])
        pwAgainTextField.keyboardType = .default
        pwAgainTextField.font = .sub2
        pwAgainTextField.textColor = .basic2
        pwAgainTextField.addleftPadding()
        
        emailTextField.addleftPadding()
        
        codeTextField.attributedPlaceholder = NSAttributedString(string: "인증번호를 정확하게 입력해주세요.", attributes: [NSAttributedString.Key.foregroundColor: UIColor.gray2!, NSAttributedString.Key.font: UIFont.sub2])
        codeTextField.keyboardType = .default
        codeTextField.font = .sub2
        codeTextField.textColor = .basic2
        codeTextField.addleftPadding()
        
        detail0Button.backgroundColor = .clear
       
        detail1Button.backgroundColor = .clear
       
        detail2Button.backgroundColor = .clear
        
        joinButton.backgroundColor = .gray2
        
    }
    @IBAction func backButton(_ sender: Any) {
        self.presentingViewController?.dismiss(animated: true)
    }
    @IBAction func tapSendCodeButton(_ sender: Any) {
    }
    
    @IBAction func tapCheckCodeButton(_ sender: Any) {
    }
    
    @IBAction func tapTermsofUseButton(_ sender: Any) {
        TermsofUseButton.image = UIImage(named: "green_check_circle")
    }
    
    @IBAction func tapPersonalInfoButton(_ sender: Any) {
        personalInfoButton.image = UIImage(named: "green_check_circle")
    }
    
    @IBAction func tapsnsAgreeButton(_ sender: Any) {
        snsAgreeButton.image = UIImage(named: "green_check_circle")
    }
    
    
    @IBAction func tapjoinButton(_ sender: Any) {
        joinButton.backgroundColor = .team1
        signup()
        self.presentingViewController?.dismiss(animated: true)
    }
    
}
extension UITextField {
    func addleftPadding() {
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: 18.55, height: self.frame.height))
        self.leftView = paddingView
        self.leftViewMode = ViewMode.always
    }
}

extension MemberLoginViewController {
    func signup() {
        guard var name = nameTextField.text else { return }
        guard var email = emailTextField.text else { return }
        guard var pwd = pwTextField.text else { return }
        
        name.append("'")
        email.append("'")
        pwd.append("'")

        name = "'"+name
        email = "'"+email
        pwd = "'"+pwd
        
        print(name)
        let signupRequest: SignUpRequest = SignUpRequest(name: name, email: email, pw: pwd, accessConsent: 1, serviceConsent: 1)
        
        
        SignUpAPI.shared.signUp(param: signupRequest) { result, error in
            if let error = error {
                print(error)
            } else {
                let result = result?.message
            }
            
        }
    }
    
}
