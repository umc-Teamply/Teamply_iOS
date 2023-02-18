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
                ["수학의 역사", "수학 기초 및 역사에 대한 조사", "2022.10.15"],
                ["댄스 스포츠", "파트너와 함께 하는 댄스 스포츠", "2022.09.12"]
            ],[
                ["행복한 금융생활", "저축의 원리를 배우고 직접 저축해보기", "2022.04.11"],
                ["AI란?", "AI가 활용되는 사례 조사 및 그에 따른 인식 조사", "2022.03.23"],
                ["영화 제작기", "영화 제작 과정 배우고 영상 제작해보기", "2022.03.02"]
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

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let impressionVC = UIStoryboard.init(name: "Impression", bundle: nil)
        guard let nextVC = impressionVC.instantiateViewController(withIdentifier: "ImpressionVC") as? ImpressionViewController else { return }
        
        nextVC.modalPresentationStyle = .fullScreen
        self.present(nextVC, animated: true, completion: nil)
    }
}
