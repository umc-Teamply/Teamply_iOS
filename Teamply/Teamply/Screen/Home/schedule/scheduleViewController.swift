//
//  scheduleViewController.swift
//  Teamply
//
//  Created by 아라 on 2023/01/26.
//

import UIKit
import FSCalendar

class scheduleViewController: UIViewController {
    // MARK: - IBOutlet
    @IBOutlet weak var userScheduleLabel: UILabel!
    @IBOutlet weak var calendarView: FSCalendar!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var scheduleTableView: UITableView!
    
    // MARK: - Properties
    
    // MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()

    }

    //MARK: - IBAction
    @IBAction func backToHome(_ sender: Any) {
    }
    
}
