//
//  MemberLoginViewController.swift
//  Teamply
//
//  Created by Lee Jinkyung on 2023/02/10.
//

import UIKit

class MemberLoginViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var pwLabel: UILabel!
    @IBOutlet weak var emailLabel: UILabel!
    
    @IBOutlet weak var agreeLabel: UILabel!
    @IBOutlet weak var TermsofUseLabel: UILabel!
    @IBOutlet weak var haveTo0Label: UILabel!
    @IBOutlet weak var personalInfoLabel: UILabel!
    @IBOutlet weak var haveTo1Label: UILabel!
    @IBOutlet weak var snsAgreeLabel: UILabel!
    
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
    
    @IBOutlet weak var wrongCodeLabel: UILabel!

  
     @objc func TextFieldfilled(_ sender: Any) {
         if !(self.nameTextField.text?.isEmpty ?? true)
             && !(self.pwTextField.text?.isEmpty ?? true)
             && !(self.pwAgainTextField.text?.isEmpty ?? true)
             && !(self.emailTextField.text?.isEmpty ?? true)
             && !(self.codeTextField.text?.isEmpty ?? true)
             && !(self.TermsofUseButton.image == UIImage(named: "check_circle"))
             && !(self.personalInfoButton.image == UIImage(named: "check_circle"))
             && (self.codeTextField.text == "123456") {
             if pwCom() {
                 completionJoinButton(isOn: true)
             } else {
                 completionJoinButton(isOn: false)
             }
         }
         else {
             completionJoinButton(isOn: false)
         }
     }
    
    func completionJoinButton(isOn: Bool) {
        if (isOn == true) {
            self.joinButton.backgroundColor = .team1
            self.joinButton.setTitle("가입하기", for: .normal)
            self.joinButton.setTitleColor(.basic1, for: .normal)
            joinButton.titleLabel?.font = .body
        } else {
            self.joinButton.backgroundColor = .gray2
            self.joinButton.setTitle("가입하기", for: .normal)
            self.joinButton.setTitleColor(.basic1, for: .normal)
            self.joinButton.titleLabel?.font = .body
        }
    }

    
    override func viewDidLoad() {
        super.viewDidLoad()
        componentStyle()
        
        TermsofUseButton.image = UIImage(named: "check_circle")
        personalInfoButton.image = UIImage(named: "check_circle")
        snsAgreeButton.image = UIImage(named: "check_circle")

        
        self.completionJoinButton(isOn: false)
        
        self.nameTextField.delegate = self
        self.pwTextField.delegate = self
        self.pwAgainTextField.delegate = self
        self.emailTextField.delegate = self
        self.codeTextField.delegate = self
        
        self.nameTextField.addTarget(self, action: #selector(self.TextFieldfilled(_:)), for: .editingChanged)
        self.pwTextField.addTarget(self, action: #selector(self.TextFieldfilled(_:)), for: .editingChanged)
        self.pwAgainTextField.addTarget(self, action: #selector(self.TextFieldfilled(_:)), for: .editingChanged)
        self.emailTextField.addTarget(self, action: #selector(self.TextFieldfilled(_:)), for: .editingChanged)
        self.codeTextField.addTarget(self, action: #selector(self.TextFieldfilled(_:)), for: .editingChanged)
        
        
        let taptermsGesture = UITapGestureRecognizer(target: self, action: #selector(self.tapterms(_:)))
        self.TermsofUseButton.addGestureRecognizer(taptermsGesture)
        self.TermsofUseButton.isUserInteractionEnabled = true
        
        let tappersonalGesture = UITapGestureRecognizer(target: self, action: #selector(self.tappersonal(_:)))
        self.personalInfoButton.addGestureRecognizer(tappersonalGesture)
        self.personalInfoButton.isUserInteractionEnabled = true
        
        let tapsnsGesture = UITapGestureRecognizer(target: self, action: #selector(self.tapsns(_:)))
        self.snsAgreeButton.addGestureRecognizer(tapsnsGesture)
        self.snsAgreeButton.isUserInteractionEnabled = true
        
        taptermsGesture.delegate = self
        tappersonalGesture.delegate = self
        tapsnsGesture.delegate = self
        
        
        wrongCodeLabel.isHidden = true
        
        
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
        
        sendCodeButton.backgroundColor = .basic1
        sendCodeButton.layer.borderWidth = 1
        sendCodeButton.layer.borderColor = UIColor(named: "basic2")?.cgColor
        sendCodeButton.setTitle("인증번호 전송", for: .normal)
        sendCodeButton.setTitleColor(.basic2, for: .normal)
        sendCodeButton.titleLabel?.font = .sub2
        
        checkCodeButton.backgroundColor = .basic1
        checkCodeButton.layer.borderWidth = 1
        checkCodeButton.layer.borderColor = UIColor(named: "basic2")?.cgColor
        checkCodeButton.setTitle("인증번호 확인", for: .normal)
        checkCodeButton.setTitleColor(.basic2, for: .normal)
        checkCodeButton.titleLabel?.font = .sub2
        
        wrongCodeLabel.text = "잘못된 인증번호 입니다. 인증번호를 다시 입력해주세요."
        wrongCodeLabel.font = .cap3
        wrongCodeLabel.textColor = .team1
        
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
        pwTextField.isSecureTextEntry = true
        
        pwAgainTextField.attributedPlaceholder = NSAttributedString(string: "비밀번호 재입력", attributes: [NSAttributedString.Key.foregroundColor: UIColor.gray2!, NSAttributedString.Key.font: UIFont.sub2])
        pwAgainTextField.keyboardType = .default
        pwAgainTextField.font = .sub2
        pwAgainTextField.textColor = .basic2
        pwAgainTextField.addleftPadding()
        pwAgainTextField.isSecureTextEntry = true
        
        emailTextField.addleftPadding()
        
        codeTextField.attributedPlaceholder = NSAttributedString(string: "인증번호를 정확하게 입력해주세요.", attributes: [NSAttributedString.Key.foregroundColor: UIColor.gray2!, NSAttributedString.Key.font: UIFont.sub2])
        codeTextField.keyboardType = .default
        codeTextField.font = .sub2
        codeTextField.textColor = .basic2
        codeTextField.addleftPadding()
        
        detail0Button.tintColor = .basic1
        detail0Button.setTitle("자세히 보기", for: .normal)
        detail0Button.setTitleColor(.gray3, for: .normal)
        detail0Button.titleLabel?.font = .cap3
       
        detail1Button.backgroundColor = .clear
        detail1Button.setTitle("자세히 보기", for: .normal)
        detail1Button.setTitleColor(.gray3, for: .normal)
        detail1Button.titleLabel?.font = .cap3
       
        detail2Button.backgroundColor = .clear
        detail2Button.setTitle("자세히 보기", for: .normal)
        detail2Button.setTitleColor(.gray3, for: .normal)
        detail2Button.titleLabel?.font = .cap3
        
    }
    
    func codeCompare() -> Bool{
        if codeTextField.text == "123456" {
            return false
        }
        return true
    }
    
    func wrongCode() {
        wrongCodeLabel.isHidden = false
        codeTextField.layer.borderWidth = 1
        codeTextField.layer.borderColor = UIColor(named: "team1")?.cgColor
    }
    
    func correctCode() {
        wrongCodeLabel.isHidden = true
        codeTextField.layer.borderWidth = 0
    }
    
    
    @IBAction func backButton(_ sender: Any) {
        self.presentingViewController?.dismiss(animated: true)
    }
    @IBAction func tapSendCodeButton(_ sender: Any) {
    }
    
    @IBAction func tapCheckCodeButton(_ sender: Any) {
        if codeCompare() {
            wrongCode()
        } else {
            correctCode()
        }
    }
    
    
    func isValidPassword(pw: String?) -> Bool{
           if let hasPassword = pw{
               if hasPassword.count < 8{
                   return false
               }
           }
           return true
       }
    
    func pwCom() -> Bool{
        if pwTextField.text == pwAgainTextField.text {
            if isValidPassword(pw: pwTextField.text) && isValidPassword(pw: pwAgainTextField.text)  {
                return true
            }
            return false
        }
        return false
    }
    
    func wrongpw() {
        TextFieldfilled(self)
    }
    
    func correctpw() {
        TextFieldfilled(self)
    }
    
   
    @objc func tapterms(_ sender: UITapGestureRecognizer) {
        if TermsofUseButton.image == UIImage(named: "check_circle") {
            TermsofUseButton.image = UIImage(named: "green_check_circle")
        } else {
            TermsofUseButton.image = UIImage(named: "check_circle")
        }
        return TextFieldfilled(self)
    }
    
    @objc func tappersonal(_ sender: UITapGestureRecognizer) {
        if personalInfoButton.image == UIImage(named: "check_circle") {
            personalInfoButton.image = UIImage(named: "green_check_circle")
        } else {
            personalInfoButton.image = UIImage(named: "check_circle")
        }
        return TextFieldfilled(self)
    }
    
    @objc func tapsns(_ sender: UITapGestureRecognizer) {
        if snsAgreeButton.image == UIImage(named: "check_circle") {
            snsAgreeButton.image = UIImage(named: "green_check_circle")
        } else {
            snsAgreeButton.image = UIImage(named: "check_circle")
        }
    }
    
    
    @IBAction func tapjoinButton(_ sender: Any) {
        joinButton.backgroundColor = .team1
        signup()
        self.presentingViewController?.dismiss(animated: true)
    }
    
   
    @objc func textFieldEdited(textField: UITextField) {
        if textField == pwTextField {
            if isValidPassword(pw: textField.text) {
                completionJoinButton(isOn: true)
            }
            else {
                completionJoinButton(isOn: false)
            }
        }
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        switch textField {
        case nameTextField:
            pwTextField.becomeFirstResponder()
        case pwTextField:
            pwAgainTextField.becomeFirstResponder()
        case pwAgainTextField:
            emailTextField.becomeFirstResponder()
        case emailTextField:
            codeTextField.becomeFirstResponder()
        default:
            break
        }
        
        return true
    }
    
    
}
extension UITextField {
    func addleftPadding() {
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: 18.55, height: self.frame.height))
        self.leftView = paddingView
        self.leftViewMode = ViewMode.always
    }
}

extension MemberLoginViewController: UIGestureRecognizerDelegate {
    func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer, shouldRecognizeSimultaneouslyWith otherGestureRecognizer: UIGestureRecognizer) -> Bool {
        return true
    }
}
extension MemberLoginViewController {
    func signup() {
        guard var name = nameTextField.text else { return }
        guard var email = emailTextField.text else { return }
        guard var pwd = pwTextField.text else { return }
        
        name = name.addSingleQuote(s: name)
        email = email.addSingleQuote(s: email)
        pwd = pwd.addSingleQuote(s: pwd)
        
        let signupRequest: SignUpRequest = SignUpRequest(name: name, email: email, pw: pwd, accessConsent: 1, serviceConsent: 1)
        
        
        SignUpAPI.shared.signUp(param: signupRequest) { result, error in
            if let error = error {
                print(error)
            } else {
                let result = result?.message
                print(result!)
            }
            
        }
    }
    
}
