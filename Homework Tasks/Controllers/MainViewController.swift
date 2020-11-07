//
//  ViewController.swift
//  Homework Tasks
//
//  Created by Vitaliy Podolskiy on 10.10.2020.
//

import UIKit

class MainViewController: UIViewController {
    
    var lessons: [LessonModel] = []

    @IBOutlet var addButtons: [UIButton]! {
        didSet {
            addButtons.forEach { addButton in
                addButton.layer.cornerRadius = 12
                
                addButton.layer.shadowColor = UIColor.gray.cgColor
                addButton.layer.shadowOffset = .zero
                addButton.layer.shadowRadius = 8
                addButton.layer.shadowOpacity = 0.3
            }
        }
    }
    

    @IBOutlet weak var borderRoundView: UIView! {
        didSet {
            borderRoundView.layer.cornerRadius = 30
            borderRoundView.layer.borderWidth = 1
            borderRoundView.layer.borderColor = #colorLiteral(red: 0.662745098, green: 0.7333333333, blue: 0.7882352941, alpha: 1).cgColor
            
            borderRoundView.backgroundColor = .clear
        }
    }
    @IBOutlet weak var insideRoundView: UIView! {
        didSet {
            insideRoundView.layer.cornerRadius = 25
        }
    }
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var tasksForTodayLabel: UILabel!
    
    @IBOutlet weak var progressView: UIProgressView!
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        fetchLessons()
        
        collectionView.contentInset = UIEdgeInsets(top: 0, left: 20, bottom: 0, right: 20)
        
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.scrollDirection = .horizontal
        collectionView.collectionViewLayout = flowLayout
    }
    
    @IBAction func addLessonTapped(_ sender: UIButton) {
        let alertController = UIAlertController(title: "Добавить урок", message: "Введите название урока", preferredStyle: .alert)
        alertController.addTextField { UITextField in
            
            
            
        }
        let okAktion = UIAlertAction(title: "OK", style: .default) { _ in
           if let text = alertController.textFields?.first?.text, text != "" {
                self.creatLesson(with: text)
            }
            
        }
        let cancelAction = UIAlertAction(title: "Censel", style: .cancel, handler: nil)
        
        alertController.addAction(okAktion)
        alertController.addAction(cancelAction)
        
        self.present(alertController, animated: true, completion: nil)
    }

}

extension MainViewController {
    
    private func creatLesson(with name: String) {
        let lesson = Lesson()
        lesson.name = name
        lesson.addWithPrimaryKey()
        
        fetchLessons()
        
    }
    
    private func fetchLessons() {
        guard
            let objects = RealmObjects.objects(type: Lesson.self) else {
            return
        }
        let preparedLessons: [LessonModel] = objects.map {
            return LessonModel(id: $0.id,
                               iconSymbol: $0.iconSymbol,
                               name: $0.name,
                               tasks: $0.tasks.map { task in
                return TaskModel(id: task.id,
                                 name: task.name,
                                 deadline: task.deadline,
                                 notificationTime: task.notificationTime,
                                 isRemind: task.isRemind,
                                 isFinished: task.isFinished)
            })
        }
        
        lessons = preparedLessons
        
        DispatchQueue.main.async {
            self.collectionView.reloadData()
        }
    }
    
}

extension MainViewController: UICollectionViewDataSource, UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection select: Int) -> Int {
        return lessons.count
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "collectionCell", for: indexPath) as! LessonCollectionViewCell
        cell.configure(for: lessons[indexPath.item])
        return cell
    }
}


extension MainViewController: UICollectionViewDelegateFlowLayout{
     func collectionView (forChildContentContainer container: UIContentContainer, withParentContainerSize parentSize: CGSize) -> CGSize {
            return CGSize(width: 150, height: 180)
    }
}


