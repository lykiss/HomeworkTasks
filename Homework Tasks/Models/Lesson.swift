//
//  Lesson.swift
//  Homework Tasks
//
//  Created by Luca Vitkus on 17.10.2020.
//

import Foundation
import RealmSwift

class Lesson: Object {
    @objc dynamic var id: String = UUID().uuidString
    @objc dynamic var iconSymbol: String = ""
    @objc dynamic var name: String = ""
    let tasks = List<Task>()
    
    override class func primaryKey() -> String? {
        return "id"
    }
}

struct LessonModel {
    var id: String
    var iconSymbol: String
    var name: String
    var tasks: [TaskModel] = []
    
}
