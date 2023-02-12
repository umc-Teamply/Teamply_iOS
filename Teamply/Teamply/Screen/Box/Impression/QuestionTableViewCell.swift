//
//  QuestionTableViewCell.swift
//  Teamply
//
//  Created by 아라 on 2023/02/11.
//

import UIKit

protocol TableViewCellDelegate:class {
    func updateTextViewHeight(_ cell:QuestionTableViewCell,_ textView:UITextView)
}

class QuestionTableViewCell: UITableViewCell {
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var answerTextView: UITextView!
    
    weak var delegate: TableViewCellDelegate?
    var preView: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        textViewInit()
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.preView.endEditing(true)
        self.answerTextView.resignFirstResponder()
    }
    
    func labelInit() {
        questionLabel.translatesAutoresizingMaskIntoConstraints = false
        questionLabel.font = .sub1
        questionLabel.textColor = .basic2
        questionLabel.heightAnchor.constraint(equalToConstant: 23).isActive = true
    }
    
    func textViewInit() {
        answerTextView.delegate = self
        answerTextView.sizeToFit()
        answerTextView.isScrollEnabled = false
        answerTextView.translatesAutoresizingMaskIntoConstraints = false
        answerTextView.makeRound(radius: 15)
        answerTextView.textColor = .basic2
        answerTextView.tintColor = .gray4
        answerTextView.font = .cap2
        answerTextView.textContainerInset = .init(top: 24, left: 24, bottom: 24, right: 24)
    }
    func emptyAnswer() {
        answerTextView.backgroundColor = .gray0
    }
    
    func filledAnswer() {
        //resizingTextView()
        answerTextView.backgroundColor = .basic1
        answerTextView.makeShadow(.gray1!, 1, CGSize(width: 0, height: 3), 5)
    }
    
    func resizingTextView() {
        let size = CGSize(width: answerTextView.frame.width, height: .infinity)
        answerTextView.sizeThatFits(size)
        answerTextView.reloadInputViews()
        answerTextView.setNeedsUpdateConstraints()
    }

}

extension QuestionTableViewCell: UITextViewDelegate {
    //수정 시작
    func textViewDidBeginEditing(_ textView: UITextView) {
        if textView.text.isEmpty{
            textView.backgroundColor = .basic1
            textView.makeShadow(.gray1!, 1, CGSize(width: 0, height: 3), 5)
            resizingTextView()
        }
        textView.isScrollEnabled = true
        textView.contentInset = .init(top: 0, left: 0, bottom: 0, right: 0)
        textView.textContainerInset = .init(top: 24, left: 24, bottom: 24, right: 24)
        textView.scrollIndicatorInsets = .init(top: 24, left: 24, bottom: 24, right: 24)
        if let delegate = delegate {
            delegate.updateTextViewHeight(self, textView)
        }
    }
    
    //수정 끝
    func textViewDidEndEditing(_ textView: UITextView) {
        textView.isScrollEnabled = false
        resizingTextView()
    }

}
