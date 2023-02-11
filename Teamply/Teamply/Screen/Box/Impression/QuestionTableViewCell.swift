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
    
    override func awakeFromNib() {
        super.awakeFromNib()
        textViewInit()
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
        answerTextView.heightAnchor.constraint(equalToConstant: 48).isActive = true
    }
    
    func filledAnswer() {
        resizingTextView()
        answerTextView.backgroundColor = .basic1
        answerTextView.makeShadow(.gray1!, 1, CGSize(width: 0, height: 3), 5)
    }
    
    func resizingTextView() {
        let size = CGSize(width: answerTextView.frame.width, height: .infinity)
        let estimatedSize = answerTextView.sizeThatFits(size)
        
        answerTextView.reloadInputViews()
        answerTextView.setNeedsUpdateConstraints()
    }
}

extension QuestionTableViewCell: UITextViewDelegate {
    //수정 시작
    func textViewDidBeginEditing(_ textView: UITextView) {
        if let delegate = delegate {
            delegate.updateTextViewHeight(self, textView)
        }
        answerTextView.backgroundColor = .basic1
        answerTextView.makeShadow(.gray1!, 1, CGSize(width: 0, height: 3), 5)
    }
    
    //수정 끝
    func textViewDidEndEditing(_ textView: UITextView) {
        resizingTextView()
    }
}
