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
    
    
    @IBOutlet weak var IDLoginButton: UIButton!
    @IBOutlet weak var createAccountButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        componentStyle()
        logo0IMG.image = UIImage(named: "LoginLogo")
        logo1IMG.image = UIImage(named: "Teamply")
        
    }
    
    func componentStyle() {
        IDLoginButton.makeRound(radius: 15)
        IDLoginButton.backgroundColor = .basic1
        IDLoginButton.layer.borderWidth = 1
        IDLoginButton.layer.borderColor = UIColor(named: "team1")?.cgColor
        IDLoginButton.setTitle("아이디가 있어요!", for: .normal)
        IDLoginButton.setTitleColor(.team1, for: .normal)
        IDLoginButton.titleLabel?.font = .sub2
        
        createAccountButton.makeRound(radius: 15)
        createAccountButton.backgroundColor = .team1
        createAccountButton.setTitle("팀플리 회원가입 하기", for: .normal)
        createAccountButton.setTitleColor(.basic1, for: .normal)
        createAccountButton.titleLabel?.font = .sub2
                
    }
    @IBAction func tapmemberLogin(_ sender: Any) {
        let MemberLoginViewController = self.storyboard?.instantiateViewController(withIdentifier: "MemberLoginVC")
                      
        MemberLoginViewController?.modalPresentationStyle = .fullScreen
        MemberLoginViewController?.modalTransitionStyle = .crossDissolve
                        
                        self.present(MemberLoginViewController!, animated: true, completion: nil)
                
    }
    
    
    @IBAction func tapIDlogin(_ sender: Any) {
        let IDLoginViewController = self.storyboard?.instantiateViewController(withIdentifier: "IDLoginVC")
                      
        IDLoginViewController?.modalPresentationStyle = .fullScreen
        IDLoginViewController?.modalTransitionStyle = .crossDissolve
                        
                        self.present(IDLoginViewController!, animated: true, completion: nil)
    }
    
    
}
