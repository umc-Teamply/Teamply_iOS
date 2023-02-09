//
//  ProjectCollectionViewCell.swift
//  Teamply
//
//  Created by 아라 on 2023/02/10.
//

import UIKit

class ProjectCollectionViewCell: UICollectionViewCell {
    lazy var titleLabel:UILabel = {
        let label = UILabel()
        label.font = .sub2
        label.textColor = .basic1
        label.textAlignment = .justified
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.isUserInteractionEnabled = true
        self.isMultipleTouchEnabled = true
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setEmptyProject() {
        contentView.makeRound(radius: 10)
        contentView.backgroundColor = .gray1
        
        contentView.heightAnchor.constraint(equalToConstant: 149).isActive = true
        contentView.widthAnchor.constraint(equalToConstant: 161).isActive = true
        
        contentView.addSubview(titleLabel)
        titleLabel.text = "팀프로젝트를\n등록해보세요"
        titleLabel.textColor = .gray3
        titleLabel.numberOfLines = 2
        
        NSLayoutConstraint.activate([
            titleLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 17),
            titleLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 17)
        ])
    }
}
