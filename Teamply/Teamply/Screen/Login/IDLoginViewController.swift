//
//  IDLoginViewController.swift
//  Teamply
//
//  Created by Lee Jinkyung on 2023/02/10.
//

import UIKit

class IDLoginViewController: UIViewController {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var emailLabel: UILabel!
    
   
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var pwTextField: UITextField!
    
    
    @IBOutlet weak var loginButton: UIButton!    
    @IBOutlet weak var naverLoginButton: UIButton!
    @IBOutlet weak var googleLoginButton: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()
        loginsetStyle()

        // Do any additional setup after loading the view.
    }
    
    func loginsetStyle() {
        titleLabel.text = "로그인"
        titleLabel.font = .head2
        titleLabel.textColor = .basic2
        
        emailLabel.text = "이메일"
        emailLabel.font = .sub2
        emailLabel.textColor = .basic2
        
        emailTextField.makeRound(radius: 15)
        pwTextField.makeRound(radius: 15)
        loginButton.makeRound(radius: 15)
        naverLoginButton.makeRound(radius: 15)
        googleLoginButton.makeRound(radius: 15)
        
        emailTextField.attributedPlaceholder = NSAttributedString(string: "이메일", attributes: [NSAttributedString.Key.foregroundColor: UIColor.gray2!, NSAttributedString.Key.font: UIFont.sub2])
        emailTextField.keyboardType = .default
        emailTextField.font = .sub2
        emailTextField.textColor = .basic2
        emailTextField.addleftPadding()
        
        pwTextField.attributedPlaceholder = NSAttributedString(string: "비밀번호", attributes: [NSAttributedString.Key.foregroundColor: UIColor.gray2!, NSAttributedString.Key.font: UIFont.sub2])
        pwTextField.keyboardType = .default
        pwTextField.font = .sub2
        pwTextField.textColor = .basic2
        pwTextField.addleftPadding()
        pwTextField.isSecureTextEntry = true
        
        loginButton.backgroundColor = .basic1
        loginButton.layer.borderWidth = 1
        loginButton.layer.borderColor = UIColor(named: "team1")?.cgColor
        loginButton.setTitle("로그인", for: .normal)
        loginButton.setTitleColor(.team1, for: .normal)
        loginButton.titleLabel?.font = .sub2
        
        naverLoginButton.backgroundColor = UIColor(red: 0.353, green: 0.769, blue: 0.4, alpha: 1)
        naverLoginButton.setTitle("네이버로 로그인하기", for: .normal)
        naverLoginButton.setTitleColor(.basic1, for: .normal)
        naverLoginButton.titleLabel?.font = .sub2
       
        
        googleLoginButton.backgroundColor = UIColor(red: 0.325, green: 0.514, blue: 0.925, alpha: 1)
        googleLoginButton.setTitle("구글로 로그인하기", for: .normal)
        googleLoginButton.setTitleColor(.basic1, for: .normal)
        googleLoginButton.titleLabel?.font = .sub2
        
        
    }
    
    @IBAction func backButton(_ sender: Any) {
        self.presentingViewController?.dismiss(animated: true)
    }
    
    @IBAction func tapLoginButton(_ sender: Any) {
        
    }
    
}
