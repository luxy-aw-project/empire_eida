//
//  UserRequest.swift
//  MyProject
//
//  Created by Admiya on 2019/05/03.
//  Copyright © 2019 Admiya. All rights reserved.
//
import RealmSwift

class UserRequest<DomainType: Object> {
    let realm = try! Realm()

    func find(userId: String) -> DomainType? {
        print(Realm.Configuration.defaultConfiguration.fileURL!)
        return realm.objects(DomainType.self).filter("id == %@", userId).first
    }
    // 全部取ってくる
    func findAll() -> [DomainType] {
        return realm.objects(DomainType.self).map({$0})
    }
    // 条件指定
//    func find(predicate: NSPredicate) -> Results<DomainType> {
//        return realm.objects(DomainType.self).filter(predicate)
//    }
    // データ追加と更新
    func add(entity: DomainType) {
        let entity = entity
        try! realm.write {
//            realm.add(entity, update: true)
            realm.add(entity, update: true)
        }
    }
    // トランザクション
    func transaction(_ transactionBlock: () -> Void) {
        try! realm.write {
            transactionBlock()
        }
    }
}
