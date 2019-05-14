//
//  BaseDao.swift
//  MyProject
//
//  Created by Admiya on 2019/05/04.
//  Copyright © 2019 Admiya. All rights reserved.
//
import RealmSwift

class RealmBaseDao <T: Object> {
    let realm: Realm

    init() {
        try! realm = Realm()
        print(Realm.Configuration.defaultConfiguration.fileURL!)
    }

    /// 新規主キーを発行する
    ///
    /// - Returns: 新id (primaryKey無いときはnil)
    func newId() -> Int? {
        guard let key = T.primaryKey() else {
            return nil
        }
        if let last = realm.objects(T.self).last,
            let lastId = last[key] as? Int {
            return lastId + 1
        } else {
            return 1
        }
    }

    /// 新規主キーを発行する
    ///
    /// - Returns: 新id
    func newStrId() -> String {
        let format = DateFormatter()
        format.dateFormat = "yyyyMMddHHmmss"
        return format.string(from: Date())
    }

    /// 全レコードを取得する
    ///
    func findAll() -> Results<T> {
        return realm.objects(T.self)
    }
    
    /// 最初のレコードのみ取得する
    ///
    func findFirst() -> T? {
        return findAll().first
    }
    
    /// 最後のレコードのみ取得する
    ///
    func findLast() -> T? {
        return self.findAll().last
    }

    /// 指定したキーのレコードを取得する
    ///
    func findFirst(key: AnyObject) -> T? {
        return realm.object(ofType: T.self, forPrimaryKey: key)
    }
    
    /// 指定したレコードを追加する
    ///
    /// - Parameters:
    ///   - entity: 登録レコード
    func add(entity :T) {
        do {
            try realm.write {
                realm.add(entity)
            }
        } catch let error as NSError {
            print(error.description)
        }
    }

    /// 指定したレコードを更新する
    ///
    /// - Parameters:
    ///   - entity: 更新レコード
    ///   - block: ブロック処理
    /// - Returns: 成功, 失敗 => true, false
    func put(entity: T, block:(() -> Void)? = nil) -> Bool {
        do {
            try realm.write {
                block?()
                realm.add(entity, update: true)
            }
            return true
        } catch let error as NSError {
            print(error.description)
        }
        return false
    }

    /// 指定したレコードを削除する
    ///
    /// - Parameters:
    ///   - entity: 削除対象のエンティティ
    func delete(entity: T) {
        try! realm.write {
            realm.delete(entity)
        }
    }
    
    /// 全レコードを削除する
    ///
    func deleteAll() {
        try! realm.write {
            realm.deleteAll()
        }
    }
    
}
