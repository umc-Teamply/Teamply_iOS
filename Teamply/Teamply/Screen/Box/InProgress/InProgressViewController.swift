//
//  inProgressTabmanViewController.swift
//  Teamply
//
//  Created by 아라 on 2023/01/31.
//

import UIKit

class InProgressViewController: UIViewController {
    // MARK: - IBOutlet
    @IBOutlet weak var semesterLabel: UILabel!
    @IBOutlet weak var projectStackView: UIStackView!
    
    // MARK: - Method
    let projectComponent: [[String]] = [["공간 프로젝트","졸업 전시","2022.9.19"],
                                        ["브랜드 경험 디자인","공모전","2020.9.22"],
                                        ["현대 디자인의 이해", "현대 디자인 조사 및 발표", "2022.10.15"],
                                        ["부모와 가정의 이해", "다양한 가정의 모습 탐구", "2022.09.12"],
                                        ["기초 GUI 디자인", "어플리케이션 클론", "2022.04.04"]]
    
    // MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        labelInit()
        setSemesterProject()
        // Do any additional setup after loading the view.
    }
    
    // MARK: - Method
    func labelInit() {
        semesterLabel.text = "2022년 2학기"
        semesterLabel.textColor = .gray3
        semesterLabel.font = .cap3
        semesterLabel.makeRound(radius: 15)
        semesterLabel.backgroundColor = .gray1
    }
    
    
    func setSemesterProject() {
        if isExistProject() {
            setProjectLayout()
        } else {
            projectStackView.backgroundColor = .basic1
            setMessage()
        }
    }
    
    func setProjectLayout() {
        for p in projectComponent{
            let project: UIView = {
                let view = UIView()
                view.translatesAutoresizingMaskIntoConstraints = false
                view.backgroundColor = .basic1
                view.heightAnchor.constraint(equalToConstant: 114).isActive = true
                view.leadingAnchor.constraint(equalTo: projectStackView.leadingAnchor)
                view.trailingAnchor.constraint(equalTo: projectStackView.trailingAnchor)
                view.topAnchor.constraint(equalTo: projectStackView.topAnchor)
                view.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(self.projectTapGesture)))
                
                return view
            }()
            projectStackView.addArrangedSubview(project)
            
            var idx = 0
            var top: CGFloat = 0
            var font: UIFont = .sub1
            for l in p {
                switch idx {
                case 0:
                    top = 15
                    idx += 1
                    font = .sub1
                    break
                case 1:
                    top = 43
                    idx += 1
                    font = .cap2
                    break
                case 2:
                    top = 74
                    font = .cap3
                    break
                default:
                    break
                }
                setProjectComponent(view: project, text: l, top: top, font: font)
            }
            let height = project.fs_height
            
            projectStackView.heightAnchor.constraint(equalToConstant: height).isActive
        }
        
        let division: UIView = {
            let line = UIView()
            line.translatesAutoresizingMaskIntoConstraints = false
            line.backgroundColor = .basic1
            line.heightAnchor.constraint(equalToConstant: 3).isActive = true
            line.leadingAnchor.constraint(equalTo: projectStackView.leadingAnchor)
            line.trailingAnchor.constraint(equalTo: projectStackView.trailingAnchor)
            line.topAnchor.constraint(equalTo: projectStackView.topAnchor)
            return line
        }()
        
        projectStackView.addArrangedSubview(division)
    }
   
    @objc func projectTapGesture(_ sender: UITapGestureRecognizer){
        let impressionVC = UIStoryboard.init(name: "Impression", bundle: nil)
        guard let nextVC = impressionVC.instantiateViewController(withIdentifier: "ImpressionVC") as? ImpressionViewController else { return }
        
        nextVC.modalPresentationStyle = .fullScreen
        self.present(nextVC, animated: true, completion: nil)
        
    }
    
    func setProjectComponent(view: UIView, text: String, top: CGFloat, font: UIFont) {
        let component: UILabel = {
            let label = UILabel()
            
            label.text = text
            label.textColor = .basic2
            label.font = font
            label.translatesAutoresizingMaskIntoConstraints = false
            return label
        }()
        view.addSubview(component)
        
        NSLayoutConstraint.activate([
            component.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 25),
            component.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            component.topAnchor.constraint(equalTo: view.topAnchor, constant: top)
        ])
    }
    
    func setMessage() {
        let message: UILabel = {
            let label = UILabel()
            
            label.text = "프로젝트가 없습니다"
            label.textColor = .gray4
            label.font = .cap1
            label.translatesAutoresizingMaskIntoConstraints = false
            return label
        }()
        projectStackView.addArrangedSubview(message)
        
        message.topAnchor.constraint(equalTo: self.projectStackView.topAnchor, constant: 20).isActive = true
        message.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 50).isActive = true
    }
    
    func isExistProject() -> Bool {
        return true
    }
    // MARK: - IBAction

}
