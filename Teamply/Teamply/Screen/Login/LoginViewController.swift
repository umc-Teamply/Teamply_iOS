//
//  LoginViewController.swift
//  Teamply
//
//  Created by Lee Jinkyung on 2023/02/09.
//

import UIKit

class LoginViewController: UIViewController {
    
    @IBOutlet weak var logo0IMG: UIImageView!
    @IBOutlet weak var logo1IMG: UIImageView!
    
    
    @IBOutlet weak var memberLoginButton: UIButton!
    @IBOutlet weak var createAccountButton: UIButton!
    
    @IBOutlet weak var memberLoginLabel: UILabel!
    @IBOutlet weak var createAccountLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        componentStyle()
        logo0IMG.image = UIImage(named: "LoginLogo")
        logo1IMG.image = UIImage(named: "Teamply")
        
    }
    
    func componentStyle() {
        memberLoginButton.makeRound(radius: 15)
        memberLoginButton.backgroundColor = .basic1
        memberLoginButton.layer.borderWidth = 1
        memberLoginButton.layer.borderColor = UIColor(named: "team1")?.cgColor
        
        createAccountButton.makeRound(radius: 15)
        createAccountButton.backgroundColor = .team1
        
        memberLoginLabel.text = "아이디가 있어요!"
        memberLoginLabel.font = .sub2
        memberLoginLabel.textColor = .team1
        
        createAccountLabel.text = "팀플리 회원가입 하기"
        createAccountLabel.font = .sub2
        createAccountLabel.textColor = .basic1
        
    }
    @IBAction func tapmemberLogin(_ sender: Any) {
        let MemberLoginViewController = self.storyboard?.instantiateViewController(withIdentifier: "MemberLoginVC")
                      
        MemberLoginViewController?.modalPresentationStyle = .fullScreen
        MemberLoginViewController?.modalTransitionStyle = .crossDissolve
                        
                        self.present(MemberLoginViewController!, animated: true, completion: nil)
                
    }
    
    
}
