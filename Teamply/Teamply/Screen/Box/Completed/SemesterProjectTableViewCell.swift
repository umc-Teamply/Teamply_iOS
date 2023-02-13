//
//  SemesterProjectTableViewCell.swift
//  Teamply
//
//  Created by 아라 on 2023/02/01.
//

import UIKit
import SnapKit

class SemesterProjectTableViewCell: UITableViewCell {
    @IBOutlet weak var semesterLabel: UILabel!
    @IBOutlet weak var semesterView: UIView!
    @IBOutlet weak var projectStackView: UIStackView!
    
    var projectLists: [[String]]!
    var titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .sub1
        label.textColor = .basic2
        return label
    }()
    var subtitleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .cap2
        label.textColor = .basic2
        return label
    }()
    var termLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .cap3
        label.textColor = .basic2
        return label
    }()
    override func awakeFromNib() {
        super.awakeFromNib()
        setSemesterView()
        //setProjectStackView()
    }

    func setSemesterView() {
        semesterView.backgroundColor = .gray0
        setSemesterLabel()
    }
    
    func setSemesterLabel() {
        semesterLabel.translatesAutoresizingMaskIntoConstraints = false
        semesterLabel.textColor = .gray3
        semesterLabel.font = .cap3
        semesterLabel.backgroundColor = .gray1
        semesterLabel.makeRound(radius: 15)
    }
    
    func setProjectStackView() {
        
        for p in projectLists {
            setProjectViewLayout(p: p)
        }
    }
    
    func setProjectViewLayout(p: [String]){
        let project: UIView = {
            let view = UIView()
            view.translatesAutoresizingMaskIntoConstraints = false
            view.backgroundColor = .basic1
            view.heightAnchor.constraint(equalToConstant: 114).isActive = true
            view.leadingAnchor.constraint(equalTo: projectStackView.leadingAnchor)
            view.trailingAnchor.constraint(equalTo: projectStackView.trailingAnchor)
            view.topAnchor.constraint(equalTo: projectStackView.topAnchor)
            return view
        }()
        projectStackView.addArrangedSubview(project)
        
        var idx = 0
        var top: CGFloat = 0
        var font: UIFont = .sub1
        for l in p {
            switch idx {
            case 0:
                top = 15
                idx += 1
                font = .sub1
                break
            case 1:
                top = 43
                idx += 1
                font = .cap2
                break
            case 2:
                top = 74
                font = .cap3
                break
            default:
                break
            }
            addProjectLabel(view: project, text: l, top: top, font: font)
        }
        
    }
    
    func addProjectLabel(view: UIView, text: String, top: CGFloat, font: UIFont) {
        let component: UILabel = {
            let label = UILabel()
            
            label.text = text
            label.textColor = .basic2
            label.font = font
            label.translatesAutoresizingMaskIntoConstraints = false
            return label
        }()
        view.addSubview(component)
        
        NSLayoutConstraint.activate([
            component.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 25),
            component.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            component.topAnchor.constraint(equalTo: view.topAnchor, constant: top)
        ])
    }
    
}
