//
//  LessonCollectionViewCell.swift
//  Homework Tasks
//
//  Created by Luca Vitkus on 17.10.2020.
//

import UIKit

class LessonCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var roundView: UIView! {
        didSet {
            roundView.layer.cornerRadius = 10
        }
    }
    
    @IBOutlet weak var iconLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var tasksCountLabel: UILabel!
    
    func configure(for model: LessonModel) {
        self.iconLabel.text = model.iconSymbol
        self.nameLabel.text = model.name
        self.tasksCountLabel.text = "\(model.tasks.count) задач"
        roundView.backgroundColor = randomColor()
    }
    
    private func randomColor() -> UIColor {
        let colors: [UIColor] = [ #colorLiteral(red: 0.5450980392, green: 0.05490196078, blue: 0.5450980392, alpha: 1),  #colorLiteral(red: 1, green: 0.3568627451, blue: 0.4549019608, alpha: 1), #colorLiteral(red: 0.8392156863, green: 0.631372549, blue: 1, alpha: 1)]
        return colors[Int.random(in: 0 ..< colors.count)]
        
    }
}
