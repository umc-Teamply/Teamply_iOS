//
//  ScheduleCollectionViewCell.swift
//  Teamply
//
//  Created by 아라 on 2023/02/17.
//

import UIKit

class ScheduleCollectionViewCell: UICollectionViewCell {
    lazy var addScheduleView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.isUserInteractionEnabled = true
        view.makeRound(radius: 12)
        view.heightAnchor.constraint(equalToConstant: 64).isActive = true
        //view.widthAnchor.constraint(equalToConstant: 342).isActive = true
        view.backgroundColor = .basic1
        return view
    }()
    
    lazy var addScheduleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .sub2
        label.textColor = .gray2
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.isUserInteractionEnabled = true
        self.isMultipleTouchEnabled = false
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func emptySchedule() {
        NSLayoutConstraint.activate([
            contentView.centerYAnchor.constraint(equalTo: super.centerYAnchor),
           
        ])
        
        self.contentView.addSubview(addScheduleView)
        NSLayoutConstraint.activate([
            addScheduleView.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            addScheduleView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            addScheduleView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor)
        ])
        
        addScheduleView.addSubview(addScheduleLabel)
        addScheduleLabel.text = "+ 일정을 등록해보세요"
        NSLayoutConstraint.activate([
            addScheduleLabel.centerYAnchor.constraint(equalTo: addScheduleView.centerYAnchor),
            addScheduleLabel.leadingAnchor.constraint(equalTo: addScheduleView.leadingAnchor, constant: 27),
        ])
    }
}
