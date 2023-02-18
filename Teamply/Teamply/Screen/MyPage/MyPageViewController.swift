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
        getUserInfo()
        labelInit()
    }
    
    func labelInit() {
        titleLabel.text = "마이페이지"
        titleLabel.textColor = .basic2
        titleLabel.font = .head1
        
        nameLabel.textColor = .basic2
        nameLabel.font = .body

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
    @IBAction func myInformationTap(_ sender: Any) {
        let myInformationVC = UIStoryboard.init(name: "MyInformation", bundle: nil)
        guard let nextVC = myInformationVC.instantiateViewController(withIdentifier: "MyInformationVC")
                as? MyInformationViewController else { return }
        
        nextVC.modalPresentationStyle = .fullScreen
        self.present(nextVC, animated: true, completion: nil)
    }
    
    @IBAction func meetingScheduleTap(_ sender: Any) {
        //스토리보드 이름
        let meetingScheduleVC = UIStoryboard.init(name: "MeetingSchedule", bundle: nil)
        //스토리보드 ID
        guard let nextVC = meetingScheduleVC.instantiateViewController(withIdentifier: "MeetingScheduleVC")
                as? MeetingScheduleViewController else { return }
        
        nextVC.modalPresentationStyle = .fullScreen
        self.present(nextVC, animated: true, completion: nil)
    }
}

extension MyPageViewController {
    func getUserInfo() {
        HomeAPI.shared.getUserInfo { [weak self] userInfoData in
            guard let infoData = userInfoData else { return }
            let info = infoData.data?.result[0]
            let name = info?.userName
            let email = info?.userEmail
            self?.nameLabel.text = name
            self?.emailLabel.text = email
        }
    }
}
