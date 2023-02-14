//
//  HomeViewController.swift
//  Teamply
//
//  Created by 아라 on 2023/01/11.
//

import UIKit
import SnapKit
import FSCalendar
import MaterialComponents

class HomeViewController: UIViewController, FSCalendarDelegate, FSCalendarDataSource, FSCalendarDelegateAppearance {
    
    //MARK: - IBOutlet
    @IBOutlet weak var userScheduleLabel: UILabel!
    @IBOutlet weak var todayPlanLabel: UILabel!
    @IBOutlet weak var todayDateLabel: UILabel!
    @IBOutlet weak var userTeamPlayLabel: UILabel!
    @IBOutlet weak var todayPlanContentLabel: UILabel!
    @IBOutlet weak var todayScheduleLabel: UILabel!
    @IBOutlet weak var todayScheduleContentLabel: UILabel!
    
    @IBOutlet weak var scheduleView: UIView!
    @IBOutlet weak var todayScheduleView: UIView!
    @IBOutlet weak var todayPlanView: UIView!
    @IBOutlet weak var projectCollectionView: UICollectionView!
    
    @IBOutlet weak var weeklyCalendarView: FSCalendar!
    @IBOutlet weak var collectionViewHeight: NSLayoutConstraint!


    // MARK: Properties
    let projectCell = "ProjectCell"
    var projectData: [ProjectInfo] = []
    var userName: String!
    var firstLoadFlag = true
    
    // MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        getUserInfo()
        getUserProjectInfo()
        
        setTodayPlayContent()
        setTodayScheduleContent()
        setViewInit()
        setTodayDate()
        weeklyCalendarInit()
        
        NotificationCenter.default.addObserver(
            self,
            selector: #selector(self.didDismissCreateNotification(_:)),
            name: NSNotification.Name("DismissCreateView"),
            object: nil
        )
    }
    
    // MARK: - @objc
    @objc func didDismissCreateNotification(_ notification: Notification) {
        DispatchQueue.main.async {
            self.getUserProjectInfo()
            self.viewDidLayoutSubviews()
            self.setCollectionViewInit()
            self.projectCollectionView.reloadData()
        }
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        var height: CGFloat = 0.0
        
        var projectCount = projectData.count
        
        switch projectCount {
        case 3...4:
            height = 320
        case 5...6:
            height = 480
        default:
            height = 160
        }
       
        collectionViewHeight.constant = height
        self.view.layoutIfNeeded()
    }
    
    // MARK: - @objc
      @objc func didDismissDetailNotification(_ notification: Notification) {
          DispatchQueue.main.async {
              self.projectCollectionView.reloadData()
          }
      }
    
    // MARK: - Method
    func setTodayDate() {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy년 MM월 dd일"
        let date = formatter.string(from: Date())
        todayDateLabel.text = date
        todayDateLabel.font = .sub1
        todayDateLabel.textColor = .basic2
        
    }
    
    func weeklyCalendarInit() {
        weeklyCalendarView.delegate = self
        weeklyCalendarView.dataSource = self
        
        weeklyCalendarView.scope = .week
        weeklyCalendarView.locale = Locale(identifier: "ko_KR")
        weeklyCalendarView.scrollEnabled = false
        weeklyCalendarView.firstWeekday = 2
        weeklyCalendarView.backgroundColor = .basic1
        
        weeklyCalendarView.headerHeight = 60
        weeklyCalendarView.appearance.headerDateFormat = ""
        weeklyCalendarView.appearance.headerMinimumDissolvedAlpha = 0.0
        
        weeklyCalendarView.appearance.weekdayFont = .cap2
        weeklyCalendarView.appearance.weekdayTextColor = .gray4
        weeklyCalendarView.weekdayHeight = 17
        
        weeklyCalendarView.appearance.titleOffset = CGPoint(x: 0, y: 5)
        weeklyCalendarView.appearance.titleFont = .cap2
        weeklyCalendarView.appearance.titleDefaultColor = .gray4
        weeklyCalendarView.appearance.titleWeekendColor = .gray4
        
        weeklyCalendarView.appearance.titleTodayColor = .basic2
        
        weeklyCalendarView.appearance.todayColor = .clear
        weeklyCalendarView.appearance.todaySelectionColor = .none
        
        let weekFormatter = DateFormatter()
        weekFormatter.dateFormat = "E"
        let weekday = weekFormatter.string(from: Date())
        
        let weekdayLabel =  weeklyCalendarView.calendarWeekdayView.weekdayLabels
        
        for w in weekdayLabel {
            if w.text == weekday {
                w.textColor = .basic2
            }
        }
    }
    
    func setTitleInit() {
        userScheduleLabel.text = userName+"님의 일정"
        userScheduleLabel.font = .head1
        
        todayScheduleLabel.text = "오늘 일정"
        todayScheduleLabel.font = .sub1
        
        userTeamPlayLabel.text = userName+"님의 팀플"
        userTeamPlayLabel.font = .head1
        
        todayPlanLabel.text = "오늘 계획"
        todayPlanLabel.font = .sub1
    }
    
    func setTodayScheduleContent() {
        todayScheduleContentLabel.text = "팀 프로젝트를 등록해보세요"
        todayScheduleContentLabel.font = .body
        todayScheduleContentLabel.textColor = .gray3
    }
    
    func setTodayPlayContent() {
        todayPlanContentLabel.text = "아직 계획이 없어요"
        todayPlanContentLabel.font = .body
        todayPlanContentLabel.textColor = .gray3
    }
    
    func setViewInit() {
        scheduleView.makeRound(radius: 10)
        scheduleView.makeShadow(UIColor.gray2!, 1, CGSize(width: 0, height: 11), 16)
        todayPlanView.makeRound(radius: 10)
        todayPlanView.makeShadow(UIColor.gray2!, 1, CGSize(width: 0, height: 11), 16)
    }
    
    func setCollectionViewInit() {
        projectCollectionView.delegate = self
        projectCollectionView.dataSource = self
        
        let flowLayout = LeftAlignedCollectionViewFlowLayout()
        flowLayout.minimumInteritemSpacing = 17
        flowLayout.minimumLineSpacing = 17
        flowLayout.sectionInset = .init(top: 0, left: 0, bottom: 0, right: 0)
        flowLayout.estimatedItemSize = UICollectionViewFlowLayout.automaticSize
        projectCollectionView.setCollectionViewLayout(flowLayout, animated: true)
        
        projectCollectionView.register(ProjectCollectionViewCell.self, forCellWithReuseIdentifier: projectCell)
        
    }
    
    // MARK: - IBAction
    @IBAction func addTeamProjectButton(_ sender: UIButton) {
        let vc = storyboard?.instantiateViewController(withIdentifier: "addTeamProjectVC") as! addTeamProjectViewController
        let bottomSheet: MDCBottomSheetController = MDCBottomSheetController(contentViewController: vc)
        let shapeGenerator = MDCRectangleShapeGenerator()
        let cornerTreatment = MDCRoundedCornerTreatment(radius: 20)
        
        shapeGenerator.topLeftCorner = cornerTreatment
        shapeGenerator.topRightCorner = cornerTreatment
        
        bottomSheet.setShapeGenerator(shapeGenerator, for: .preferred)
        bottomSheet.setShapeGenerator(shapeGenerator, for: .extended)
        bottomSheet.setShapeGenerator(shapeGenerator, for: .closed)
        bottomSheet.mdc_bottomSheetPresentationController?.preferredSheetHeight = 180
        bottomSheet.scrimColor = UIColor.basic2!.withAlphaComponent(0.7)
        
        present(bottomSheet, animated: true, completion: nil)
    }
    
    // MARK: - Gesture
    @IBAction func scheduleViewTap(_ sender: Any) {
        //스토리보드 이름
        let scheduleVC = UIStoryboard.init(name: "schedule", bundle: nil)
        //스토리보드 ID
        guard let nextVC = scheduleVC.instantiateViewController(withIdentifier: "scheduleVC") as? scheduleViewController else { return }
        
        nextVC.modalPresentationStyle = .fullScreen
        self.present(nextVC, animated: true, completion: nil)
    }
    
}

