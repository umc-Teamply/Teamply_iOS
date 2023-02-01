//
//  ProjectTableViewCell.swift
//  Teamply
//
//  Created by 아라 on 2023/02/01.
//

import UIKit

class ProjectTableViewCell: UITableViewCell {
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var subTitleLabel: UILabel!
    @IBOutlet weak var termLabel: UILabel!
    
    var projectList: [[String]]! = [[]]
                      
    override func awakeFromNib() {
        super.awakeFromNib()
        setProject()
    }
    
    func setProject() {
        for p in projectList{
            var idx = 0
            for l in p {
                if idx == 0 {
                    titleLabel.text = l
                } else if idx == 1 {
                    subTitleLabel.text = l
                } else {
                    termLabel.text = l
                }
                idx += 1
            }
        }
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.textColor = .basic2
        titleLabel.font = .sub2
        
        subTitleLabel.translatesAutoresizingMaskIntoConstraints = false
        subTitleLabel.textColor = .basic2
        subTitleLabel.font = .cap2
        
        termLabel.translatesAutoresizingMaskIntoConstraints = false
        termLabel.textColor = .basic2
        termLabel.font = .cap3
        
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

}
