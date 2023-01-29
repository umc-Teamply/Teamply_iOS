//
//  MyViewController.swift
//  Teamply
//
//  Created by 아라 on 2023/01/11.
//

import UIKit

class MyPageViewController: UIViewController {
    // MARK: - IBOultet
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var emailLabel: UILabel!
    @IBOutlet weak var infoLabel: UILabel!
    @IBOutlet weak var meetingScheduleLabel: UILabel!
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var termsOfUseLabel: UILabel!
    @IBOutlet weak var privacyPolicyLabel: UILabel!
    @IBOutlet weak var helpLabel: UILabel!
    
    // MARK: - Properties
    
    // MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        labelInit()
    }
    
    func labelInit() {
        titleLabel.text = "마이페이지"
        titleLabel.textColor = .basic2
        titleLabel.font = .head1
        
        nameLabel.text = "이프로"
        nameLabel.textColor = .basic2
        nameLabel.font = .body
        
        emailLabel.text = "leepro@gmail.com"
        emailLabel.textColor = .gray3
        emailLabel.font = .cap3
        
        infoLabel.text = "내 정보 관리"
        infoLabel.textColor = .basic2
        infoLabel.font = .body
        
        meetingScheduleLabel.text = "내 회의 시간표 관리"
        meetingScheduleLabel.textColor = .basic2
        meetingScheduleLabel.font = .body
        
        questionLabel.text = "1:1 문의하기"
        questionLabel.textColor = .basic2
        questionLabel.font = .body
        
        termsOfUseLabel.text = "이용 약관"
        termsOfUseLabel.textColor = .basic2
        termsOfUseLabel.font = .body
        
        privacyPolicyLabel.text = "개인정보처리방침"
        privacyPolicyLabel.textColor = .basic2
        privacyPolicyLabel.font = .body
        
        helpLabel.text = "도움말"
        helpLabel.textColor = .basic2
        helpLabel.font = .body
    }
    // MARK: - Method
    
    // MARK: - IBAction
    
    // MARK: - Gesture
}
