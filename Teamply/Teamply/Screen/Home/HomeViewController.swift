//
//  HomeViewController.swift
//  Teamply
//
//  Created by 아라 on 2023/01/11.
//

import UIKit
import SnapKit
import FSCalendar

class HomeViewController: UIViewController, FSCalendarDelegate, FSCalendarDataSource, FSCalendarDelegateAppearance{
    
    @IBOutlet weak var userSecheduleLabel: UILabel!
    @IBOutlet weak var todayPlanLabel: UILabel!
    @IBOutlet weak var userTeamplay: UILabel!
    @IBOutlet weak var calendarOrigin: FSCalendar! {
        didSet{
            calendarOrigin.delegate = self
            calendarOrigin.dataSource = self
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        calendarStyle()
    }
    
    @IBAction func addTeamProject(_ sender: Any) {
    }
    
    func calendarStyle() {
        calendarOrigin.locale = Locale(identifier: "ko_KR")
        
        calendarOrigin.scope = .week // 주간달력
        calendarOrigin.firstWeekday = 2 // 월요일부터 시작
        calendarOrigin.headerHeight = 23 // YYYY년 M월 표시부 영역 높이
        calendarOrigin.weekdayHeight = 19 // 날짜 표시부 행의 높이
        calendarOrigin.appearance.headerMinimumDissolvedAlpha = 0.0 //헤더 좌,우측 흐릿한 글씨 삭제
        calendarOrigin.appearance.headerTitleAlignment = .left
        calendarOrigin.appearance.headerDateFormat = "YYYY년 M월 D일 E요일" //날짜(헤더) 표시 형식
        calendarOrigin.appearance.headerTitleColor = .black //2021년 1월(헤더) 색
        calendarOrigin.appearance.headerTitleFont = UIFont.systemFont(ofSize: 16) //타이틀 폰트 크기
               
               
            //MARK: -캘린더(날짜 부분) 관련
        //calendarOrigin.backgroundColor = .white // 배경색
        calendarOrigin.appearance.weekdayTextColor = .gray3 //요일(월,화,수..) 글씨 색
        //calendarOrigin.appearance.selectionColor = .none //선택 된 날의 동그라미 색
        calendarOrigin.appearance.titleWeekendColor = .gray3 //주말 날짜 색
        calendarOrigin.appearance.titleDefaultColor = .gray3 //기본 날짜 색
                
                
            //MARK: -오늘 날짜(Today) 관련
        calendarOrigin.appearance.titleTodayColor = .basic2 //Today에 표시되는 특정 글자색
        calendarOrigin.appearance.todayColor = .clear //Today에 표시되는 선택 전 동그라미 색
        calendarOrigin.appearance.todaySelectionColor = .none  //Today에 표시되는 선택 후 동그라미 색
                
                
            // Month 폰트 설정
        //calendarOrigin.appearance.headerTitleFont = .sub2
                
                
            // day 폰트 설정
        //calendarOrigin.appearance.titleFont = .cap2
        
        }
}
