//
//  SemesterProjectTableViewCell.swift
//  Teamply
//
//  Created by 아라 on 2023/02/01.
//

import UIKit
import SnapKit

class SemesterProjectTableViewCell: UITableViewCell, UITableViewController, UITableViewDelegate, UITableViewDataSource {
    @IBOutlet weak var semesterLabel: UILabel!
    @IBOutlet weak var semesterView: UIView!
    @IBOutlet weak var projectTableView: UITableView!
    
    let projectCell = "ProjectCell"
    let projectLists: [[[String]]] =
        [
            [
                ["현대 디자인의 이해", "현대 디자인 조사 및 발표", "2022.10.15"],
                ["부모와 가정의 이해", "다양한 가정의 모습 탐구", "2022.09.12"]
            ],[
                ["기초 GUI 디자인", "어플리케이션 클론", "2022.04.04"]
            ]
        ]
    
    override func awakeFromNib() {
        super.awakeFromNib()
        projectTableView.delegate = self
        projectTableView.dataSource = self
        setSemesterView()
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
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        projectLists.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: projectCell, for: indexPath) as! ProjectTableViewCell
        
        cell.projectList = self.projectLists[indexPath.row]
        
        return cell
    }
    

}
