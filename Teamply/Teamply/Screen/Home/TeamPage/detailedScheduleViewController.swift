//
//  detailedScheduleViewController.swift
//  Teamply
//
//  Created by Lee Jinkyung on 2023/02/02.
//

import UIKit

class detailedScheduleViewController: UIViewController {
    
    @IBOutlet weak var detailedScheduleView0: UIView!
    @IBOutlet weak var detailedScheduleView1: UIView!
    
    @IBOutlet weak var weekScheduleLabel0: UILabel!
    @IBOutlet weak var schedulePeriod0: UILabel!
    @IBOutlet weak var weekToDoLabel0: UILabel!
    @IBOutlet weak var percentageLabel0: UILabel!
    
    @IBOutlet weak var weekScheduleLabel1: UILabel!
    @IBOutlet weak var schedulePeriod1: UILabel!
    @IBOutlet weak var weekToDoLabel1: UILabel!
    @IBOutlet weak var percentageLabel1: UILabel!
    
    @IBOutlet weak var progressView0: UIProgressView!
    @IBOutlet weak var progressView1: UIProgressView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setStyle()
        progressView0.progress = 0.0
        progressView1.progress = 0.25
        progressView1.tintColor = .team1
    }
    
    func setStyle() {
        detailedScheduleView0.makeRound(radius: 10)
        detailedScheduleView0.backgroundColor = .basic1
        
        detailedScheduleView1.makeRound(radius: 10)
        detailedScheduleView1.backgroundColor = .basic1
        
        weekScheduleLabel0.text = "3주차 주제 발전"
        weekScheduleLabel0.font = .head1
        weekScheduleLabel0.textColor = .basic2
        
        schedulePeriod0.text = "10.18.화 ~ 10.19.수"
        schedulePeriod0.font = .cap3
        schedulePeriod0.textColor = .basic2
        
        weekToDoLabel0.text = "확정된 주제 추가 조사"
        weekToDoLabel0.font = .sub2
        weekToDoLabel0.textColor = .basic2
        
        percentageLabel0.text = "팀 과제 0% 진행중이에요"
        percentageLabel0.font = .cap3
        percentageLabel0.textColor = .basic2
        
        
        weekScheduleLabel1.text = "1주차 주제 선정"
        weekScheduleLabel1.font = .head1
        weekScheduleLabel1.textColor = .basic2
        
        schedulePeriod1.text = "10.18.화 ~ 10.19.수"
        schedulePeriod1.font = .cap3
        schedulePeriod1.textColor = .basic2
        
        weekToDoLabel1.text = "주제 3가지 이상 선정 후 이유 작성"
        weekToDoLabel1.font = .sub2
        weekToDoLabel1.textColor = .basic2
        
        percentageLabel1.text = "팀 과제 25% 진행중이에요"
        percentageLabel1.font = .cap3
        percentageLabel1.textColor = .basic2
        
        
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
