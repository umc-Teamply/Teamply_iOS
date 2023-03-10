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
    @IBOutlet weak var scheduleView: UIView!
    
    @IBOutlet weak var teamPageStackView: UIStackView!
    @IBOutlet weak var projectToolView: UIView!
    
    @IBOutlet weak var projectToolLabel: UILabel!
    @IBOutlet weak var meetingScheduleLabel: UILabel!
    @IBOutlet weak var meetingScheduleButton: UIButton!
    
    @IBOutlet weak var voteScheduleLabel: UILabel!
    
    @IBOutlet weak var projectInfoLabel: UILabel!
    @IBOutlet weak var projectInfoView: UIView!
    @IBOutlet weak var projectInfoButton: UIButton!
    
    @IBOutlet weak var meetingScheduleView: UIView!
    @IBOutlet weak var headerView: UIView!
    @IBOutlet weak var memberStackview: UIStackView!
    @IBOutlet weak var scheduleCollectionView: UICollectionView!
    
    var projectId: Int!
    var totalHeadcount: Int!
    var projectColor: String!
    var projectTitle: String!
    var date: String!
    var scheduleData: [Schedule]!
    var memberInfo: [Member]!
    var imageName: String!
    var addMemberImage = "add_friend"
    var code: String!
    var scheduleCell = "ScheduleCell"
    override func viewDidLoad() {
        super.viewDidLoad()
        getProjectScheduleData()
        getProjectMemberInfo()
        getInviteCode()
        setTeamPageInit()
    }
    
    func setTeamPageInit() {
        headerView.backgroundColor = UIColor(named: projectColor)
        titleLabel.text = projectTitle
        titleLabel.font = .head1
        titleLabel.textColor = .basic1

        periodLabel.text = "??????"
        periodLabel.font = .cap3
        periodLabel.textColor = .basic1
        periodLabel.layer.borderColor = UIColor.basic1?.cgColor
        periodLabel.layer.borderWidth = 1
        periodLabel.makeRound(radius: 12)
        
        dateLabel.text = date
        dateLabel.font = .cap3
        dateLabel.textColor = .basic1
        
        detailScheduleLabel.text = "?????? ?????? ??????"
        detailScheduleLabel.font = .sub1
        detailScheduleLabel.textColor = .basic2

        meetingScheduleView.translatesAutoresizingMaskIntoConstraints = false
        meetingScheduleView.isUserInteractionEnabled = true
        meetingScheduleView.makeRound(radius: 10)
        meetingScheduleView.makeShadow(.gray1!, 1, CGSize(width: 0, height: 3), 10)
        
        projectInfoView.makeRound(radius: 10)
        projectInfoView.translatesAutoresizingMaskIntoConstraints = false
        projectInfoView.isUserInteractionEnabled = true
        projectInfoView.makeShadow(.gray1!, 1, CGSize(width: 0, height: 3), 10)
        
        setProjectToolInit()
    }
    
    func setProjectToolInit() {
        projectToolLabel.text = "???????????? ??????"
        projectToolLabel.font = .sub1
        projectToolLabel.textColor = .basic2
        
        meetingScheduleLabel.text = "???????????? ?????????"
        meetingScheduleLabel.font = .sub2
        meetingScheduleLabel.textColor = .basic2
        projectInfoLabel.text = "???????????? ????????????"
        projectInfoLabel.font = .sub2
        projectInfoLabel.textColor = .basic2
        
        projectInfoButton.makeRound(radius: 10)
    }
    
    func emptySchedule() {
        addScheduleLabel.text = "+ ????????? ??????????????????"
    }
    
    func setMemberStackView() {
        for m in memberInfo {
            setMemberView(name: m.userName)
        }
        setUnInviteMember()
    }
    
    func setCollectionViewInit() {
        scheduleCollectionView.delegate = self
        scheduleCollectionView.dataSource = self
        scheduleCollectionView.translatesAutoresizingMaskIntoConstraints = false
        
        if scheduleData.isEmpty {
            scheduleCollectionView.heightAnchor.constraint(equalToConstant: 105).isActive = true
            scheduleView.heightAnchor.constraint(equalToConstant: 157).isActive = true
        } else {
            scheduleCollectionView.heightAnchor.constraint(equalToConstant: 265).isActive = true
            scheduleView.heightAnchor.constraint(equalToConstant: 327).isActive = true
        }
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.minimumInteritemSpacing = 10
        flowLayout.sectionInset = UIEdgeInsets.init(top: 0, left: 24, bottom: 0, right: 24)
        flowLayout.estimatedItemSize = UICollectionViewFlowLayout.automaticSize
        flowLayout.scrollDirection = .horizontal
        scheduleCollectionView.setCollectionViewLayout(flowLayout, animated: true)
        scheduleCollectionView.register(ScheduleCollectionViewCell.self, forCellWithReuseIdentifier: scheduleCell)
        
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
        
        if name == "?????????" {
            imageName = "duck"
        } else if name == "??????" {
            imageName = "tack"
        } else if name == "?????????" {
            imageName = "jeonghwan"
        } else if name == "?????????" {
            imageName = "seonwoo"
        } else if name == "?????????" {
            imageName = "dong"
        } else if name == "?????????" {
            imageName = "roseok"
        } else if name == "?????????" {
            imageName = "prince"
        } else {
            imageName = "defaultProfile"
        }
        
        memberView.backgroundColor = headerView.backgroundColor
        memberImage.image = UIImage(named: imageName)
        memberImage.makeRound(radius: 20)
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
                    view.isUserInteractionEnabled = true
                    view.heightAnchor.constraint(equalToConstant: 40).isActive = true
                    view.widthAnchor.constraint(equalToConstant: 40).isActive = true
                    view.image = UIImage(named: addMemberImage)
                    view.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(self.memberAddButton)))
                    return view
                }()
                
                plusView.backgroundColor = headerView.backgroundColor
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
    
    @objc func memberAddButton(_ sender: UITapGestureRecognizer){
        guard let codevc = self.storyboard?.instantiateViewController(withIdentifier: "codeVC") as? codeViewController else { return }
        codevc.modalPresentationStyle = .overCurrentContext
        codevc.modalTransitionStyle = .crossDissolve
        codevc.code = code
        self.present(codevc, animated: true, completion: nil)
    }

    @objc func tappedAddSchedule(_ sender: UITapGestureRecognizer) {
        let addDetailedScheduleVC = UIStoryboard.init(name: "addDetailedSchedule", bundle: nil)
        guard let nextVC = addDetailedScheduleVC.instantiateViewController(withIdentifier: "addDetailedScheduleVC") as? addDetailedScheduleViewController else { return }
        
        nextVC.projectColor = headerView.backgroundColor
        nextVC.modalPresentationStyle = .fullScreen
        self.present(nextVC, animated: true, completion: nil)
    }
    

}

