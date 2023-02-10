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
    @IBOutlet weak var loginLabel: UILabel!
    
    @IBOutlet weak var naverLoginLabel: UILabel!
    @IBOutlet weak var googleLoginLabel: UILabel!
    
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
        
        loginLabel.text = "로그인"
        loginLabel.font = .sub2
        loginLabel.textColor = .team1
        
        naverLoginLabel.text = "네이버로 로그인하기"
        naverLoginLabel.font = .sub2
        naverLoginLabel.textColor = .basic1
        
        googleLoginLabel.text = "구글로 로그인하기"
        googleLoginLabel.font = .sub2
        googleLoginLabel.textColor = .basic1
        
        
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
        
        loginButton.backgroundColor = .basic1
        loginButton.layer.borderWidth = 1
        loginButton.layer.borderColor = UIColor(named: "team1")?.cgColor
     
        
        naverLoginButton.backgroundColor = UIColor(red: 0.353, green: 0.769, blue: 0.4, alpha: 1)
       
        
        googleLoginButton.backgroundColor = UIColor(red: 0.325, green: 0.514, blue: 0.925, alpha: 1)
        
        
    }
    
    @IBAction func backButton(_ sender: Any) {
        self.presentingViewController?.dismiss(animated: true)
    }
    
    @IBAction func tapLoginButton(_ sender: Any) {
        
    }
    
}
