//
//  TeamPageViewController.swift
//  Teamply
//
//  Created by Lee Jinkyung on 2023/01/27.
//

import UIKit

class TeamPageViewController: UIViewController {
    
    // MARK: - IBOulet
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var user0Label: UILabel!
    @IBOutlet weak var periodLabel: UILabel!
    @IBOutlet weak var periodBorder: UIView!
    @IBOutlet weak var dateLabel: UILabel!
    
    @IBOutlet weak var detailScheduleLabel: UILabel!
    @IBOutlet weak var addScheduleLabel: UILabel!
    @IBOutlet weak var addScheduleButton: UIButton!
    @IBOutlet weak var projectToolLabel: UILabel!
    @IBOutlet weak var meetingScheduleLabel: UILabel!
    @IBOutlet weak var meetingScheduleButton: UIButton!
    
    @IBOutlet weak var voteScheduleLabel: UILabel!
    
    @IBOutlet weak var projectInfoLabel: UILabel!
    @IBOutlet weak var projectInfoButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setTeamPageStyle()
        periodBorder.layer.cornerRadius = 15
        periodBorder.layer.borderWidth = 1
        periodBorder.layer.borderColor = UIColor(red: 1, green: 1, blue: 1, alpha: 1).cgColor
    }
    
    func setTeamPageStyle() {
        titleLabel.text = "브랜드경험 디자인"
        titleLabel.font = .head1
        titleLabel.textColor = .basic1
        
        user0Label.text = "이프로"
        user0Label.font = .cap3
        user0Label.textColor = .basic1
        
        periodLabel.text = "기간"
        periodLabel.font = .cap3
        periodLabel.textColor = .basic1
        
        dateLabel.text = "2022.10.18.화 ~"
        dateLabel.font = .cap3
        dateLabel.textColor = .basic1
        
        detailScheduleLabel.text = "일정 세부 보기"
        detailScheduleLabel.font = .sub1
        detailScheduleLabel.textColor = .basic2
        
        addScheduleLabel.text = "+ 일정을 등록해보세요"
        addScheduleLabel.font = .sub2
        addScheduleLabel.textColor = .gray2
        
        addScheduleButton.makeRound(radius: 12)
        
        projectToolLabel.text = "프로젝트 도구"
        projectToolLabel.font = .sub1
        projectToolLabel.textColor = .basic2
        
        meetingScheduleLabel.text = "회의일정 정하기"
        meetingScheduleLabel.font = .sub2
        meetingScheduleLabel.textColor = .basic2
        
        meetingScheduleButton.makeRound(radius: 10)
        
        voteScheduleLabel.text = "일정에 투표하세요"
        voteScheduleLabel.font = .cap2
        voteScheduleLabel.textColor = .basic2
        
        
        projectInfoLabel.text = "프로젝트 정보보기"
        projectInfoLabel.font = .sub2
        projectInfoLabel.textColor = .basic2
        
        projectInfoButton.makeRound(radius: 10)
    }
    
   
    // MARK: - IBAction
    
    @IBAction func backhomeButton(_ sender: Any) {
        self.presentingViewController?.dismiss(animated: true)
    }
    
    @IBAction func user1Button(_ sender: Any) {
        guard let codevc = self.storyboard?.instantiateViewController(withIdentifier: "codeVC") as? codeViewController else { return }
            codevc.modalPresentationStyle = .overCurrentContext
        codevc.modalTransitionStyle = .crossDissolve
            self.present(codevc, animated: true, completion: nil)
        }
    
    @IBAction func user2Button(_ sender: Any) {
        guard let codevc = self.storyboard?.instantiateViewController(withIdentifier: "codeVC") as? codeViewController else { return }
            codevc.modalPresentationStyle = .overCurrentContext
        codevc.modalTransitionStyle = .crossDissolve
            self.present(codevc, animated: true, completion: nil)
    }
    
    @IBAction func user3Button(_ sender: Any) {
        guard let codevc = self.storyboard?.instantiateViewController(withIdentifier: "codeVC") as? codeViewController else { return }
            codevc.modalPresentationStyle = .overCurrentContext
        codevc.modalTransitionStyle = .crossDissolve
            self.present(codevc, animated: true, completion: nil)
    }

    
    

}
