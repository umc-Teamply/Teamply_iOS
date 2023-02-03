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
    let today = Date()
    var startDate: String? = nil
    var endDate: String?
    var sendDate: String?
    var sendIntervar: Double = 0.0

    // MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        dateInit()
        titleInit()
        scheduleInit()
        setCalendarView()
    }
    
    // MARK: - Method
    func dateInit() {
        startDate = today.toString(format: "YYYY.MM.dd")
        endDate = today.toString(format: "YYYY.MM.dd")
        sendDate = today.toString(format: "YYYY.MM.dd.E요일 ")
    }
    
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
            dateLabel.text = date.toString(format: "YYYY년 MM월 dd일 E요일 일정")
        }
        sendDate = date.toString(format: "YYYY.MM.dd.E요일 ")
        endDate = date.toString(format: "YYYY.MM.dd")
        
        dateLabel.textColor = .basic2
        dateLabel.font = .sub1
        
        setScheduleContent()
    }
    
    func calculateTimeInterval() -> Double {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd"

        let startDate = formatter.date(from: startDate!) ?? Date()
        let endDate = formatter.date(from: endDate!) ?? Date()

        let interval = endDate.timeIntervalSince(startDate)
        return interval
    }
    
    func isExistSchedule() -> Bool {
        return false
    }
    
    //MARK: - IBAction
    @IBAction func backToHome(_ sender: Any) {
        self.presentingViewController?.dismiss(animated: true)
    }
    
    
    @IBAction func registSchedule(_ sender: Any) {
        let registVC = UIStoryboard.init(name: "registSchedule", bundle: nil)
        
        guard let nextVC = registVC.instantiateViewController(withIdentifier: "registScheduleVC") as? registScheduleViewController else { return }
        
        nextVC.selectionDate = sendDate
        nextVC.interval = calculateTimeInterval()
        nextVC.modalPresentationStyle = .fullScreen
        self.present(nextVC, animated: true, completion: nil)
    }
}
