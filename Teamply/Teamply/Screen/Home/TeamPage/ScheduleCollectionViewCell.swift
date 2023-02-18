//
//  ScheduleCollectionViewCell.swift
//  Teamply
//
//  Created by 아라 on 2023/02/17.
//

import UIKit

class ScheduleCollectionViewCell: UICollectionViewCell {
    lazy var scheduleView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.isUserInteractionEnabled = true
        view.makeRound(radius: 12)
        view.backgroundColor = .basic1
        return view
    }()
    
    lazy var divisionView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.isUserInteractionEnabled = false
        view.heightAnchor.constraint(equalToConstant: 1).isActive = true
        view.backgroundColor = .gray0
        return view
    }()
    
    lazy var progressView: UIProgressView = {
        let view = UIProgressView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.isUserInteractionEnabled = false
        view.heightAnchor.constraint(equalToConstant: 10).isActive = true
        view.widthAnchor.constraint(equalToConstant: 132.87).isActive = true
        view.makeRound(radius: 7)
        view.trackTintColor = .gray0
        return view
    }()
    
    lazy var addScheduleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .sub2
        label.textColor = .gray2
        return label
    }()
    
    lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .head1
        label.textColor = .basic2
        return label
    }()
    
    lazy var periodLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .cap3
        label.textColor = .basic2
        return label
    }()
    
    lazy var contentLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        label.font = .sub2
        label.textColor = .basic2
        return label
    }()
    
    lazy var progressLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .cap3
        label.textColor = .basic2
        return label
    }()
    
    var progress: CGFloat!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.isUserInteractionEnabled = true
        self.isMultipleTouchEnabled = false
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setScheduleView() {
        NSLayoutConstraint.activate([
            contentView.centerYAnchor.constraint(equalTo: super.centerYAnchor)
        ])
        
        self.contentView.addSubview(scheduleView)
        NSLayoutConstraint.activate([
            scheduleView.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            scheduleView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            scheduleView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            scheduleView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 18),
            scheduleView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: 8)
        ])
    }
    func emptySchedule() {
        setScheduleView()
        scheduleView.addSubview(addScheduleLabel)
        addScheduleLabel.text = "+ 일정을 등록해보세요"
        NSLayoutConstraint.activate([
            addScheduleLabel.centerYAnchor.constraint(equalTo: scheduleView.centerYAnchor),
            addScheduleLabel.leadingAnchor.constraint(equalTo: scheduleView.leadingAnchor, constant: 27),
        ])
    }
    
    func setSchedule() {
        setScheduleView()
        scheduleView.addSubview(titleLabel)
        scheduleView.addSubview(periodLabel)
        scheduleView.addSubview(divisionView)
        scheduleView.addSubview(contentLabel)
        scheduleView.addSubview(progressLabel)
        scheduleView.addSubview(progressView)
        
        self.contentView.addSubview(scheduleView)
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: scheduleView.topAnchor, constant: 19),
            titleLabel.leadingAnchor.constraint(equalTo: scheduleView.leadingAnchor, constant: 22)
        ])
        
        NSLayoutConstraint.activate([
            periodLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 2),
            periodLabel.leadingAnchor.constraint(equalTo: scheduleView.leadingAnchor, constant: 22)
        ])
        
        NSLayoutConstraint.activate([
            divisionView.topAnchor.constraint(equalTo: periodLabel.bottomAnchor, constant: 12),
            divisionView.leadingAnchor.constraint(equalTo: scheduleView.leadingAnchor, constant: 22),
            divisionView.trailingAnchor.constraint(equalTo: scheduleView.trailingAnchor, constant: 22)
        ])
        
        NSLayoutConstraint.activate([
            contentLabel.topAnchor.constraint(equalTo: divisionView.bottomAnchor, constant: 14),
            contentLabel.leadingAnchor.constraint(equalTo: scheduleView.leadingAnchor, constant: 22)
        ])
        
        NSLayoutConstraint.activate([
            progressLabel.topAnchor.constraint(equalTo: contentLabel.bottomAnchor, constant: 46),
            progressLabel.leadingAnchor.constraint(equalTo: scheduleView.leadingAnchor, constant: 22)
        ])
        
        NSLayoutConstraint.activate([
            progressView.topAnchor.constraint(equalTo: progressLabel.bottomAnchor, constant: 10),
            progressView.leadingAnchor.constraint(equalTo: scheduleView.leadingAnchor, constant: 22)
        ])
        
        scheduleView.makeShadow(.gray2!, 1, CGSize(width: 0, height: 3), 10)
    }
}
