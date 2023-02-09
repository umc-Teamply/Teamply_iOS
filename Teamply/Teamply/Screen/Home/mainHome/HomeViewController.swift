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
    //@IBOutlet weak var teamPlayTitleLabel: UILabel!
    @IBOutlet weak var todayScheduleLabel: UILabel!
    @IBOutlet weak var todayScheduleContentLabel: UILabel!
    
    @IBOutlet weak var scheduleView: UIView!
    //@IBOutlet weak var teamPlayView: UIView!
    @IBOutlet weak var todayScheduleView: UIView!
    @IBOutlet weak var todayPlanView: UIView!
    @IBOutlet weak var projectCollectionView: UICollectionView!
    
    @IBOutlet weak var weeklyCalendarView: FSCalendar!
    @IBOutlet weak var collectionViewHeight: NSLayoutConstraint!
    
    let projectCell = "ProjectCell"
    let projectList = ["브랜드 경험 디자인", "공간 프로젝트", "UX 디자인"]
    let contentList = ["브랜드 경험 개선 프로젝트", "졸업 전시", "사용자 경험 개선"]
    let colorList = ["team1", "team2", "team3","team2"]
    let headCountList = [3, 4, 2]
    let termList = ["2022.10.01-2022.12.21", "2022.10.13-2022.11.27", "2022.10.31-2022.12.31"]
    // MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setTitleInit()
        setTodayPlayContent()
        setTodayScheduleContent()
        //setTeamPlay()
        setViewInit()
        setTodayDate()
        weeklyCalendarInit()
        
        setCollectionViewInit()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        var height: CGFloat = 0.0
        if projectList.count%2 == 0 {
            height = CGFloat(projectList.count/2*160)
        } else {
            height = CGFloat((projectList.count/2+1)*160) + 5
        }
        //projectCollectionView.collectionViewLayout.collectionViewContentSize.height
        collectionViewHeight.constant = height
        self.view.layoutIfNeeded()
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
                //w.font = .sub2
            }
        }
    }
    
    func setTitleInit() {
        userScheduleLabel.text = "이프로님의 일정"
        userScheduleLabel.font = .head1
        
        todayScheduleLabel.text = "오늘 일정"
        todayScheduleLabel.font = .sub1
        
        userTeamPlayLabel.text = "이프로님의 팀플"
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
    
//    func setTeamPlay() {
//        teamPlayTitleLabel.text = "팀프로젝트를\n등록해보세요"
//        teamPlayTitleLabel.font = .sub1
//        teamPlayTitleLabel.textColor = .gray3
//    }
    
    func setViewInit() {
        scheduleView.makeRound(radius: 10)
        scheduleView.makeShadow(UIColor.gray2!, 1, CGSize(width: 0, height: 11), 16)
        todayPlanView.makeRound(radius: 10)
        todayPlanView.makeShadow(UIColor.gray2!, 1, CGSize(width: 0, height: 11), 16)
        //teamPlayView.makeRound(radius: 10)
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
    
    @IBAction func tappedteamPlay(_ sender: Any) {
        let TeamPageVC = UIStoryboard.init(name: "TeamPage", bundle: nil)
        guard let nextVC = TeamPageVC.instantiateViewController(withIdentifier: "TeamPageVC") as? TeamPageViewController else { return }
        
        nextVC.modalPresentationStyle = .fullScreen
        self.present(nextVC, animated: true, completion: nil)
    }
    
}

extension HomeViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if projectList.isEmpty {
            return 1
        }
        return projectList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: projectCell, for: indexPath) as! ProjectCollectionViewCell
        
        if projectList.isEmpty {
            cell.projectColor = .gray1!
            cell.titleLabel.text = "팀프로젝트를\n등록해보세요"
            cell.setEmptyProject()
        } else {
            cell.projectColor = UIColor(named: colorList[indexPath.row])!
            cell.titleLabel.text = projectList[indexPath.row]
            cell.contentLabel.text = contentList[indexPath.row]
            cell.headCount = headCountList[indexPath.row]
            cell.termLabel.text = termList[indexPath.row]
            cell.setProjects()
        }
        cell.setProjectInit()
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        return CGSize(width: 161, height: 149)
    }
    
    func collectionView(_ collectionView: UICollectionView, shouldSelectItemAt indexPath: IndexPath) -> Bool {
        let TeamPageVC = UIStoryboard.init(name: "TeamPage", bundle: nil)
        guard let nextVC = TeamPageVC.instantiateViewController(withIdentifier: "TeamPageVC") as? TeamPageViewController else { return false}
        
        nextVC.modalPresentationStyle = .fullScreen
        self.present(nextVC, animated: true, completion: nil)
        
        return false
    }
}
