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
        label.textAlignment = .left
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var contentLabel:UILabel = {
        let label = UILabel()
        label.font = .cap3
        label.textColor = .basic1
        label.textAlignment = .left
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var termLabel:UILabel = {
        let label = UILabel()
        label.font = .cap3
        label.textColor = .basic1
        label.textAlignment = .left
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var divisionView:UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .basic1
        view.heightAnchor.constraint(equalToConstant: 1).isActive = true
        return view
    }()
    
    lazy var memberView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .horizontal
        stackView.contentMode = .scaleToFill
        stackView.spacing = 7
        
        return stackView
    }()
    
    var projectColor:UIColor = .gray1!
    var headCount: Int = 0
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.isUserInteractionEnabled = true
        self.isMultipleTouchEnabled = true
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setProjectInit() {
        contentView.makeRound(radius: 10)
        contentView.backgroundColor = projectColor
        contentView.heightAnchor.constraint(equalToConstant: 149).isActive = true
        contentView.widthAnchor.constraint(equalToConstant: 161).isActive = true
    }
    
    func setEmptyProject() {
        contentView.addSubview(titleLabel)
        titleLabel.textColor = .gray3
        titleLabel.numberOfLines = 2
        
        NSLayoutConstraint.activate([
            titleLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 17),
            titleLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 17)
        ])
    }
    
    func setProjects() {
        self.contentView.addSubview(titleLabel)
        
        NSLayoutConstraint.activate([
            titleLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            titleLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 16),
            titleLabel.heightAnchor.constraint(equalToConstant: 23)
        ])
        
        self.contentView.addSubview(contentLabel)

        NSLayoutConstraint.activate([
            contentLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            contentLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 4),
            contentLabel.heightAnchor.constraint(equalToConstant: 16)
        ])

        self.contentView.addSubview(self.memberView)
        let width = headCount*27

        NSLayoutConstraint.activate([
            memberView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            memberView.topAnchor.constraint(equalTo: contentLabel.bottomAnchor, constant: 14),
            memberView.widthAnchor.constraint(equalToConstant: CGFloat(width)),
            memberView.heightAnchor.constraint(equalToConstant: 20)
        ])

        for _ in 0...headCount {
            let image:UIImageView = {
                let view = UIImageView()
                view.image = UIImage(named: "defaultProfile")
                view.makeRound(radius: 10)
                view.translatesAutoresizingMaskIntoConstraints = false
                return view
            }()
            
            memberView.addArrangedSubview(image)
            
            image.heightAnchor.constraint(equalToConstant: 20).isActive = true
            image.widthAnchor.constraint(equalToConstant: 20).isActive = true
        }
        
        self.contentView.addSubview(divisionView)
        
        divisionView.backgroundColor = .basic1
        NSLayoutConstraint.activate([
            divisionView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 11),
            divisionView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -11),
            divisionView.topAnchor.constraint(equalTo: memberView.bottomAnchor, constant: 13)
        ])

        contentView.addSubview(termLabel)

        NSLayoutConstraint.activate([
            termLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            termLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -17),
            termLabel.heightAnchor.constraint(equalToConstant: 16)
        ])
    }
}
