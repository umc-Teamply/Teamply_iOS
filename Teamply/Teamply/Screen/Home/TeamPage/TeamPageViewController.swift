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
    //@IBOutlet weak var user0Label: UILabel!
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
    
    @IBOutlet weak var headerView: UIView!
    @IBOutlet weak var memberStackview: UIStackView!
    
    var projectId: Int!
    var totalHeadcount: Int!
    var projectColor: String!
    var projectTitle: String!
    var date: String!
    var scheduleData: [Schedule]!
    var memberInfo: [Member]!
    var memberImages = "defaultProfile"
    var addMemberImage = "add_friend"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        getProjectScheduleData()
        getProjectMemberInfo()
        setTeamPageStyle()
        //setMemberStackView()
//        periodBorder.layer.cornerRadius = 15
//        periodBorder.layer.borderWidth = 1
//        periodBorder.layer.borderColor = UIColor(red: 1, green: 1, blue: 1, alpha: 1).cgColor
    }
    
    func setTeamPageStyle() {
        headerView.backgroundColor = UIColor(named: projectColor)
        titleLabel.text = projectTitle
        titleLabel.font = .head1
        titleLabel.textColor = .basic1

//        user0Label.text = "이프로"
//        user0Label.font = .cap3
//        user0Label.textColor = .basic1

        periodLabel.text = "기간"
        periodLabel.font = .cap3
        periodLabel.textColor = .basic1
        periodLabel.layer.borderColor = UIColor.basic1?.cgColor
        periodLabel.layer.borderWidth = 1
        periodLabel.makeRound(radius: 12)
        
        dateLabel.text = date
        dateLabel.font = .cap3
        dateLabel.textColor = .basic1
        
        detailScheduleLabel.text = "일정 세부 보기"
        detailScheduleLabel.font = .sub1
        detailScheduleLabel.textColor = .basic2
        
        //addScheduleLabel.text = "+ 일정을 등록해보세요"
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
    
    func emptySchedule() {
        addScheduleLabel.text = "+ 일정을 등록해보세요"
    }
    
    func setMemberStackView() {
        for m in memberInfo {
            print(m.userName)
            setMemberView(name: m.userName)
        }
        setUnInviteMember()
    }
    
    
    func setMemberView(name: String) {
        let memberView: UIView = {
            let view = UIView()
            view.translatesAutoresizingMaskIntoConstraints = false
            //view.backgroundColor = headerView.backgroundColor
            view.heightAnchor.constraint(equalToConstant: 62).isActive = true
            return view
        }()
        
        let memberImage: UIImageView = {
            let view = UIImageView()
            view.translatesAutoresizingMaskIntoConstraints = false
            view.heightAnchor.constraint(equalToConstant: 40).isActive = true
            view.widthAnchor.constraint(equalToConstant: 40).isActive = true
            //view.image = UIImage(named: memberImages)
            return view
        }()
        
        let memberName: UILabel = {
            let label = UILabel()
            label.translatesAutoresizingMaskIntoConstraints = false
            label.font = .cap3
            label.textColor = .basic1
            label.textAlignment = .center
            return label
        }()
        
        memberView.backgroundColor = headerView.backgroundColor
        memberImage.image = UIImage(named: memberImages)
        memberView.addSubview(memberImage)
        memberName.text = name
        memberView.addSubview(memberName)
        
        NSLayoutConstraint.activate([
            memberImage.leadingAnchor.constraint(equalTo: memberView.leadingAnchor),
            memberImage.trailingAnchor.constraint(equalTo: memberView.trailingAnchor),
            memberImage.topAnchor.constraint(equalTo: memberView.topAnchor)
        ])
        
        NSLayoutConstraint.activate([
            memberName.centerXAnchor.constraint(equalTo: memberView.centerXAnchor),
            memberName.bottomAnchor.constraint(equalTo: memberView.bottomAnchor)
        ])
        
        memberStackview.addArrangedSubview(memberView)
    }
    
    func setUnInviteMember() {
        let unInviteCount = totalHeadcount - memberInfo.count
        
        if unInviteCount > 0 {
            for _ in 1...unInviteCount {
                let plusView: UIView = {
                    let view = UIView()
                    view.translatesAutoresizingMaskIntoConstraints = false
                    //view.backgroundColor = headerView.backgroundColor
                    view.heightAnchor.constraint(equalToConstant: 62).isActive = true
                    return view
                }()
                
                let plusImage: UIImageView = {
                    let view = UIImageView()
                    view.translatesAutoresizingMaskIntoConstraints = false
                    view.heightAnchor.constraint(equalToConstant: 40).isActive = true
                    view.widthAnchor.constraint(equalToConstant: 40).isActive = true
                    //view.image = UIImage(named: memberImages)
                    return view
                }()
                
                plusView.backgroundColor = headerView.backgroundColor
                plusImage.image = UIImage(named: addMemberImage)
                plusView.addSubview(plusImage)
                
                NSLayoutConstraint.activate([
                    plusImage.leadingAnchor.constraint(equalTo: plusView.leadingAnchor),
                    plusImage.trailingAnchor.constraint(equalTo: plusView.trailingAnchor),
                    plusImage.topAnchor.constraint(equalTo: plusView.topAnchor)
                ])
                
                memberStackview.addArrangedSubview(plusView)
            }
        }
    }
    // MARK: - IBAction
    
    @IBAction func backhomeButton(_ sender: Any) {
        self.presentingViewController?.dismiss(animated: true)
    }
    
    @objc func memberAddButton(_ sender: Any) {
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

    
    @IBAction func tappedAddSchedule(_ sender: Any) {
        let addDetailedScheduleVC = UIStoryboard.init(name: "addDetailedSchedule", bundle: nil)
        guard let nextVC = addDetailedScheduleVC.instantiateViewController(withIdentifier: "addDetailedScheduleVC") as? addDetailedScheduleViewController else { return }

                       nextVC.modalPresentationStyle = .fullScreen
                       self.present(nextVC, animated: true, completion: nil)
    }
    

}

extension TeamPageViewController {
    func getProjectScheduleData() {
        TeamPageAPI.shared.getProjectScheduleList(param: projectId) { result, error in
            if let error = error {
                print(error)
            } else {
                guard let scheduleData = result?.data else { return }
                self.scheduleData = scheduleData.result
                if scheduleData.result.isEmpty {
                    self.emptySchedule()
                }
                //self.setMemberStackView()
            }
            
        }
    }
    
    func getProjectMemberInfo() {
        TeamPageAPI.shared.getProjectMemberInfo(param: projectId) { result, error in
            if let error = error {
                print(error)
            } else {
                guard let memberInfo = result?.data else { return }
                self.memberInfo = memberInfo.result
                
                self.setMemberStackView()
            }
            
        }
    }
}
