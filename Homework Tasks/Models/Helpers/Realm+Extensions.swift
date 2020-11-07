//
//  Realm+Extensions.swift
//  Homework Tasks
//
//  Created by Luca Vitkus on 17.10.2020.
//

import Foundation
import RealmSwift

extension Object {
    
    ///добавление в бд
    func add() {
        let realm = try? Realm()
        try! realm?.write {
            realm?.add(self)
            
        }
    }
    
    ///добавление объекта в бд с уникальным ключом
    func addWithPrimaryKey() {
        let realm = try? Realm()
        try! realm?.write {
            realm?.add(self, update: .all)
            
        }
    }
    
    //Обновление объекта в БД
    // Параметр updateBlock - вынос обновления наружу
    func update(updateBlock: () -> ()) {
        let realm = try? Realm()
        try! realm?.write(updateBlock)
        
    }
    //удаление объекта из бд
    func delete() {
        let realm = try? Realm()
        try! realm?.write {
            realm?.delete(self)
        }
        
    }
}
