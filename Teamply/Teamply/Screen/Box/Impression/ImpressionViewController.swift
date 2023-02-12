//
//  ImpressionViewController.swift
//  Teamply
//
//  Created by 아라 on 2023/02/11.
//

import UIKit

class ImpressionViewController: UIViewController {
    
    @IBOutlet weak var projectNameLabel: UILabel!
    @IBOutlet weak var questionTableView: UITableView!
    
    let questionList = ["어떤것이 가장 기억에 남나요?", "이 프로젝트를 통해 어떤 것이 성장했나요?", "이 프로젝트를 하면서 아쉬운 점이 있었나요?"]
    
    let answerList: [String] = []
    let questionCell = "QuestionCell"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableViewInit()
        labelInit()
    }

    
    func labelInit() {
        projectNameLabel.font = .sub1
        projectNameLabel.textColor = .basic2
        projectNameLabel.text = "팀플리"
    }
    
    func tableViewInit() {
        questionTableView.delegate = self
        questionTableView.dataSource = self
        questionTableView.separatorStyle = .none
    }
    
    @IBAction func backToBox(_ sender: Any) {
        self.presentingViewController?.dismiss(animated: true)
    }
    
}

extension ImpressionViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        questionList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: questionCell, for: indexPath) as! QuestionTableViewCell
        cell.delegate = self
        cell.questionLabel.text = questionList[indexPath.row]
        
        if answerList.isEmpty {
            cell.emptyAnswer()
        } else {
            cell.answerTextView.text = answerList[indexPath.row]
            cell.filledAnswer()
        }
        if indexPath.row == 3 {
            cell.emptyAnswer()
        }
        cell.preView = self.view
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
}

extension ImpressionViewController: TableViewCellDelegate {
    func updateTextViewHeight(_ cell: QuestionTableViewCell, _ textView: UITextView) {
        let size = textView.bounds.size
        
        let newSize = questionTableView.sizeThatFits(CGSize(width: size.width, height: CGFloat.greatestFiniteMagnitude))
        if size.height != newSize.height {
            UIView.setAnimationsEnabled(false)
            questionTableView.beginUpdates()
            questionTableView.endUpdates()
            UIView.setAnimationsEnabled(true)
        }
    }
}
