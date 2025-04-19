//
//  ViewController.swift
//  Strava Interview Prep2
//
//  Created by Steven Lin on 2025-04-19.
//

import UIKit

class ViewController: UIViewController {
    
    let label = UILabel()
    let result = UILabel()
    let button = UIButton(type: .system)
    
    var tapped: Bool = false
    let buttonWidth = 300.0
    let buttonHeight = 50.0
    let passVC = PasswordView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white

        label.text = "Hello UIKit"
        label.textAlignment = .center
        label.frame = CGRect(x: 50, y: 100, width: 300, height: 50)
        label.font = UIFont.systemFont(ofSize: 23, weight: .bold)
        view.addSubview(label)
        
        result.text = "😟"
        result.textAlignment = .center
        result.font = UIFont.systemFont(ofSize: 15)
        result.frame = CGRect(x: 50, y: 160, width: 300, height: 50)
        view.addSubview(result)

        button.setTitle("Tap Me", for: .normal)
        button.frame = CGRect(x: view.bounds.midX - buttonWidth/4,
                              y: view.bounds.midY - buttonHeight/2,
                              width: buttonWidth / 2,
                              height: buttonHeight)
        button.layer.borderWidth = 2
        button.layer.borderColor = UIColor.systemBlue.cgColor
        button.layer.cornerRadius = 8
        button.layer.masksToBounds = true
        
        button.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
        view.addSubview(button)
        
        passVC.delegate = self
    }

    @objc func buttonTapped() {
        if tapped == true {
            label.text = "Tap Me"
            tapped = !(tapped)
        } else {
            passVC.modalPresentationStyle = .fullScreen
            present(passVC, animated: true, completion: nil)
            label.text = "You tapped the button!"
            tapped = !(tapped)
        }
       }
}

extension ViewController: PasswordViewControllerDelegate {
    func passwordView(_vc: PasswordView, didEnterCode code: String) -> Bool {
        if code == "1122" {
            result.text = "Yay you did it!"
            return true
        }
        return false
    }
}
