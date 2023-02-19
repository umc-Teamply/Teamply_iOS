//
//  selectProjectViewController.swift
//  Teamply
//
//  Created by 아라 on 2023/01/27.
//

import UIKit

class selectProjectViewController: UIViewController, UIGestureRecognizerDelegate {
    // MARK: - IBOutlet
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var submitButton: UIButton!
    
    @IBOutlet weak var project1View: UIView!
    @IBOutlet weak var project2View: UIView!
    @IBOutlet weak var project3View: UIView!
    @IBOutlet weak var project4View: UIView!
    @IBOutlet weak var project5View: UIView!
    @IBOutlet weak var project6View: UIView!
    
    @IBOutlet weak var border1View: UIView!
    @IBOutlet weak var border2View: UIView!
    @IBOutlet weak var border3View: UIView!
    @IBOutlet weak var border4View: UIView!
    @IBOutlet weak var border5View: UIView!
    @IBOutlet weak var border6View: UIView!
    
    
    // MARK: - Properties
    let colorArray: [String] = ["team1", "team2", "team3"]
    let nameArray: [String] = ["바둑의 이해", "스페인 문화 이해", "한국 소설 읽기"]
    lazy var projectArray: [UIView] = [project1View, project2View, project3View, project4View, project5View, project6View]
    var projectHandler: ((String) -> ())?
    var projectName: String = "프로젝트 이름"
    var nextLeadingAnchor: CGFloat = 0
    let message: UILabel = {
        let label = UILabel()
        
        label.text = "프로젝트가 없습니다"
        label.textColor = .gray4
        label.font = .cap1
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let checkImage: UIImageView = {
        let check = UIImageView()
        
        check.image = UIImage(named: "check")
        check.translatesAutoresizingMaskIntoConstraints = false
        return check
    }()
    
    // MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        titleInit()
        buttonInit()
        viewInit()
        borderInit()
        if isExistProject() {
            setColorView()
        } else {
            setMessage()
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        var idx = nameArray.firstIndex(of: projectName)
        
        switch idx {
        case 0:
            project1Tap((Any).self)
            break
        case 1:
            project2Tap((Any).self)
            break
        case 2:
            project3Tap((Any).self)
            break
        case 3:
            project4Tap((Any).self)
            break
        case 4:
            project5Tap((Any).self)
            break
        case 5:
            project5Tap((Any).self)
            break
        default:
            borderInit()
        }
    }
    
    // MARK: - Method
    func titleInit() {
        titleLabel.text = "프로젝트 선택"
        titleLabel.font = .sub2
        titleLabel.textColor = .basic2
        
        submitButton.setTitle("선택 완료", for: .normal)
        submitButton.setTitleColor(.basic1, for: .normal)
        submitButton.titleLabel?.font = .btn
        submitButton.backgroundColor = .basic2
        submitButton.titleLabel?.tintColor = .basic1
        submitButton.makeRound(radius: 10)
    }
    
    func buttonInit() {
        if isExistProject() {
            submitButton.setTitle("선택 완료", for: .normal)
            submitButton.setTitleColor(.basic1, for: .normal)
            submitButton.titleLabel?.font = .btn
            submitButton.backgroundColor = .basic2
            submitButton.titleLabel?.tintColor = .basic1
            submitButton.makeRound(radius: 10)
        } else {
            submitButton.setTitle("확인", for: .normal)
            submitButton.setTitleColor(.basic1, for: .normal)
            submitButton.titleLabel?.font = .btn
            submitButton.backgroundColor = .basic2
            submitButton.titleLabel?.tintColor = .basic1
            submitButton.makeRound(radius: 10)
        }
    }
    
    func viewInit() {
        project1View.backgroundColor = .basic1
        project2View.backgroundColor = .basic1
        project3View.backgroundColor = .basic1
        project4View.backgroundColor = .basic1
        project5View.backgroundColor = .basic1
        project6View.backgroundColor = .basic1
        
        border1View.backgroundColor = .basic1
        border2View.backgroundColor = .basic1
        border3View.backgroundColor = .basic1
        border4View.backgroundColor = .basic1
        border5View.backgroundColor = .basic1
        border6View.backgroundColor = .basic1
        
        project1View.makeRound(radius: 5)
        project2View.makeRound(radius: 5)
        project3View.makeRound(radius: 5)
        project4View.makeRound(radius: 5)
        project5View.makeRound(radius: 5)
        project6View.makeRound(radius: 5)
        
        project1View.isUserInteractionEnabled = true
        project2View.isUserInteractionEnabled = true
        project3View.isUserInteractionEnabled = true
        project4View.isUserInteractionEnabled = true
        project5View.isUserInteractionEnabled = true
        project6View.isUserInteractionEnabled = true
    }
    
    func borderInit() {
        border1View.makeRound(radius: 5)
        border2View.makeRound(radius: 5)
        border3View.makeRound(radius: 5)
        border4View.makeRound(radius: 5)
        border5View.makeRound(radius: 5)
        border6View.makeRound(radius: 5)
        
        border1View.layer.borderWidth = 2
        border2View.layer.borderWidth = 2
        border3View.layer.borderWidth = 2
        border4View.layer.borderWidth = 2
        border5View.layer.borderWidth = 2
        border6View.layer.borderWidth = 2
        
        border1View.layer.borderColor = UIColor.basic1?.cgColor
        border2View.layer.borderColor = UIColor.basic1?.cgColor
        border3View.layer.borderColor = UIColor.basic1?.cgColor
        border4View.layer.borderColor = UIColor.basic1?.cgColor
        border5View.layer.borderColor = UIColor.basic1?.cgColor
        border6View.layer.borderColor = UIColor.basic1?.cgColor
    }
    
    func setColorView() {
        var idx = 0
        for c in colorArray {
            projectArray[idx].backgroundColor = UIColor(named: c)
            idx += 1
        }
    }
    
    func setMessage() {
        view.addSubview(message)
        
        message.topAnchor.constraint(equalTo: self.titleLabel.bottomAnchor, constant: 24).isActive = true
        message.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 24).isActive = true
    }
    
