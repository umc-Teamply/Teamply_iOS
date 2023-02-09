//
//  AddTendencyViewController.swift
//  Teamply
//
//  Created by 아라 on 2023/02/08.
//

import UIKit

class AddTendencyViewController: UIViewController {
    @IBOutlet weak var cancleButton: UIButton!
    @IBOutlet weak var saveButton: UIButton!
    @IBOutlet weak var tendencyTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setBackground()
        buttonInit()
        textFieldInit()
    }

    func setBackground() {
        view.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.8)
    }
    
    func buttonInit() {
        cancleButton.setTitle("취소", for: .normal)
        cancleButton.setTitleColor(.basic1, for: .normal)
        cancleButton.titleLabel!.font = .head2
        cancleButton.tintColor = .basic1
        
        saveButton.setTitle("저장", for: .normal)
        saveButton.setTitleColor(.basic1, for: .normal)
        saveButton.titleLabel!.font = .head2
        saveButton.tintColor = .basic1
    }
    
    func textFieldInit() {
        tendencyTextField.becomeFirstResponder()
        tendencyTextField.textAlignment = .center
        tendencyTextField.textColor = .basic1
        tendencyTextField.font = .cap2
    }
    
    
    @IBAction func cancleAction(_ sender: Any) {
        self.presentingViewController?.dismiss(animated: true)
        
    }
    
    @IBAction func saveAction(_ sender: Any) {
        self.presentingViewController?.dismiss(animated: true)
    }
}