extension TeamPageViewController: UICollectionViewDelegate, UICollectionViewDataSource {

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if scheduleData.isEmpty {
            return 1
        }
        return scheduleData.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: scheduleCell, for: indexPath) as! ScheduleCollectionViewCell
        
        let screenWidth = self.view.frame.width
        let width = screenWidth - 48
        cell.scheduleView.widthAnchor.constraint(equalToConstant: width).isActive = true
        
        if scheduleData.isEmpty {
            cell.emptySchedule()
            
            cell.scheduleView.heightAnchor.constraint(equalToConstant: 64).isActive = true
            cell.scheduleView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(self.tappedAddSchedule)))
        } else {
            let scheduleData = self.scheduleData[indexPath.row]
            let startDate = scheduleData.startAt
            let endDate = scheduleData.endAt
            let period = startDate+"~"+endDate
            let progress = scheduleData.schProgress
            cell.titleLabel.text = scheduleData.schTitle
            cell.periodLabel.text = period
            cell.contentLabel.text = scheduleData.schContents
            
            if progress < 0.5 {
                cell.progressView.tintColor = .red
            } else {
                cell.progressView.tintColor = .green
            }
            cell.progressView.progress = progress
            cell.setSchedule()
            cell.scheduleView.heightAnchor.constraint(equalToConstant: 229).isActive = true
        }
        return cell
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
                self.setCollectionViewInit()
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
    
    func getInviteCode() {
        TeamPageAPI.shared.getInviteCode(param: projectId) { result, error in
            if let error = error {
                print(error)
            } else {
                guard let code = result?.data?.result else { return }
                let inviteCode = code[0]
                print(inviteCode)
                self.code = inviteCode.code
            }
        }
    }
}