    func isExistProject() -> Bool {
        return true
    }
    
    // MARK: IBAction
    @IBAction func saveProject(_ sender: Any) {
        projectHandler?(self.projectName)
        self.presentingViewController?.dismiss(animated: true)
    }
    
    // MARK: Gesture
    
    @IBAction func project1Tap(_ sender: Any) {
        borderInit()
        border1View.layer.borderColor = project1View.backgroundColor?.cgColor
        
        projectName = nameArray[0]
        
        project1View.addSubview(checkImage)

        NSLayoutConstraint.activate([
            checkImage.centerYAnchor.constraint(equalTo: project1View.centerYAnchor),
            checkImage.centerXAnchor.constraint(equalTo: project1View.centerXAnchor),
            checkImage.widthAnchor.constraint(equalToConstant: 19.38),
            checkImage.heightAnchor.constraint(equalToConstant: 12.92),
        ])
        
    }

    @IBAction func project2Tap(_ sender: Any) {
        borderInit()
        border2View.layer.borderColor = project2View.backgroundColor?.cgColor
        
        projectName = nameArray[1]
        
        project2View.addSubview(checkImage)

        NSLayoutConstraint.activate([
            checkImage.centerYAnchor.constraint(equalTo: project2View.centerYAnchor),
            checkImage.centerXAnchor.constraint(equalTo: project2View.centerXAnchor),
            checkImage.widthAnchor.constraint(equalToConstant: 19.38),
            checkImage.heightAnchor.constraint(equalToConstant: 12.92),
        ])
    }
    
    @IBAction func project3Tap(_ sender: Any) {
        borderInit()
        border3View.layer.borderColor = project3View.backgroundColor?.cgColor
        
        project3View.addSubview(checkImage)

        NSLayoutConstraint.activate([
            checkImage.centerYAnchor.constraint(equalTo: project3View.centerYAnchor),
            checkImage.centerXAnchor.constraint(equalTo: project3View.centerXAnchor),
            checkImage.widthAnchor.constraint(equalToConstant: 19.38),
            checkImage.heightAnchor.constraint(equalToConstant: 12.92),
        ])
    }
    
    @IBAction func project4Tap(_ sender: Any) {
        borderInit()
        border4View.layer.borderColor = project4View.backgroundColor?.cgColor
        
        project4View.addSubview(checkImage)

        NSLayoutConstraint.activate([
            checkImage.centerYAnchor.constraint(equalTo: project4View.centerYAnchor),
            checkImage.centerXAnchor.constraint(equalTo: project4View.centerXAnchor),
            checkImage.widthAnchor.constraint(equalToConstant: 19.38),
            checkImage.heightAnchor.constraint(equalToConstant: 12.92),
        ])
    }
    
    @IBAction func project5Tap(_ sender: Any) {
        borderInit()
        border5View.layer.borderColor = project5View.backgroundColor?.cgColor
        
        project5View.addSubview(checkImage)

        NSLayoutConstraint.activate([
            checkImage.centerYAnchor.constraint(equalTo: project5View.centerYAnchor),
            checkImage.centerXAnchor.constraint(equalTo: project5View.centerXAnchor),
            checkImage.widthAnchor.constraint(equalToConstant: 19.38),
            checkImage.heightAnchor.constraint(equalToConstant: 12.92),
        ])
    }
    
    @IBAction func project6Tap(_ sender: Any) {
        borderInit()
        border6View.layer.borderColor = project6View.backgroundColor?.cgColor
        
        project6View.addSubview(checkImage)

        NSLayoutConstraint.activate([
            checkImage.centerYAnchor.constraint(equalTo: project6View.centerYAnchor),
            checkImage.centerXAnchor.constraint(equalTo: project6View.centerXAnchor),
            checkImage.widthAnchor.constraint(equalToConstant: 19.38),
            checkImage.heightAnchor.constraint(equalToConstant: 12.92),
        ])
    }
}
