//
//  scheduleViewController.swift
//  Teamply
//
//  Created by 아라 on 2023/01/26.
//

import UIKit
import Foundation
import FSCalendar

class scheduleViewController: UIViewController, FSCalendarDelegate, FSCalendarDataSource, FSCalendarDelegateAppearance {
    // MARK: - IBOutlet
    @IBOutlet weak var userScheduleLabel: UILabel!
    @IBOutlet weak var calendarView: FSCalendar!
    @IBOutlet weak var dateLabel: UILabel!
    //@IBOutlet weak var scheduleTableView: UITableView!
    @IBOutlet weak var schedulContentLabel: UILabel!
    
    // MARK: - Properties
    
    // MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        titleInit()
        scheduleInit()
        setCalendarView()
    }
    
    // MARK: - Method
    func titleInit() {
        userScheduleLabel.text = "이프로님의 일정"
        userScheduleLabel.font = .head1
        userScheduleLabel.textColor = .basic2
    }
    
    func scheduleInit() {
        dateLabel.text = "오늘 일정"
        dateLabel.textColor = .basic2
        dateLabel.font = .sub1
        
        setScheduleContent()
    }
    
    func setScheduleContent() {
        if isExistSchedule() {
            
        }
        else {
            schedulContentLabel.text = "일정이 없습니다"
            schedulContentLabel.font = .cap2
            schedulContentLabel.textColor = .gray4
        }
    }
    func setCalendarView() {
        calendarView.delegate = self
        calendarView.dataSource = self
        
        // 달력 기본 설정
        calendarView.locale = Locale(identifier: "ko_KR")
        calendarView.scrollEnabled = true
        calendarView.scrollDirection = .horizontal
        calendarView.firstWeekday = 2
        calendarView.backgroundColor = .basic1
        calendarView.appearance.titlePlaceholderColor = .gray2
        
        // 맨 위 날짜 부분 설정
        calendarView.headerHeight = 75
        calendarView.appearance.headerDateFormat = "yyyy년 MM월"
        calendarView.appearance.headerTitleAlignment = .center
        calendarView.appearance.headerTitleFont = .sub1
        calendarView.appearance.headerTitleColor = .basic2
        calendarView.appearance.headerMinimumDissolvedAlpha = 0.0
        
        // 요일 설정
        calendarView.appearance.weekdayFont = .cap2
        calendarView.appearance.weekdayTextColor = .basic2
        calendarView.weekdayHeight = 19
        
        // 날짜 설정
        //calendarView.appearance.titleOffset = CGPoint(x: 0, y: 5)
        calendarView.appearance.titleFont = .cap2
        calendarView.appearance.titleDefaultColor = .gray4
        calendarView.appearance.titleWeekendColor = .gray4
        
        // 오늘 날짜 설정
        calendarView.appearance.titleTodayColor = .basic2
        calendarView.appearance.todayColor = .gray0
        
        // 선택한 날짜 설정
        calendarView.appearance.titleSelectionColor = .basic2
        calendarView.appearance.selectionColor = .gray0
    }
    
    // 날짜 선택 했을 때 호출되는 메소드
    func calendar(_ calendar: FSCalendar, didSelect date: Date, at monthPosition: FSCalendarMonthPosition) {
        let current = Calendar.current
        
        calendarView.appearance.titleTodayColor = .gray4
        calendarView.appearance.todayColor = .clear
        
        if current.isDateInToday(date) {
            dateLabel.text = "오늘 일정"
        }
        else {
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "YYYY년 MM월 DD일 E요일 일정"
            dateLabel.text =  dateFormatter.string(from: date)
        }
        dateLabel.textColor = .basic2
        dateLabel.font = .sub1
        
        setScheduleContent()
    }
    
    func isExistSchedule() -> Bool {
        return false
    }
    
    //MARK: - IBAction
    @IBAction func backToHome(_ sender: Any) {
        self.presentingViewController?.dismiss(animated: true)
    }
    
    
    @IBAction func registSchedule(_ sender: Any) {
    }
}
