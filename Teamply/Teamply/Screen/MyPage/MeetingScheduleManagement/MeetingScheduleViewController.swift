//
//  MeetingScheduleViewController.swift
//  Teamply
//
//  Created by 아라 on 2023/01/29.
//

import UIKit
import SnapKit

class MeetingScheduleViewController: UIViewController {
    // MARK: - IBOutlet
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var possibleView: UIView!
    @IBOutlet weak var impossibleView: UIView!
    @IBOutlet weak var possibleLabel: UILabel!
    @IBOutlet weak var impossibleLabel: UILabel!
    @IBOutlet weak var messageLabel: UILabel!
    
    @IBOutlet weak var weekdayStackView: UIStackView!
    @IBOutlet weak var mondayLabel: UILabel!
    @IBOutlet weak var tuesdayLabel: UILabel!
    @IBOutlet weak var wednesdayLabel: UILabel!
    @IBOutlet weak var thursdayLabel: UILabel!
    @IBOutlet weak var fridayLabel: UILabel!
    @IBOutlet weak var saturdayLabel: UILabel!
    @IBOutlet weak var sundayLabel: UILabel!
    
    @IBOutlet weak var timeStackView: UIStackView!
    // MARK: - Properties
    var timeLabelArray: [UILabel] = []
    // MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        componentInit()
    }
    // MARK: - Method
    func componentInit() {
        titleLabel.text = "내 회의 시간표 관리"
        titleLabel.textColor = .basic2
        titleLabel.font = .head1
        
        possibleLabel.text = "회의가 가능한 시간"
        possibleLabel.textColor = .basic2
        possibleLabel.font = .cap3
        
        impossibleLabel.text = "회의가 불가능한 시간"
        impossibleLabel.textColor = .basic2
        impossibleLabel.font = .cap3
        
        messageLabel.text = "평소에 회의가 가능한 시간을 선택해주세요"
        messageLabel.textColor = .basic2
        messageLabel.font = .body
        
        possibleView.backgroundColor = .basic1
        possibleView.layer.borderColor = UIColor.gray2?.cgColor
        possibleView.layer.borderWidth = 1
        possibleView.makeRound(radius: 3)
        
        impossibleView.backgroundColor = .gray1
        impossibleView.layer.borderColor = UIColor.gray2?.cgColor
        impossibleView.layer.borderWidth = 1
        impossibleView.makeRound(radius: 3)
        
        mondayLabel.text = "월"
        mondayLabel.textColor = .basic2
        mondayLabel.font = .body
        
        tuesdayLabel.text = "화"
        tuesdayLabel.textColor = .basic2
        tuesdayLabel.font = .body
        
        wednesdayLabel.text = "수"
        wednesdayLabel.textColor = .basic2
        wednesdayLabel.font = .body
        
        thursdayLabel.text = "목"
        thursdayLabel.textColor = .basic2
        thursdayLabel.font = .body
        
        fridayLabel.text = "금"
        fridayLabel.textColor = .basic2
        fridayLabel.font = .body
        
        saturdayLabel.text = "토"
        saturdayLabel.textColor = .basic2
        saturdayLabel.font = .body
        
        sundayLabel.text = "일"
        sundayLabel.textColor = .basic2
        sundayLabel.font = .body
        
        for i in 6...24 {
            let timeLabel: UILabel = {
                let time = UILabel()
                
                time.text = String(i)
                time.textColor = .basic2
                time.font = .body
                time.textAlignment = .center
                time.sizeToFit()
                time.translatesAutoresizingMaskIntoConstraints = false
                
                return time
            }()
            timeLabelArray.append(timeLabel)
        }
        
        timeLabelArray.map {
            self.timeStackView.addArrangedSubview($0)
        }
    }
    
    // MARK: - IBAction

}
