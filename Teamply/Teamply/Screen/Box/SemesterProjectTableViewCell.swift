//
//  SemesterProjectTableViewCell.swift
//  Teamply
//
//  Created by 아라 on 2023/02/01.
//

import UIKit

class SemesterProjectTableViewCell: UITableViewCell {
    @IBOutlet weak var semesterLabel: UILabel!
    @IBOutlet weak var semesterView: UIView!
    @IBOutlet weak var projectStackView: UIStackView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setSemesterView()
    }

    func setSemesterView() {
        semesterView.backgroundColor = .gray0
        setSemesterLabel()
    }
    
    func setSemesterLabel() {
        semesterView.addSubview(semesterLabel)
        
        semesterLabel.translatesAutoresizingMaskIntoConstraints = false
        semesterLabel.textColor = .gray3
        semesterLabel.font = .cap3
        semesterLabel.backgroundColor = .gray1
        semesterLabel.makeRound(radius: 15)
    
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }

}
