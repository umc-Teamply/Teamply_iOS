//
//  addTeamProjectViewController.swift
//  Teamply
//
//  Created by 아라 on 2023/01/23.
//

import UIKit

class addTeamProjectViewController: UIViewController {
    
    // MARK: - IBOutlet
    @IBOutlet weak var attendProjectButton: UIButton!
    @IBOutlet weak var createProjectButton: UIButton!
    
    // MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        attendButtonInit()
        createButtonInit()
    }
    
    // MARK: - Method
    func attendButtonInit() {
        attendProjectButton.alignTextLeft()
        attendProjectButton.setTitle(" 팀 프로젝트 추가 하기", for: .normal)
        attendProjectButton.titleLabel?.font = .sub2
        attendProjectButton.setTitleColor(.basic2, for: .normal)
    }
    
    func createButtonInit() {
        createProjectButton.alignTextLeft()
        createProjectButton.setTitle(" 새로 만들기", for: .normal)
        createProjectButton.titleLabel?.font = .sub2
        createProjectButton.setTitleColor(.basic2, for: .normal)
    }
    
    // MARK: - IBAction
    @IBAction func attendTeamProject(_ sender: Any) {
        let attendVC = UIStoryboard.init(name: "attendTeamProject", bundle: nil)
        guard let nextVC = attendVC.instantiateViewController(withIdentifier: "attendTeamProjectVC") as? attendTeamProjectViewController else { return }
        
        nextVC.modalPresentationStyle = .fullScreen
        self.present(nextVC, animated: true, completion: nil)
    }
    
    @IBAction func createNewTeamProject(_ sender: Any) {
        //스토리보드 이름
        let createVC = UIStoryboard.init(name: "createTeamProject", bundle: nil)
        //스토리보드 ID
        guard let nextVC = createVC.instantiateViewController(withIdentifier: "createTeamProjectVC") as? createTeamProjectViewController else { return }
        
        nextVC.modalPresentationStyle = .fullScreen
        self.present(nextVC, animated: true, completion: nil)
    }
    
    @IBAction func cancle(_ sender: Any) {
        self.presentingViewController?.dismiss(animated: true)
    }
}
