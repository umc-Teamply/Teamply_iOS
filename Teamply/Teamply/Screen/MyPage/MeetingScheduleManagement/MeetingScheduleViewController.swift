//
//  MeetingScheduleViewController.swift
//  Teamply
//
//  Created by 아라 on 2023/01/29.
//

import UIKit
import SnapKit

class MeetingScheduleViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout, UICollectionViewDataSource {
    
    // MARK: - IBOutlet
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var possibleView: UIView!
    @IBOutlet weak var impossibleView: UIView!
    @IBOutlet weak var possibleLabel: UILabel!
    @IBOutlet weak var impossibleLabel: UILabel!
    @IBOutlet weak var messageLabel: UILabel!
    @IBOutlet weak var toggleButton: UIButton!
    @IBOutlet weak var weekdayStackView: UIStackView!
    @IBOutlet weak var timeStackView: UIStackView!
    @IBOutlet weak var scheduleCollectionView: UICollectionView!
    
    // MARK: - Properties
    let weekdayArray: [String] = ["월", "화", "수", "목", "금", "토", "일"]
    var weekdayLabelArray: [UILabel] = []
    var timeLabelArray: [UILabel] = []
    let timeCell = "TimeViewCell"
    var editable: Bool = false
    
    // MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        componentInit()
        setWeekdayStackView()
        setTimeStackView()
        setCollectionView()
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
        
        toggleButton.backgroundColor = .basic2
        toggleButton.titleLabel!.font = .btn
        toggleButton.titleLabel?.textColor = .basic1
        toggleButton.tintColor = .basic1
        toggleButton.makeRound(radius: 10)
        if editable {
            toggleButton.setTitle("선택완료", for: .normal)
        } else {
            toggleButton.setTitle("수정하기", for: .normal)
        }
    }
    
    func setButtonMode() {
        if editable {
            toggleButton.setTitle("선택완료", for: .normal)
        } else {
            toggleButton.setTitle("수정하기", for: .normal)
        }
    }
    
    func setWeekdayStackView() {
        for w in weekdayArray {
            let weekdayLabel: UILabel = {
                let week = UILabel()
                
                week.text = w
                week.textColor = .basic2
                week.font = .body
                week.textAlignment = .left
                week.fs_width = 15
                week.translatesAutoresizingMaskIntoConstraints = false
                
                return week
            }()
            weekdayLabelArray.append(weekdayLabel)
        }
        
        weekdayLabelArray.map {
            weekdayStackView.addArrangedSubview($0)
        }
    }
    
    func setTimeStackView() {
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
    
    func setCollectionView() {
        scheduleCollectionView.delegate = self
        scheduleCollectionView.dataSource = self
        
        let flowLayout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        flowLayout.minimumInteritemSpacing = 1
        flowLayout.minimumLineSpacing = 1
        scheduleCollectionView.setCollectionViewLayout(flowLayout, animated: true)
        
        scheduleCollectionView.backgroundColor = .gray2
        scheduleCollectionView.makeRound(radius: 10)
        scheduleCollectionView.layer.borderColor = UIColor.gray2?.cgColor
        scheduleCollectionView.layer.borderWidth = 1
        scheduleCollectionView.register(TimeViewCell.self, forCellWithReuseIdentifier: timeCell)
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        133
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        var cell = UICollectionViewCell()
        
        cell = collectionView.dequeueReusableCell(withReuseIdentifier: timeCell, for: indexPath) as! TimeViewCell
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: scheduleCollectionView.frame.width/8+4.5, height: scheduleCollectionView.frame.height/20+0.2)
       }
    
    // 셀 선택 했을 때
    func collectionView(_ collectionView: UICollectionView, shouldSelectItemAt indexPath: IndexPath) -> Bool {
        guard let cell = collectionView.cellForItem(at: indexPath) as? TimeViewCell else {
            return true
        }
        if editable {
            if cell.isSelected {
                collectionView.deselectItem(at: indexPath, animated: true)
                cell.backgroundColor = .basic1
                return false
            } else {
                cell.backgroundColor = .gray1
                return true
            }
        }
        return false
    }
    
    // MARK: - IBAction
    
    @IBAction func selectMode(_ sender: Any) {
        if editable {
            editable = false
        } else {
            editable = true
        }
        setButtonMode()
    }
    @IBAction func backToMypage(_ sender: Any) {
        self.presentingViewController?.dismiss(animated: true)
    }
    
    // MARK: - Gesture
    @IBAction func timeCellDragGesture(_ sender: Any) {
    }
    
}

