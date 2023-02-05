//
//  CompletedTabmanViewController.swift
//  Teamply
//
//  Created by 아라 on 2023/01/31.
//

import UIKit

class CompletedViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    // MARK: - IBOutlet
    @IBOutlet weak var semesterTableView: UITableView!
    
    // MARK: - Properties
    let semesterList: [String] = ["2022년 1학기", "2021년 2학기"]
    let semesterCell = "SemesterCell"
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
    // MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        semesterTableView.delegate = self
        semesterTableView.dataSource = self
        setFooter()
    }
    
    // MARK: - Method
    func setFooter() {
        let footer = UIView(frame: CGRect(x: 0, y: 0, width: view.frame.size.width, height: 5))
        footer.backgroundColor = .gray0
        semesterTableView.tableFooterView = footer
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        semesterList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: semesterCell, for: indexPath) as! SemesterProjectTableViewCell
        
        cell.semesterLabel.text = semesterList[indexPath.row]
        
        cell.projectLists = projectLists[indexPath.row]
        cell.setProjectStackView()
        
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        5.0
    }


}
