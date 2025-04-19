//
//  PasswordView.swift
//  Strava Interview Prep2
//
//  Created by Steven Lin on 2025-04-19.
//

import UIKit

protocol PasswordViewControllerDelegate: AnyObject {
    func passwordView(_vc: PasswordView, didEnterCode code: String) -> Bool
}

class PasswordView: UIViewController {
    
    var finalNum: String = ""
    let button1 = UIButton(type: .system)
    let button2 = UIButton(type: .system)
    let button3 = UIButton(type: .system)
    let submit = UIButton(type: .system)
    let label = UILabel()
    
    let h = 50.0
    var delegate: PasswordViewControllerDelegate!
    var res: Bool!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        
        label.text = finalNum
        label.textAlignment = .center
        label.frame = CGRect(x: 50, y: 100, width: 300, height: 50)
        view.addSubview(label)
        
        
        button1.setTitle("1", for: .normal)
        button2.setTitle("2", for: .normal)
        button3.setTitle("Back", for: .normal)
        submit.setTitle("Submit", for: .normal)

        
        button1.frame = CGRect(x: view.bounds.midX - (2 * h), y: view.bounds.midY - h/2, width: h, height: h)
        button2.frame = CGRect(x: view.bounds.midX + h, y: view.bounds.midY - h/2, width: h, height: h)
        button3.frame = CGRect(x: 30, y: 50, width: 50, height: 30)
        submit.frame = CGRect(x: view.bounds.midX - h/2, y: view.bounds.midY + 80.0, width: 50.0, height: 30.0)
        
        button1.addTarget(self, action: #selector(button1Press), for: .touchUpInside)
        button2.addTarget(self, action: #selector(button2Press), for: .touchUpInside)
        button3.addTarget(self, action: #selector(button3Press), for: .touchUpInside)
        submit.addTarget(self, action: #selector(submitPress), for: .touchUpInside)
        view.addSubview(button1)
        view.addSubview(button2)
        view.addSubview(button3)
        view.addSubview(submit)
    }
    
    
    @objc func button1Press() {
        finalNum += "1"
        label.text = finalNum
    }
    
    @objc func button2Press() {
        finalNum += "2"
        label.text = finalNum
    }
    
    @objc func button3Press() {
        self.dismiss(animated: true, completion: nil)
    }
    
    @objc func submitPress() {
        res = delegate.passwordView(_vc: self, didEnterCode: finalNum)
        if res {
            self.dismiss(animated: true, completion: nil)
        } else {
            finalNum = ""
            label.text = finalNum
            animatedFlash(color: .systemPink)
        }
    }
    
    func animatedFlash(color: UIColor, duration: TimeInterval = 0.7) {
        let original = view.backgroundColor

        UIView.animate(withDuration: 0.2, animations: {
            self.view.backgroundColor = color
        })
        { _ in
            UIView.animate(withDuration: 0.2, delay: duration, options: [], animations: {
                self.view.backgroundColor = original
        })
        }
    }
}


