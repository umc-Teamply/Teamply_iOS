//
//  CompletedTabmanViewController.swift
//  Teamply
//
//  Created by 아라 on 2023/01/31.
//

import UIKit

class CompletedViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    // MARK: - IBOutlet
    @IBOutlet weak var semesterProjectTableView: UITableView!
    
    // MARK: - Properties
    let semesterList: [String] = ["2022년 1학기", "2021년 2학기"]
    // MARK: - LifeCycle
    let semesterCell = "SemesterCell"
    override func viewDidLoad() {
        super.viewDidLoad()
        semesterProjectTableView.delegate = self
        semesterProjectTableView.dataSource = self
     
    }
    
    // MARK: - Method
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        semesterList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCell(withIdentifier: semesterCell, for: indexPath) as! SemesterProjectTableViewCell
        cell.semesterLabel.text = semesterList[indexPath.row]
        return cell
        
    }
  

}
