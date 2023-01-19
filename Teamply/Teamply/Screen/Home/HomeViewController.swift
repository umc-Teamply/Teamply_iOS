//
//  HomeViewController.swift
//  Teamply
//
//  Created by 아라 on 2023/01/11.
//

import UIKit
import SnapKit
import FSCalendar

class HomeViewController: UIViewController, FSCalendarDelegate, FSCalendarDataSource, FSCalendarDelegateAppearance {
    @IBOutlet weak var userScheduleLabel: UILabel!
    @IBOutlet weak var todayPlanLabel: UILabel!
    @IBOutlet weak var todayDateLabel: UILabel!
    @IBOutlet weak var userTeamPlayLabel: UILabel!
    @IBOutlet weak var todayPlanContentLabel: UILabel!
    @IBOutlet weak var teamPlayTitleLabel: UILabel!
    @IBOutlet weak var todayScheduleLabel: UILabel!
    @IBOutlet weak var todayScheduleContentLabel: UILabel!
    
    @IBOutlet weak var scheduleView: UIView!
    @IBOutlet weak var weeklyCalendar: UIView!
    @IBOutlet weak var teamPlayView: UIView!
    @IBOutlet weak var todayScheduleView: UIView!
    @IBOutlet weak var todayPlanView: UIView!
    
    @IBOutlet weak var weeklyCalendarView: FSCalendar!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        weeklyCalendarView.delegate = self
        weeklyCalendarView.dataSource = self
        
        setTitleInit()
        setTodayPlayContent()
        setTodayScheduleContent()
        setTeamPlay()
        setViewInit()
        setTodayDate()
        weeklyCalendarInit()
    }

    func setTodayDate() {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy년 MM월 dd일"
        let date = formatter.string(from: Date())
        todayDateLabel.text = date
        todayDateLabel.font = .sub1
        todayDateLabel.textColor = .basic2
    }
    
    func weeklyCalendarInit() {
        //weeklyCalendarView.scope = .week
        weeklyCalendarView.locale = Locale(identifier: "ko_KR")
        weeklyCalendarView.scrollEnabled = false
        weeklyCalendarView.headerHeight = 57
        weeklyCalendarView.appearance.headerDateFormat = " "
        weeklyCalendarView.appearance.headerMinimumDissolvedAlpha = 0.0
        weeklyCalendarView.firstWeekday = 2
        weeklyCalendarView.backgroundColor = .basic1
        
        weeklyCalendarView.appearance.subtitleDefaultColor = .gray
        weeklyCalendarView.appearance.subtitleTodayColor = .basic2

        weeklyCalendarView.appearance.weekdayFont = .cap2
        weeklyCalendarView.appearance.weekdayTextColor = .gray4
        weeklyCalendarView.weekdayHeight = 17
        
        weeklyCalendarView.appearance.titleOffset = CGPoint(x: 0, y: 13)
        weeklyCalendarView.appearance.titleFont = .cap2
        weeklyCalendarView.appearance.titleDefaultColor = .gray4
        weeklyCalendarView.appearance.titleWeekendColor = .gray4
        weeklyCalendarView.appearance.todayColor = .clear
        
        weeklyCalendarView.appearance.titleTodayColor = .basic2
        weeklyCalendarView.appearance.todaySelectionColor = .none

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
    
    func setTeamPlay() {
        teamPlayTitleLabel.text = "팀프로젝트를\n등록해보세요"
        teamPlayTitleLabel.font = .sub1
        teamPlayTitleLabel.textColor = .gray3
    }
    
    func setViewInit() {
        scheduleView.makeRound(radius: 10)
        scheduleView.makeShadow(UIColor.gray2!, 1, CGSize(width: 0, height: 11), 16)
        todayPlanView.makeRound(radius: 10)
        todayPlanView.makeShadow(UIColor.gray2!, 1, CGSize(width: 0, height: 11), 16)
        teamPlayView.makeRound(radius: 10)
    }
    
    @IBAction func addTeamProjectButton(_ sender: Any) {
    }
    
}
