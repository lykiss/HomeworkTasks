//
//  CreateTaskViewController.swift
//  Homework Tasks
//
//  Created by Vitaliy Podolskiy on 10.10.2020.
//

import UIKit

class CreateTaskViewController: UIViewController {
    
    @IBOutlet weak var closeButton: UIButton! {
        didSet {
            closeButton.layer.cornerRadius = 12
            
            closeButton.layer.shadowColor = UIColor.gray.cgColor
            closeButton.layer.shadowOffset = .zero
            closeButton.layer.shadowRadius = 8
            closeButton.layer.shadowOpacity = 0.3
            
            closeButton.addTarget(self, action: #selector(closeButtonTapped), for: .touchUpInside)
        }
    }
    
    @IBOutlet weak var roundWhiteView: UIView!
    
    @IBOutlet weak var textField: UITextField! {
        didSet {
            let color = #colorLiteral(red: 0.662745098, green: 0.7333333333, blue: 0.7882352941, alpha: 1)
            textField.attributedPlaceholder = NSAttributedString(string: "Task name",
                                                                 attributes: [NSAttributedString.Key.foregroundColor: color])
        }
    }
    
    @IBOutlet weak var calendarButton: UIButton!
    @IBOutlet weak var timeButton: UIButton!
    @IBOutlet weak var remindMeSwitch: UISwitch!

    @objc private func closeButtonTapped() {
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func calendarButtonTapped(_ sender: UIButton) {
        print(#function)
        print(#line)
    }
    
    @IBAction func timeButtonTapped(_ sender: UIButton) {
        print(#function)
        print(#line)
    }
    
    @IBAction func onSwitch(_ sender: UISwitch) {
        print(#function)
        print(#line)
        
        print(sender.isOn)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
   
}

//test
//test