extension HomeViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if projectData.isEmpty {
            return 1
        }
        return projectData.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: projectCell, for: indexPath) as! ProjectCollectionViewCell
        
        if projectData.isEmpty {
            cell.projectColor = .gray1!
            cell.titleLabel.text = "팀프로젝트를\n등록해보세요"
            cell.setEmptyProject()
        } else {
            let projectInfo = projectData[indexPath.row]
            
            cell.projectColor = UIColor(named: projectInfo.color)!
            cell.titleLabel.text = projectInfo.title
            cell.contentLabel.text = projectInfo.contents
            cell.headCount = projectInfo.headcount
            cell.projectId = projectInfo.projectId
            print(projectInfo.projectId)
            let start = projectInfo.startDate
            let end = projectInfo.endDate
            cell.termLabel.text = start+"-"+end
            cell.setProjects()
        }
        cell.setProjectInit()
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, shouldSelectItemAt indexPath: IndexPath) -> Bool {
        var projectId = projectData[indexPath.row].projectId
        var projectColor = projectData[indexPath.row].color
        var headcount = projectData[indexPath.row].headcount
        
        let TeamPageVC = UIStoryboard.init(name: "TeamPage", bundle: nil)
        guard let nextVC = TeamPageVC.instantiateViewController(withIdentifier: "TeamPageVC") as? TeamPageViewController else { return true }
        
        nextVC.modalPresentationStyle = .fullScreen
        nextVC.projectId = projectId
        nextVC.headerView.backgroundColor = UIColor(named: projectColor)
        nextVC.headcount = headcount
        self.present(nextVC, animated: true, completion: nil)
        
        return false
    }
}

extension HomeViewController {
    func getUserInfo() {
        HomeAPI.shared.getUserInfo { [weak self] userInfoData in
            guard let infoData = userInfoData else { return }
            let info = infoData.data?.result[0]
            let name = info?.userName
            self?.userName = name
            self?.setTitleInit()
        }
    }
    
    func getUserProjectInfo() {
        HomeAPI.shared.getUserProjectInfo { [weak self] infoData in
            guard let infoData = infoData else { return }
            let info = infoData.data?.result
            self?.projectData = info!
            self?.setCollectionViewInit()
        }
    }
}
